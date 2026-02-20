#!/usr/bin/env bash
# sync-bundle-to-live.sh
#
# Replaces shared skill directories and tool files in ~/.claude/ with
# symlinks to the bundle template, so edits in the repo are immediately live.
#
# Usage: ./Tools/sync-bundle-to-live.sh [--dry-run]
#
# Safe to re-run: skips items that are already symlinked.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BUNDLE_SKILLS="$REPO_ROOT/Bundles/Kai/~/.claude/skills"
BUNDLE_TOOLS="$REPO_ROOT/Bundles/Kai/~/.claude/tools"
LIVE_SKILLS="$HOME/.claude/skills"
LIVE_TOOLS="$HOME/.claude/tools"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"
BACKUP_DIR="$LIVE_SKILLS/.backups/$TIMESTAMP"

DRY_RUN=false
[[ "${1:-}" == "--dry-run" ]] && DRY_RUN=true

if [[ ! -d "$BUNDLE_SKILLS" ]]; then
  echo "ERROR: Bundle skills not found at $BUNDLE_SKILLS"
  exit 1
fi

if [[ ! -d "$LIVE_SKILLS" ]]; then
  echo "ERROR: Live skills not found at $LIVE_SKILLS"
  exit 1
fi

synced=0
skipped=0
created=0

for skill_dir in "$BUNDLE_SKILLS"/*/; do
  skill_name="$(basename "$skill_dir")"
  live_path="$LIVE_SKILLS/$skill_name"
  bundle_path="$BUNDLE_SKILLS/$skill_name"

  # Already a symlink — skip
  if [[ -L "$live_path" ]]; then
    echo "SKIP (already symlinked): $skill_name"
    skipped=$((skipped + 1))
    continue
  fi

  # Regular directory exists — back up, then symlink
  if [[ -d "$live_path" ]]; then
    if $DRY_RUN; then
      echo "WOULD SYNC: $skill_name (backup + symlink)"
    else
      mkdir -p "$BACKUP_DIR"
      mv "$live_path" "$BACKUP_DIR/$skill_name"
      ln -s "$bundle_path" "$live_path"
      echo "SYNCED: $skill_name (backed up to $BACKUP_DIR/$skill_name)"
    fi
    synced=$((synced + 1))
    continue
  fi

  # Doesn't exist in live — create new symlink
  if $DRY_RUN; then
    echo "WOULD CREATE: $skill_name (new symlink)"
  else
    ln -s "$bundle_path" "$live_path"
    echo "CREATED: $skill_name (new symlink)"
  fi
  created=$((created + 1))
done

# --- Sync tools (individual files) ---

tools_synced=0
tools_skipped=0
tools_created=0

if [[ -d "$BUNDLE_TOOLS" ]]; then
  echo ""
  echo "--- Tools ---"
  for tool_file in "$BUNDLE_TOOLS"/*; do
    tool_name="$(basename "$tool_file")"
    live_path="$LIVE_TOOLS/$tool_name"
    bundle_path="$BUNDLE_TOOLS/$tool_name"

    # Already a symlink — skip
    if [[ -L "$live_path" ]]; then
      echo "SKIP (already symlinked): $tool_name"
      tools_skipped=$((tools_skipped + 1))
      continue
    fi

    # Regular file exists — back up, then symlink
    if [[ -f "$live_path" ]]; then
      if $DRY_RUN; then
        echo "WOULD SYNC: $tool_name (backup + symlink)"
      else
        mkdir -p "$LIVE_TOOLS/.backups/$TIMESTAMP"
        mv "$live_path" "$LIVE_TOOLS/.backups/$TIMESTAMP/$tool_name"
        ln -s "$bundle_path" "$live_path"
        echo "SYNCED: $tool_name (backed up to $LIVE_TOOLS/.backups/$TIMESTAMP/$tool_name)"
      fi
      tools_synced=$((tools_synced + 1))
      continue
    fi

    # Doesn't exist in live — create new symlink
    if $DRY_RUN; then
      echo "WOULD CREATE: $tool_name (new symlink)"
    else
      ln -s "$bundle_path" "$live_path"
      echo "CREATED: $tool_name (new symlink)"
    fi
    tools_created=$((tools_created + 1))
  done
fi

echo ""
echo "--- Summary ---"
echo "Skills — synced: $synced, skipped: $skipped, created: $created"
echo "Tools  — synced: $tools_synced, skipped: $tools_skipped, created: $tools_created"
if $DRY_RUN; then
  echo "(dry run — no changes made)"
fi
