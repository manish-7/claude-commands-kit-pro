---
description: Create a branch, push, and open a draft pull request
argument-hint: optional description of changes
scope: pushes
allowed-tools: Bash(git:*), Bash(gh:*)
outputs: PR URL
accepts: description, branch name
---

# Draft Pull Request

Current state:
!`git status --short`

Staged changes:
!`git diff --staged --stat`

Current branch:
!`git branch --show-current`

Default branch:
!`git symbolic-ref refs/remotes/origin/HEAD --short`

Recent commits:
!`git log -5 --pretty=format:"%h %s" --no-merges`

## Instructions

1. **Verify** — Ensure there are staged changes or unpushed commits. If nothing to ship, report and stop.
2. **Commit** — If there are staged changes, commit with a clean conventional message.
3. **Branch** — If on the default branch, create a feature branch following the project's naming convention. If already on a feature branch, stay on it.
4. **Push** — Push the branch to origin.
5. **Open PR** — Create a draft pull request against the default branch:
   - Title matches the commit summary
   - Description includes what changed and why
   - Reference any ticket numbers found in the branch name
6. **Report** — Output the PR URL.

$ARGUMENTS

## Principles

- Don't mention Claude, AI, or tools in commits or PR descriptions
- Always open as draft — let the author decide when it's ready
- Write PR descriptions as a human engineer would
- One PR = one logical change
