# AGENTS.md

Basic rules for anyone (human or agent) adding or changing skills in this repo.

## Layout

- Every skill lives in its own top-level subfolder: `<skill-name>/SKILL.md`, plus optional `scripts/`, `references/`, `assets/`.
- Folder name = the `name` in the SKILL.md frontmatter.
- Nothing else goes at the top level except repo docs (`README.md`, `AGENTS.md`, `.gitignore`).
- Don't commit test output (`*-workspace/`), caches, or secrets.

## Installing locally

Clone once, then symlink each skill into `~/.claude/skills/` so edits here are live:

```sh
gh repo clone 0hmX/skill ~/0hmx/skill
ln -sfn ~/0hmx/skill/<skill-name> ~/.claude/skills/<skill-name>
```

Never write a skill directly into `~/.claude/skills/`; it should only contain symlinks to this repo.

## New or edited skills

- Create and edit skills here, in their subfolder (use `/skill-creator`, which follows these rules).
- To change a skill that exists elsewhere (synced, plugin, another repo), copy it into its own subfolder here first, then symlink it.
- Commit with `<skill-name>: <what changed>` and push.

## Skills from other repos

Git can't link a single file from another GitHub repo, so external skills are copied in, pinned to an upstream commit, and listed below. Don't edit them locally; to update, re-copy from upstream and bump the commit.

| Skill | Upstream | Commit |
|---|---|---|
| `architect` | https://github.com/cursor/plugins/tree/main/pstack/skills/architect | `00b14f1df36b` |
| `skill-creator` | Anthropic built-in `skill-creator` (modified here to follow this file) | — |
