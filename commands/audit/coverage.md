---
description: Analyze test coverage gaps and suggest high-value tests to add
argument-hint: file path, directory, or just run for the whole project
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: coverage analysis with specific test recommendations
accepts: file path, directory, coverage report
---

# Test Coverage Analysis

Analyze test coverage for:

```
$ARGUMENTS
```

## Process

1. **Run coverage** — If the project has a coverage tool configured, run it. Otherwise, analyze manually by comparing source files to test files.
2. **Identify gaps** — Find code with no or minimal test coverage:
   - Files with no corresponding test file
   - Public functions/methods without any test calling them
   - Error handling paths with no failure tests
   - Edge cases and boundary conditions
   - Critical business logic with inadequate coverage
3. **Prioritize** — Rank gaps by risk:
   - **Critical** — Core business logic, payment, auth, data mutation
   - **High** — Public APIs, integration points, error handling
   - **Medium** — Utility functions, helpers, formatters
   - **Low** — Simple getters, config, constants
4. **Recommend** — For each gap, suggest specific test cases to write

## Output

```
## Coverage Summary
Overall: X% (if available)

## Critical Gaps
| File | Untested Area | Risk | Suggested Tests |

## Quick Wins
Tests that are easy to write and cover important paths.
```

## Principles

- 100% coverage is not the goal — meaningful coverage is
- Test behavior and outcomes, not implementation details
- Focus on code that handles money, auth, and user data first
- A test that can never fail is worse than no test
