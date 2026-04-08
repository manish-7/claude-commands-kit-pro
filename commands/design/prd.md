---
description: Write a Product Requirements Document from a feature idea or problem statement
argument-hint: feature idea, problem statement, or user need
scope: read-only
allowed-tools: Read, Grep, Glob
outputs: product requirements document
accepts: feature idea, problem statement, user need, market context
---

# Product Requirements Document

Write a PRD for:

```
$ARGUMENTS
```

## Process

1. **Define the problem** — What user pain or business need drives this. Who experiences it, how often, and what happens if we don't solve it.
2. **Survey existing state** — If a codebase is available, read the relevant areas to understand what exists today and what constraints apply.
3. **Write the PRD** — Cover every section below with enough detail that engineering can estimate and design can prototype without follow-up questions.

## Output

```markdown
## Problem Statement
What's broken or missing, who it affects, and why it matters now.

## Goals & Success Metrics
- Primary goal with measurable outcome
- Key metrics to track (adoption, engagement, revenue, time saved, etc.)
- What "done" looks like from the user's perspective

## User Stories
- As a [persona], I want [action] so that [outcome]
- As a [persona], I want [action] so that [outcome]

## Requirements
### Must Have (P0)
- Requirement with acceptance criteria

### Should Have (P1)
- Requirement with acceptance criteria

### Nice to Have (P2)
- Requirement with acceptance criteria

## User Experience
- Key flows and interactions described step by step
- Edge cases: what happens when things go wrong from the user's side
- Accessibility and platform considerations

## Out of Scope
- What we're explicitly NOT building and why

## Dependencies & Risks
- External dependencies (APIs, teams, data)
- Risks and mitigations

## Open Questions
- Decisions that need stakeholder input before engineering starts
```

## Principles

- Write for engineers and designers who haven't seen the problem before
- Acceptance criteria must be testable — vague criteria produce vague implementations
- Prioritize ruthlessly — if everything is P0, nothing is
- Include what's out of scope — it prevents scope creep better than anything else
- Success metrics must be measurable on day one, not aspirational
