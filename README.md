# skill

All of 0hmX's Claude skills. One folder per skill (`<name>/SKILL.md`).

Each skill is symlinked into `~/.claude/skills/` so edits here are live:

```sh
gh repo clone 0hmX/skill ~/0hmx/skill
~/0hmx/skill/link.sh          # link all skills
~/0hmx/skill/link.sh <name>   # link one
```

New skills are made with the bundled `skill-creator`, which always writes them here.
