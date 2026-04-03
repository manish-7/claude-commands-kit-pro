---
description: Restructure code without changing behavior
argument-hint: file path, function, or description of what to refactor
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: refactored source files
accepts: file path, function name, refactoring description
---

# Refactor

Refactor the following:

```
$ARGUMENTS
```

## Process

1. **Assess** — Read the code and identify the specific problems: duplication, poor naming, deep nesting, long functions, tight coupling, or unclear responsibilities
2. **Check coverage** — Look for existing tests that cover this code. If tests exist, they serve as your safety net. If not, note the risk.
3. **Refactor** — Apply changes incrementally, one transformation at a time:
   - Extract functions for repeated or complex logic
   - Rename for clarity
   - Simplify conditionals and reduce nesting
   - Move code to better locations
   - Remove dead code
4. **Verify** — Run the build and tests after each significant change. The behavior must not change.

## Principles

- Behavior must be identical before and after — this is non-negotiable
- Make one type of change at a time (rename, then extract, then move — not all at once)
- Don't refactor code you don't understand — use `/explain` first
- Don't over-abstract — three similar lines are better than a premature abstraction
- If there are no tests, flag the risk and keep changes conservative
