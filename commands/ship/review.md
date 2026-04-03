---
description: Review a PR or diff for bugs, style, and design issues
argument-hint: PR number, branch name, or just run for current changes
scope: read-only
allowed-tools: Read, Grep, Glob, Bash(git:*), Bash(gh:*)
outputs: review report with actionable feedback
accepts: PR number, branch name, diff output
---

# Code Review

Review the following:

```
$ARGUMENTS
```

## Process

1. **Get the diff** — If a PR number is given, fetch it. If a branch, diff against the default branch. If nothing, review unstaged changes.
2. **Understand context** — Read the changed files fully (not just the diff) to understand what the code is doing and why.
3. **Review systematically** — Check each change for:
   - **Correctness** — Logic errors, off-by-ones, null handling, race conditions
   - **Security** — Injection, auth bypass, data exposure, input validation
   - **Performance** — N+1 queries, unnecessary allocations, missing indexes
   - **Design** — Naming, responsibility, coupling, abstraction level
   - **Style** — Consistency with project conventions
   - **Tests** — Are changes tested? Are edge cases covered?
4. **Prioritize** — Rank findings by severity: Blocker > Major > Minor > Nit

## Output

For each finding:
- **Severity**: Blocker / Major / Minor / Nit
- **Location**: `file:line`
- **Issue**: What's wrong
- **Suggestion**: Specific fix or improvement

End with a **Summary**: overall assessment and whether the PR is ready to merge.

## Principles

- Review the code, not the author
- Blockers must be fixed — nits are optional
- Praise good patterns, don't just list problems
- If you're unsure about something, ask rather than assume it's wrong
