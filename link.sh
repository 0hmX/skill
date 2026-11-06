#!/usr/bin/env bash
# Symlink skills from this repo into ~/.claude/skills.
#   ./link.sh            link every skill folder (any dir containing SKILL.md)
#   ./link.sh <name>...  link only the named skills
set -euo pipefail
repo="$(cd "$(dirname "$0")" && pwd)"
dest="${CLAUDE_SKILLS_DIR:-$HOME/.claude/skills}"
mkdir -p "$dest"
if [ $# -gt 0 ]; then names=("$@"); else
  names=(); for d in "$repo"/*/; do [ -f "$d/SKILL.md" ] && names+=("$(basename "$d")"); done
fi
for n in "${names[@]}"; do
  src="$repo/$n"
  [ -f "$src/SKILL.md" ] || { echo "skip $n: no $src/SKILL.md" >&2; continue; }
  target="$dest/$n"
  if [ -e "$target" ] && [ ! -L "$target" ]; then
    echo "skip $n: $target exists and is not a symlink" >&2; continue
  fi
  ln -sfn "$src" "$target"
  echo "linked $target -> $src"
done
