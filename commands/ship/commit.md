---
description: Stage and commit changes with a clean conventional message
argument-hint: optional description of changes
scope: creates-commits
allowed-tools: Bash(git:*)
outputs: git commit
accepts: description, file list
---

# Commit

Current state:
!`git status --short`

Staged changes:
!`git diff --staged --stat`

Recent commits for style reference:
!`git log -5 --pretty=format:"%h %s" --no-merges`

## Instructions

1. **Check state** — Review what's staged and unstaged. If nothing is staged, list the changed files and ask what to stage — never stage everything blindly.
2. **Compose message** — Write a conventional commit message:
   - Imperative mood, under 50 characters for the summary
   - Optional body separated by a blank line for context
   - Reference ticket numbers if visible in branch name or context
3. **Commit** — Create the commit with staged changes only

$ARGUMENTS

## Principles

- Never stage everything with `git add .` without confirmation
- Don't mention Claude, AI, or tools in commit messages
- Follow the project's existing commit message style
- One logical change per commit
