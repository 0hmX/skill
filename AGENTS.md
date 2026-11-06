# AGENTS.md

Basic rules for anyone (human or agent) adding or changing skills in this repo.

## Layout

- Every skill lives in its own subfolder under the top-level `skills/` folder: `skills/<skill-name>/SKILL.md`, plus optional `scripts/`, `references/`, `assets/`.
- Folder name = the `name` in the SKILL.md frontmatter.
- Every skill folder must have an `owner.md` (see Ownership below) and a `LICENSE` (see Licensing below). Missing either, no merge.
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
- A new skill of ours gets `owner.md` set to `@0hmX` (template below).
- To change a skill that exists elsewhere (synced, plugin, another repo), copy it into `skills/<skill-name>/` first, then symlink it.
- Commit with `<skill-name>: <what changed>` and push.

## Ownership (`owner.md`)

Every skill has `skills/<skill-name>/owner.md` saying who owns it. There are two kinds:

**Ours** — owner is `@0hmX`. Edit freely.

```markdown
# Owner

@0hmX
```

(If it started from someone else's skill, add one line saying what it's based on.)

**External** — owner is the exact GitHub link to the upstream `SKILL.md`, plus the pinned commit. Never edit locally.

```markdown
# Owner

https://github.com/<org>/<repo>/blob/main/<path>/SKILL.md

Pinned upstream commit: `<full sha>`
```

## Licensing

- The repo as a whole is MIT (top-level `LICENSE`), except for skill folders that have their own `LICENSE`, which win.
- Every skill folder has its own `LICENSE`:
  - **Ours (`@0hmX`)**: MIT. Copy the top-level `LICENSE` without its "Exception" paragraph.
  - **External**: the upstream license file, copied unchanged. Never relicense someone else's skill as MIT.
  - **Ours but based on an external skill**: keep the upstream license (e.g. Apache-2.0 stays Apache-2.0). If that license requires it (Apache-2.0 does), add a line at the top of each changed file saying it was modified by @0hmX.
- No license upstream = all rights reserved: don't copy that skill into this repo.

## Skills from other repos

Git can't link a single file from another GitHub repo, so external skills are copied in.

To add one:

1. Find the skill's `SKILL.md` on GitHub and note the latest commit that touched its folder.
2. Copy the whole skill folder (`SKILL.md` plus any `references/`, `scripts/`, `assets/`) at that commit into `skills/<skill-name>/` here. Also copy the upstream license file into the folder (this repo is public, so the license notice must travel with the copy). No license upstream means don't copy it.
3. Add `skills/<skill-name>/owner.md` using the external template above.
4. Symlink it into `~/.claude/skills/` as usual and commit as `<skill-name>: add from <org>/<repo>`.

To update one, re-copy the folder from upstream, bump the commit in `owner.md`, and commit as `<skill-name>: update to <short sha>`.

To take over an external skill and start editing it, change its `owner.md` to `@0hmX` with a "based on <link>" line.
