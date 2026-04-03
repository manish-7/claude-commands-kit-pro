---
description: Address PR review comments with targeted fixes
argument-hint: PR number or paste review comments
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash(git:*), Bash(gh:*)
outputs: fixed files addressing review feedback
accepts: PR number, review comments
---

# Fix PR Review Comments

Address the following review feedback:

```
$ARGUMENTS
```

## Process

1. **Gather feedback** — If a PR number is given, fetch all review comments. Otherwise, use the provided feedback.
2. **Categorize** — Group comments by type: required changes, suggestions, questions, nits
3. **Address each** — Fix required changes and reasonable suggestions:
   - Read the full context around each comment
   - Apply the minimal correct change
   - If a comment is unclear or you disagree, flag it for discussion rather than guessing
4. **Verify** — Run the build and tests to confirm fixes don't break anything
5. **Report** — List each comment and how it was addressed (fixed, skipped with reason, or needs clarification)

## Principles

- Required changes must be addressed — suggestions are optional
- Don't make unrelated changes while fixing review comments
- If you disagree with feedback, explain why rather than silently ignoring it
- Keep each fix as a separate, focused change
