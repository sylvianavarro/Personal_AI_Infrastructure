#!/usr/bin/env bash
# skill-hygiene.sh
#
# Semantic/relational hygiene checks for the skill ecosystem.
# Complements lint-agent-friendly.sh (structural) with content-aware checks.
#
# Origin: Cherry-picked from sylvianavarro/feat/community-skills-packs (commit 95f8070)
# Adapted: Case-sensitivity fix, sanitization patterns, safe Python heredocs,
#          exit code cap, INDEX_FILE passthrough to Python.
#
# Usage:
#   skill-hygiene.sh              # full scan (all skills)
#   skill-hygiene.sh skill-name   # single skill (incremental)
#
# Exit code: number of violations found (0 = clean, capped at 125)

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

SKILLS_DIR="$HOME/.claude/skills"
INDEX_FILE="$SKILLS_DIR/skill-index.json"

# Org-specific skills exempt from sanitization (update for your ecosystem)
SANITIZATION_ALLOWLIST=("invela-brand" "invela-design-system" "market-competitors" "ds-audit-handoff")

violations=0
warnings=0

fail() {
  local file="$1" rule="$2" message="$3" fix="$4"
  echo -e "${RED}FAIL${NC} [$rule] $file"
  echo "  Problem: $message"
  echo "  Fix: $fix"
  echo ""
  violations=$((violations + 1))
}

warn() {
  local file="$1" rule="$2" message="$3" fix="$4"
  echo -e "${YELLOW}WARN${NC} [$rule] $file"
  echo "  Problem: $message"
  echo "  Fix: $fix"
  echo ""
  warnings=$((warnings + 1))
}

pass() {
  local rule="$1" count="$2"
  echo -e "${GREEN}PASS${NC} [$rule] $count checked"
}

in_allowlist() {
  local skill="$1"
  for allowed in "${SANITIZATION_ALLOWLIST[@]}"; do
    [[ "$skill" == "$allowed" ]] && return 0
  done
  return 1
}

# Collect skill dirs to check
get_skill_dirs() {
  local target="${1:-}"
  if [[ -n "$target" ]]; then
    if [[ -d "$SKILLS_DIR/$target" ]]; then
      echo "$target"
    else
      echo "Error: skill '$target' not found at $SKILLS_DIR/$target" >&2
      exit 1
    fi
  else
    for d in "$SKILLS_DIR"/*/; do
      [[ -d "$d" ]] || continue
      local name
      name="$(basename "$d")"
      [[ "$name" == .* ]] && continue
      echo "$name"
    done
  fi
}

# ─── Check 1: Frontmatter Completeness ──────────────────────────────

check_frontmatter() {
  local skill_dirs=("$@")
  local checked=0

  echo "=== Frontmatter Completeness ==="
  echo ""

  for skill in "${skill_dirs[@]}"; do
    local skill_file="$SKILLS_DIR/$skill/SKILL.md"
    [[ -f "$skill_file" ]] || continue
    checked=$((checked + 1))

    local has_name=false has_desc=false in_fm=false
    while IFS= read -r line; do
      if [[ "$line" == "---" ]]; then
        if $in_fm; then break; fi
        in_fm=true
        continue
      fi
      if $in_fm; then
        [[ "$line" =~ ^name: ]] && has_name=true
        [[ "$line" =~ ^description: ]] && has_desc=true
      fi
    done < "$skill_file"

    if ! $has_name; then
      fail "$skill/SKILL.md" "frontmatter-name" \
        "Missing 'name:' field in frontmatter." \
        "Add 'name: $skill' as the first field in the YAML frontmatter block."
    fi
    if ! $has_desc; then
      fail "$skill/SKILL.md" "frontmatter-description" \
        "Missing 'description:' field in frontmatter." \
        "Add 'description: Use when ...' to the YAML frontmatter block."
    fi
  done

  [[ $checked -gt 0 ]] && pass "frontmatter-completeness" "$checked"
  echo ""
}

# ─── Check 2: Index-Disk Sync ───────────────────────────────────────

check_index_sync() {
  local skill_dirs=("$@")

  echo "=== Index Sync ==="
  echo ""

  if [[ ! -f "$INDEX_FILE" ]]; then
    fail "$INDEX_FILE" "index-exists" \
      "skill-index.json not found." \
      "Regenerate skill-index.json from current skill directories."
    echo ""
    return
  fi

  # Get disk skills and index skills
  local disk_skills=()
  for d in "$SKILLS_DIR"/*/; do
    [[ -d "$d" ]] || continue
    local name
    name="$(basename "$d")"
    [[ "$name" == .* ]] && continue
    disk_skills+=("$name")
  done

  local index_data
  index_data=$(INDEX_FILE="$INDEX_FILE" python3 -c "
import json, sys, os
with open(os.environ['INDEX_FILE']) as f:
    data = json.load(f)
index_keys = sorted(data.get('skills', {}).keys())
total = data.get('totalSkills', 0)
print(f'{total}')
for k in index_keys:
    print(k)
" 2>/dev/null) || { fail "$INDEX_FILE" "index-parse" "Failed to parse skill-index.json." "Check JSON syntax."; echo ""; return; }

  local index_total
  index_total=$(echo "$index_data" | head -1)
  local index_keys=()
  while IFS= read -r key; do
    index_keys+=("$key")
  done < <(echo "$index_data" | tail -n +2)

  local disk_count=${#disk_skills[@]}

  # Check totalSkills field
  if [[ "$index_total" -ne "$disk_count" ]]; then
    fail "$INDEX_FILE" "index-count" \
      "totalSkills is $index_total but $disk_count skill directories exist on disk." \
      "Regenerate skill-index.json. Update totalSkills to $disk_count."
  fi

  # Check for skills on disk but missing from index (case-insensitive)
  for skill in "${disk_skills[@]}"; do
    local lower
    lower=$(echo "$skill" | tr '[:upper:]' '[:lower:]')
    local found=false
    for key in "${index_keys[@]}"; do
      local key_lower
      key_lower=$(echo "$key" | tr '[:upper:]' '[:lower:]')
      [[ "$key_lower" == "$lower" ]] && found=true && break
    done
    if ! $found; then
      fail "$skill" "index-missing" \
        "Skill directory exists but not in skill-index.json." \
        "Add '$skill' entry to skill-index.json and increment totalSkills."
    fi
  done

  # Check for index entries with no disk directory (case-insensitive)
  for key in "${index_keys[@]}"; do
    local key_lower
    key_lower=$(echo "$key" | tr '[:upper:]' '[:lower:]')
    local found=false
    for skill in "${disk_skills[@]}"; do
      local lower
      lower=$(echo "$skill" | tr '[:upper:]' '[:lower:]')
      [[ "$key_lower" == "$lower" ]] && found=true && break
    done
    if ! $found; then
      fail "$INDEX_FILE" "index-orphan" \
        "Index entry '$key' has no corresponding skill directory." \
        "Remove '$key' from skill-index.json and decrement totalSkills."
    fi
  done

  local total_checks=$(( ${#disk_skills[@]} + ${#index_keys[@]} + 1 ))
  pass "index-sync" "$total_checks"
  echo ""
}

# ─── Check 3: Cross-Reference Validity ──────────────────────────────

check_cross_refs() {
  local skill_dirs=("$@")
  local checked=0

  echo "=== Cross-Reference Validity ==="
  echo ""

  # Build set of valid skill names (lowercase)
  local valid_skills=()
  for d in "$SKILLS_DIR"/*/; do
    [[ -d "$d" ]] || continue
    local name
    name="$(basename "$d")"
    [[ "$name" == .* ]] && continue
    valid_skills+=("$(echo "$name" | tr '[:upper:]' '[:lower:]')")
  done

  for skill in "${skill_dirs[@]}"; do
    local skill_file="$SKILLS_DIR/$skill/SKILL.md"
    [[ -f "$skill_file" ]] || continue

    # Extract skill references from Integration/Required/Called-by/Delegates-to sections only
    local refs
    refs=$(SKILL_FILE="$skill_file" python3 << 'PYEOF'
import re, os
content = open(os.environ["SKILL_FILE"]).read()
# Extract only Integration-related sections (after ## Integration, ## Required Skills, etc.)
sections = re.split(r'^## ', content, flags=re.MULTILINE)
integration_text = ""
for sec in sections:
    header = sec.split('\n')[0].lower()
    if any(kw in header for kw in ['integration', 'required skill', 'called by', 'delegates', 'pairs with', 'quick reference']):
        integration_text += sec + "\n"
if not integration_text:
    exit(0)
# Match backtick-quoted potential skill names (lowercase with hyphens)
bt = set(re.findall(r'\x60([a-z][a-z0-9-]+(?:-[a-z0-9]+)*)\x60', integration_text))
# Match **bold** potential skill names in table rows
bold = set(re.findall(r'\*\*([a-z][a-z0-9-]+(?:-[a-z0-9]+)*)\*\*', integration_text))
candidates = bt | bold
for c in sorted(candidates):
    if '-' in c and len(c) > 5:
        print(c)
PYEOF
    ) || continue

    while IFS= read -r ref; do
      [[ -z "$ref" ]] && continue
      checked=$((checked + 1))
      local ref_lower
      ref_lower=$(echo "$ref" | tr '[:upper:]' '[:lower:]')
      local found=false
      for valid in "${valid_skills[@]}"; do
        [[ "$ref_lower" == "$valid" ]] && found=true && break
      done
      if ! $found; then
        # Only warn if it looks like a skill ref (not a generic hyphenated word)
        # Check against common non-skill patterns
        case "$ref_lower" in
          pre-commit|code-reviewer|red-green|single-responsibility|self-contained|case-insensitive|cross-line|multi-step|non-blocking|agent-friendly) continue ;;
        esac
        warn "$skill/SKILL.md" "xref-missing" \
          "References '$ref' but no skill directory with that name exists." \
          "Check if '$ref' is a valid skill name. If renamed/removed, update the reference."
      fi
    done <<< "$refs"
  done

  [[ $checked -gt 0 ]] && pass "xref-validity" "$checked"
  echo ""
}

# ─── Check 4: Support File Existence ────────────────────────────────

check_support_files() {
  local skill_dirs=("$@")
  local checked=0

  echo "=== Support File Existence ==="
  echo ""

  for skill in "${skill_dirs[@]}"; do
    local skill_file="$SKILLS_DIR/$skill/SKILL.md"
    [[ -f "$skill_file" ]] || continue

    # Find references to local files (Workflows/*.md, *.md relative paths)
    local refs
    refs=$(SKILL_FILE="$skill_file" python3 -c "
import re, os
content = open(os.environ['SKILL_FILE']).read()
# Match backtick-quoted relative file paths
paths = re.findall(r'\x60((?:Workflows|Tools|templates|examples)/[^\x60]+)\x60', content)
# Also match markdown links to local .md files
links = re.findall(r'\[.*?\]\(([^http][^\)]+\.(?:md|sh|ts|json))\)', content)
for p in sorted(set(paths + links)):
    print(p)
" 2>/dev/null) || continue

    while IFS= read -r ref; do
      [[ -z "$ref" ]] && continue
      checked=$((checked + 1))
      local full_path="$SKILLS_DIR/$skill/$ref"
      if [[ ! -f "$full_path" ]]; then
        fail "$skill/SKILL.md" "support-file" \
          "References '$ref' but file does not exist at $full_path" \
          "Create the file or remove the reference from SKILL.md."
      fi
    done <<< "$refs"
  done

  [[ $checked -gt 0 ]] && pass "support-files" "$checked"
  echo ""
}

# ─── Check 5: Sanitization Scan ─────────────────────────────────────

check_sanitization() {
  local skill_dirs=("$@")
  local checked=0

  echo "=== Sanitization Scan ==="
  echo ""

  for skill in "${skill_dirs[@]}"; do
    local skill_file="$SKILLS_DIR/$skill/SKILL.md"
    [[ -f "$skill_file" ]] || continue
    checked=$((checked + 1))

    local is_allowed=false
    in_allowlist "$skill" && is_allowed=true

    local hits
    hits=$(SKILL_FILE="$skill_file" python3 << 'PYEOF'
import re, os
content = open(os.environ["SKILL_FILE"]).read()
issues = []
# Detect any hardcoded home directory paths
home_paths = re.findall(r"/(?:Users|home)/\w+/", content)
if home_paths:
    issues.append("hardcoded path(s): " + ", ".join(sorted(set(home_paths))))
# Detect hardcoded email addresses (any domain)
emails = re.findall(r"[\w.+-]+@(?!example\.com)\S+\.\w{2,}", content)
# Filter out common placeholder/doc emails
real_emails = [e for e in emails if not any(x in e.lower() for x in ['example', 'placeholder', 'noreply'])]
if real_emails:
    issues.append("email(s): " + ", ".join(sorted(set(real_emails))))
# Detect Slack user IDs
slack_ids = re.findall(r"U(?=[A-Z0-9]*[0-9])[A-Z0-9]{8,}", content)
if slack_ids:
    issues.append("Slack user ID(s): " + ", ".join(sorted(set(slack_ids))))
for issue in issues:
    print(issue)
PYEOF
    ) || continue

    while IFS= read -r hit; do
      [[ -z "$hit" ]] && continue
      if $is_allowed; then
        # Still report but as informational, don't increment warning count
        echo -e "${YELLOW}INFO${NC} [sanitization] $skill/SKILL.md"
        echo "  Found: $hit [ALLOWED: org-specific skill]"
        echo ""
      else
        warn "$skill/SKILL.md" "sanitization" \
          "Contains $hit" \
          "Replace with environment variable reference or generic placeholder. If this skill is org-specific by design, add it to the allowlist in skill-hygiene.sh."
      fi
    done <<< "$hits"
  done

  [[ $checked -gt 0 ]] && pass "sanitization" "$checked"
  echo ""
}

# ─── Check 6: Trigger Collision Detection ────────────────────────────

check_trigger_collisions() {
  echo "=== Trigger Collisions ==="
  echo ""

  if [[ ! -f "$INDEX_FILE" ]]; then
    echo "  Skipped (no index file)."
    echo ""
    return
  fi

  local collisions
  collisions=$(INDEX_FILE="$INDEX_FILE" python3 << 'PYEOF'
import json, os
index_path = os.environ["INDEX_FILE"]
with open(index_path) as f:
    data = json.load(f)
trigger_owners = {}
for key, skill in data.get("skills", {}).items():
    for trigger in skill.get("triggers", []):
        t = trigger.lower()
        if t not in trigger_owners:
            trigger_owners[t] = []
        trigger_owners[t].append(skill.get("name", key))
for trigger, owners in sorted(trigger_owners.items()):
    if len(owners) >= 3:
        print(f"{trigger}|{len(owners)}|{', '.join(sorted(owners))}")
PYEOF
  ) || { echo "  Skipped (parse error)."; echo ""; return; }

  local collision_count=0
  while IFS='|' read -r trigger count owners; do
    [[ -z "$trigger" ]] && continue
    collision_count=$((collision_count + 1))
    warn "skill-index.json" "trigger-collision" \
      "Trigger '$trigger' claimed by $count skills: $owners" \
      "Consider more specific triggers for disambiguation. Generic words reduce skill discovery accuracy."
  done <<< "$collisions"

  if [[ $collision_count -eq 0 ]]; then
    pass "trigger-collisions" "all triggers"
  fi
  echo ""
}

# ─── Check 7: Frontmatter Name Mismatch ─────────────────────────────

check_name_mismatch() {
  local skill_dirs=("$@")
  local checked=0

  echo "=== Frontmatter Name Match ==="
  echo ""

  for skill in "${skill_dirs[@]}"; do
    local skill_file="$SKILLS_DIR/$skill/SKILL.md"
    [[ -f "$skill_file" ]] || continue
    checked=$((checked + 1))

    local fm_name=""
    local in_fm=false
    while IFS= read -r line; do
      if [[ "$line" == "---" ]]; then
        if $in_fm; then break; fi
        in_fm=true
        continue
      fi
      if $in_fm && [[ "$line" =~ ^name:\ *(.*) ]]; then
        fm_name="${BASH_REMATCH[1]}"
        break
      fi
    done < "$skill_file"

    [[ -z "$fm_name" ]] && continue  # Already caught by frontmatter-completeness

    local fm_lower
    fm_lower=$(echo "$fm_name" | tr '[:upper:]' '[:lower:]')
    local dir_lower
    dir_lower=$(echo "$skill" | tr '[:upper:]' '[:lower:]')

    if [[ "$fm_lower" != "$dir_lower" ]]; then
      warn "$skill/SKILL.md" "name-mismatch" \
        "Frontmatter name '$fm_name' doesn't match directory name '$skill'." \
        "Update frontmatter to 'name: $skill' or rename the directory to match."
    fi
  done

  [[ $checked -gt 0 ]] && pass "name-match" "$checked"
  echo ""
}

# ─── Main ─────────────────────────────────────────────────────────────

main() {
  echo "╔══════════════════════════════════════╗"
  echo "║  Skill Hygiene Checker               ║"
  echo "╚══════════════════════════════════════╝"
  echo ""

  local target="${1:-}"
  local skill_dirs=()

  while IFS= read -r skill; do
    skill_dirs+=("$skill")
  done < <(get_skill_dirs "$target")

  check_frontmatter "${skill_dirs[@]}"
  # Only run index/collision checks on full scan
  if [[ -z "$target" ]]; then
    check_index_sync "${skill_dirs[@]}"
    check_trigger_collisions
  fi
  check_cross_refs "${skill_dirs[@]}"
  check_support_files "${skill_dirs[@]}"
  check_sanitization "${skill_dirs[@]}"
  check_name_mismatch "${skill_dirs[@]}"

  echo "═══════════════════════════════════════"
  if [[ $violations -eq 0 && $warnings -eq 0 ]]; then
    echo -e "${GREEN}Clean.${NC} No violations, no warnings."
  elif [[ $violations -eq 0 ]]; then
    echo -e "${GREEN}$violations violations${NC}, ${YELLOW}$warnings warnings${NC}."
  else
    echo -e "${RED}$violations violations${NC}, ${YELLOW}$warnings warnings${NC}."
  fi
  echo "═══════════════════════════════════════"

  # Cap exit code at 125 (126+ reserved by bash)
  exit $((violations > 125 ? 125 : violations))
}

main "$@"
