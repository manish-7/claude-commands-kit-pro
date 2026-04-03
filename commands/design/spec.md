---
description: Write a technical specification from requirements
argument-hint: feature description, requirements, or problem statement
scope: read-only
allowed-tools: Read, Grep, Glob
outputs: technical specification document
accepts: feature description, requirements, problem statement
---

# Technical Specification

Write a technical spec for:

```
$ARGUMENTS
```

## Process

1. **Understand the problem** — What needs to be solved and why. What's the user-facing impact.
2. **Survey the codebase** — Read existing code in the area to understand current patterns, constraints, and extension points.
3. **Design the solution** — Propose a specific approach covering:
   - **Data model** — New or modified schemas, types, and relationships
   - **API surface** — Endpoints, events, or interfaces being added or changed
   - **Logic flow** — Step-by-step behavior for the main scenarios
   - **Edge cases** — How to handle errors, conflicts, and boundary conditions
4. **Scope** — Define what's in scope and what's explicitly out of scope

## Output

```markdown
## Problem
## Proposed Solution
## Data Model
## API Changes
## Implementation Steps
## Edge Cases & Error Handling
## Out of Scope
## Open Questions
```

## Principles

- Be specific enough that another engineer could implement from this spec
- Reference existing code patterns to anchor the design
- Call out what you're NOT doing — explicit scope prevents creep
- List open questions rather than making silent assumptions
