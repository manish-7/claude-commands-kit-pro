---
description: Create a structured plan before starting non-trivial work
argument-hint: task description or feature request
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: tasks/todo.md with checkable plan
accepts: task description, feature request, bug report
---

# Plan

Create a structured plan for:

```
$ARGUMENTS
```

## Process

1. **Analyze the task** — Break down the request into discrete, verifiable steps. Identify unknowns and dependencies.
2. **Survey the codebase** — Read relevant code to understand existing patterns, constraints, and extension points. This informs realistic scoping.
3. **Write the plan** — Create or update `tasks/todo.md` with:
   - High-level objective
   - Numbered checkable items (`- [ ]` format)
   - Dependencies between steps
   - Verification criteria for each step
   - Known risks or open questions
4. **Present for review** — Show the plan to the user before starting implementation. Adjust based on feedback.

## Output

```markdown
# Task: [Title]

## Objective
One-line summary of what we're building and why.

## Plan
- [ ] Step 1: Description (verify by: criteria)
- [ ] Step 2: Description (verify by: criteria)
- [ ] Step 3: Description (verify by: criteria)

## Dependencies
- Step 2 requires Step 1

## Risks
- Risk description and mitigation

## Open Questions
- Question that needs answering before proceeding
```

## Principles

- Plan before building — always. The 5 minutes spent planning saves 30 minutes of rework.
- Every step must have a verification criteria — "how do I know this is done?"
- If the plan changes during implementation, update `tasks/todo.md` immediately
- Break large tasks into steps that can each be completed and verified independently
