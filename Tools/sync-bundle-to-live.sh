#!/usr/bin/env bash
# sync-bundle-to-live.sh
#
# Replaces shared skill directories in ~/.claude/skills/ with symlinks
# to the bundle template, so edits in the repo are immediately live.
#
# Usage: ./Tools/sync-bundle-to-live.sh [--dry-run]
#
# Safe to re-run: skips skills that are already symlinked.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
BUNDLE_SKILLS="$REPO_ROOT/Bundles/Kai/~/.claude/skills"
LIVE_SKILLS="$HOME/.claude/skills"
BACKUP_DIR="$LIVE_SKILLS/.backups/$(date +%Y%m%d-%H%M%S)"

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

echo ""
echo "--- Summary ---"
echo "Synced:  $synced"
echo "Skipped: $skipped"
echo "Created: $created"
if $DRY_RUN; then
  echo "(dry run — no changes made)"
fi
