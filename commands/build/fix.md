---
description: Fix lint errors, type errors, or failing tests
argument-hint: error output, or just run to auto-detect
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: fixed source files
accepts: error output, file path, test name
---

# Fix Errors

Fix the following errors:

```
$ARGUMENTS
```

## Process

1. **Detect** — If no specific errors are provided, run the project's lint, type check, and test commands to find them
2. **Categorize** — Group errors by type: lint violations, type errors, test failures, build errors
3. **Fix systematically** — Resolve each error with the minimal correct change:
   - **Lint errors** — Fix the actual issue, don't just suppress the rule
   - **Type errors** — Add correct types, fix mismatches — don't use `any` or type casts as escape hatches
   - **Test failures** — Fix the code if the test is correct, fix the test if it's outdated
   - **Build errors** — Resolve missing imports, broken references, config issues
4. **Verify** — Re-run the failing commands to confirm all errors are resolved

## Principles

- Fix the root cause, not the symptom
- Don't introduce new warnings or errors while fixing existing ones
- Don't change unrelated code
- If a lint rule is genuinely wrong for a case, disable it with a comment explaining why
