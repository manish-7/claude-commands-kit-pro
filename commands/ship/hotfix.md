---
description: Create a hotfix branch, apply a targeted fix, and open a PR
argument-hint: bug description or error to fix urgently
scope: pushes
allowed-tools: Read, Grep, Glob, Bash
outputs: hotfix PR URL
accepts: bug description, error output, incident report
---

# Hotfix

Apply an urgent fix for:

```
$ARGUMENTS
```

## Process

1. **Diagnose** — Quickly identify the root cause. Focus on speed — find the minimal change needed.
2. **Branch** — Create a hotfix branch from the production/release branch:
   ```
   git checkout -b hotfix/<short-description> origin/main
   ```
3. **Fix** — Apply the minimal correct fix. Resist the urge to refactor or clean up — hotfixes are surgical.
4. **Test** — Run relevant tests to confirm the fix works and nothing else breaks
5. **Commit** — Commit with a clear message referencing the issue
6. **Push and PR** — Push the branch and open a PR against the production branch. Mark as urgent in the description.
7. **Report** — Output the PR URL and a summary of the fix

$ARGUMENTS

## Principles

- Minimal change only — fix the bug, nothing else
- Always branch from the production/release branch, not develop
- Test the fix, even under time pressure
- Document what caused the issue and what the fix does in the PR
- Don't skip tests with --no-verify
