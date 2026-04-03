---
description: Generate tests for existing code
argument-hint: file path, function name, or feature area
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: test files
accepts: file path, function name, class name, feature description
---

# Generate Tests

Write tests for the following:

```
$ARGUMENTS
```

## Process

1. **Read the code** — Understand what the code does, its inputs, outputs, side effects, and edge cases
2. **Find existing tests** — Check for test files, test conventions, and the testing framework in use. Match the existing style exactly.
3. **Identify test cases** — Cover:
   - **Happy path** — Normal expected usage
   - **Edge cases** — Empty inputs, nulls, boundaries, large values
   - **Error cases** — Invalid inputs, failures, exceptions
   - **Integration points** — Interactions with dependencies
4. **Write tests** — Generate clear, focused tests:
   - One assertion per test (or closely related assertions)
   - Descriptive test names that explain the scenario
   - Arrange-Act-Assert structure
   - Proper setup and teardown
5. **Run tests** — Execute the new tests and fix any failures

## Output

Test file(s) with passing tests. Report the test count and what they cover.

## Principles

- Match the project's test framework, style, and conventions exactly
- Test behavior, not implementation — tests should survive refactoring
- Don't mock what you don't own — prefer integration tests for external boundaries
- Every test should fail if you break the thing it's testing
- Don't write tests that can never fail
