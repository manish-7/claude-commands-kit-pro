---
description: Rebase or merge upstream changes into the current branch
argument-hint: optional base branch name (defaults to main/develop)
scope: modifies-files
allowed-tools: Bash(git:*)
outputs: synced branch
accepts: branch name
---

# Sync

Current branch:
!`git branch --show-current`

Default branch:
!`git symbolic-ref refs/remotes/origin/HEAD --short`

## Instructions

1. **Fetch** — Run `git fetch origin` to get the latest remote state
2. **Identify base** — Use the specified base branch, or default to the project's main branch
3. **Check status** — Ensure the working tree is clean. If there are uncommitted changes, stash them first.
4. **Rebase** — Rebase the current branch onto the updated base branch
5. **Resolve conflicts** — If conflicts arise:
   - Show each conflict clearly with context
   - Suggest the correct resolution based on understanding both sides
   - Apply the resolution
6. **Restore** — If changes were stashed, pop the stash
7. **Report** — Show the sync result: how many commits ahead/behind, any conflicts resolved

$ARGUMENTS

## Principles

- Prefer rebase over merge for feature branches to keep history clean
- Never force-push without explicit confirmation
- If conflicts are complex, explain both sides before resolving
- Stash and restore uncommitted work safely
