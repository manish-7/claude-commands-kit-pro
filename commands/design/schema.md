---
description: Design or review a database schema
argument-hint: domain description, entity list, or existing schema to review
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: schema design or review report with DDL
accepts: domain description, entity list, existing migration files, SQL
---

# Database Schema

Design or review a database schema for:

```
$ARGUMENTS
```

## For New Schemas

1. **Identify entities** — List the domain objects, their attributes, and relationships
2. **Normalize** — Design tables in appropriate normal form. Denormalize only with justification (read performance, query simplicity).
3. **Define constraints** — Primary keys, foreign keys, unique constraints, check constraints, not-null
4. **Plan indexes** — Based on expected query patterns. Cover foreign keys, common WHERE/ORDER BY columns, and composite indexes for multi-column queries.
5. **Generate DDL** — Produce the CREATE TABLE statements or migration file

## For Existing Schemas

1. **Audit** — Review for:
   - Missing indexes on foreign keys or frequently queried columns
   - Missing constraints (nullability, uniqueness, foreign keys)
   - Over/under-normalization
   - Data type choices (too wide, too narrow, wrong type)
   - Naming inconsistencies
2. **Recommend** — Prioritized list of changes with migration scripts

## Output

Entity-relationship description + DDL or migration statements. Include index rationale.

## Principles

- Every table needs a primary key — no exceptions
- Foreign keys should have indexes
- Choose the narrowest data type that fits
- Name consistently: `snake_case`, singular table names, `_id` suffix for foreign keys
- Design for the queries you'll run, not just the data you'll store
