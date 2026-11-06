# AGENTS.md

Basic rules for anyone (human or agent) adding or changing skills in this repo.

## Layout

- Every skill lives in its own subfolder under the top-level `skills/` folder: `skills/<skill-name>/SKILL.md`, plus optional `scripts/`, `references/`, `assets/`.
- Folder name = the `name` in the SKILL.md frontmatter.
- Never put a skill folder at the repo top level; it always goes in `skills/`.
- Don't commit test output (`*-workspace/`), caches, or secrets.

## Installing locally

Clone once, then symlink each skill into `~/.claude/skills/` so edits here are live:

```sh
gh repo clone 0hmX/skill ~/0hmx/skill
ln -sfn ~/0hmx/skill/skills/<skill-name> ~/.claude/skills/<skill-name>
```

Never write a skill directly into `~/.claude/skills/`; it should only contain symlinks to this repo.

## New or edited skills

- Create and edit skills here, in their `skills/<skill-name>/` folder (use `/skill-creator`, which follows these rules).
- To change a skill that exists elsewhere (synced, plugin, another repo), copy it into `skills/<skill-name>/` first, then symlink it.
- Commit with `<skill-name>: <what changed>` and push.

## Skills from other repos

Git can't link a single file from another GitHub repo, so external skills are copied in and marked with an `owner.md`. Don't edit them locally.

To add one:

1. Find the skill's `SKILL.md` on GitHub and note the latest commit that touched its folder.
2. Copy the whole skill folder (`SKILL.md` plus any `references/`, `scripts/`, `assets/`) at that commit into `skills/<skill-name>/` here.
3. Add `skills/<skill-name>/owner.md` with the exact GitHub link to the upstream `SKILL.md` and the pinned commit:

   ```markdown
   # Owner

   External skill, copied from:

   https://github.com/<org>/<repo>/blob/main/<path>/SKILL.md

   Pinned upstream commit: `<full sha>`
   ```

4. Symlink it into `~/.claude/skills/` as usual and commit as `<skill-name>: add from <org>/<repo>`.

To update one, re-copy the folder from upstream, bump the commit in `owner.md`, and commit as `<skill-name>: update to <short sha>`.

A skill folder without `owner.md` is ours and can be edited freely.
