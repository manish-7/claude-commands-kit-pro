---
description: Design or review an API (REST, GraphQL, gRPC, etc.)
argument-hint: API requirements, endpoint description, or existing API to review
scope: read-only
allowed-tools: Read, Grep, Glob
outputs: API design or review report
accepts: requirements, endpoint description, OpenAPI spec, existing code
---

# API Design

Design or review the following API:

```
$ARGUMENTS
```

## For New APIs

1. **Define resources** — Identify the domain objects and their relationships
2. **Design endpoints** — For each resource:
   - HTTP method and path
   - Request/response schemas with types
   - Status codes and error responses
   - Query parameters, pagination, filtering
3. **Consistency check** — Ensure naming, casing, and patterns are consistent across all endpoints
4. **Document** — Produce an OpenAPI-style specification

## For Existing APIs

1. **Audit** — Review for:
   - Naming consistency (plural nouns, kebab-case, etc.)
   - Proper HTTP method usage (GET for reads, POST for creates, etc.)
   - Error response consistency
   - Missing pagination, filtering, or sorting
   - Versioning strategy
   - Authentication and authorization patterns
2. **Report** — List issues ranked by severity with specific fix recommendations

## Output

For new APIs: endpoint table + detailed schema definitions.
For reviews: issue list with severity and recommendations.

## Principles

- Consistency beats cleverness — every endpoint should feel like the same person designed it
- Use standard HTTP semantics correctly
- Design for the client, not the database — don't expose internal structure
- Paginate all list endpoints — no exceptions
