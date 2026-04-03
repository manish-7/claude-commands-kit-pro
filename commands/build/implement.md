---
description: Implement a feature from a description or spec
argument-hint: feature description, spec, or ticket reference
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: implemented feature with source files
accepts: feature description, spec document, requirements
---

# Implement

Implement the following:

```
$ARGUMENTS
```

## Process

1. **Understand** — Parse the requirements. Identify inputs, outputs, edge cases, and constraints. If anything is ambiguous, state your assumptions.
2. **Survey** — Read existing code in the area. Identify patterns, conventions, and extension points. Find similar features to use as reference.
3. **Plan** — Break the implementation into small, testable steps. Identify which files to create vs. modify.
4. **Build** — Implement step by step:
   - Follow existing patterns and conventions exactly
   - Handle edge cases and errors
   - Add necessary imports and registrations
5. **Verify** — Run the build and any relevant tests. Fix issues before reporting done.

## Output

List of files created or modified, with a brief summary of each change.

## Principles

- Match the project's existing patterns — don't introduce new paradigms
- Do the simplest thing that works correctly
- Handle errors at the appropriate level
- Don't add features beyond what was requested
- Leave the codebase in a buildable, testable state
