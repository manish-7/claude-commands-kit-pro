---
description: Trace a request or event through the system end-to-end
argument-hint: endpoint, event name, or entry point (e.g., "POST /api/orders")
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: end-to-end trace with sequence diagram
accepts: endpoint, event name, function name, file path
---

# Trace

Trace the following request or event through the system:

```
$ARGUMENTS
```

## Process

1. **Find the entry point** — Locate the route handler, event listener, queue consumer, or entry function
2. **Follow the call chain** — Trace each step from entry to exit:
   - Middleware and interceptors
   - Validation and parsing
   - Business logic and service calls
   - Database queries and external API calls
   - Response building and serialization
3. **Map side effects** — Identify everything that happens along the way: logging, events emitted, cache updates, async jobs queued
4. **Document the path** — Create a clear step-by-step trace with file references

## Output

### Trace
Numbered list of each step with `file:line` references and a one-line description of what happens.

### Sequence Diagram
```mermaid
sequenceDiagram
    participant Client
    participant Handler
    participant Service
    participant Database
    ...
```

### Side Effects
List of all side effects (events, logs, cache, async jobs) triggered during this flow.

### Error Paths
How errors at each step are handled and what the client receives.

## Principles

- Follow the actual code path, not what you'd expect
- Include middleware and interceptors — they matter
- Note where errors are caught vs. propagated
- Flag any steps that seem unnecessary or redundant
