---
description: Verify completed work meets quality standards before calling it done
argument-hint: description of what was just completed, or just run to check current changes
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: verification report with pass/fail status
accepts: task description, file path, "current" for uncommitted changes
---

# Verify

Verify the following work is complete and correct:

```
$ARGUMENTS
```

## Process

1. **Identify what to verify** — If a task is described, find the relevant changes. If "current" or nothing, check uncommitted changes against the default branch.
2. **Run checks** — Execute in order:
   - **Build** — Does it compile/build without errors or warnings?
   - **Tests** — Do all tests pass? Were new tests added for new behavior?
   - **Diff review** — Read the actual changes. Do they match the stated intent? Any accidental inclusions?
   - **Edge cases** — Are error paths, null inputs, and boundary conditions handled?
   - **Style** — Do changes follow the project's conventions?
3. **Staff engineer check** — Ask: "Would a staff engineer approve this as-is?" Look for:
   - Unnecessary complexity
   - Missing error handling
   - Incomplete implementations
   - Debug code or TODOs left behind
   - Changes beyond the stated scope

## Output

```
## Verification: PASS / FAIL

### Passed
- [x] Build clean
- [x] Tests passing

### Failed
- [ ] What failed and why

### Suggestions
- Optional improvements (not blockers)
```

## Principles

- Don't mark anything as done until verification passes
- Be honest — a failing check means it's not done, even if the fix is small
- Verify behavior, not just code — does it actually work end-to-end?
- Check for what's missing, not just what's present
