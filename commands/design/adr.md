---
description: Write an Architecture Decision Record
argument-hint: decision topic or question (e.g., "choose a message queue")
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: ADR markdown file
accepts: decision topic, question, context
---

# Architecture Decision Record

Document the following architectural decision:

```
$ARGUMENTS
```

## Process

1. **Understand context** — Read relevant code and configuration to understand the current state and constraints
2. **Research options** — Identify 2-4 viable alternatives. For each, consider: complexity, cost, team familiarity, ecosystem maturity, and migration effort
3. **Decide** — Recommend a specific option with clear justification
4. **Write the ADR** — Create a numbered ADR file in the project's docs directory

## Output

```markdown
# ADR-NNN: Title

## Status
Proposed

## Context
What is the issue that we're seeing that is motivating this decision.

## Decision
What is the change that we're proposing and/or doing.

## Alternatives Considered
### Option A
- Pros
- Cons

### Option B
- Pros
- Cons

## Consequences
What becomes easier or more difficult because of this change.
```

## Principles

- ADRs are immutable once accepted — supersede, don't edit
- Be honest about tradeoffs — every option has downsides
- Include enough context for someone reading this in 6 months
- "We decided" not "I recommend" — ADRs record decisions, not proposals
