---
description: Plan a data or system migration with rollback strategy
argument-hint: what's being migrated (e.g., "PostgreSQL to MySQL", "monolith to microservices")
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: migration plan with steps and rollback strategy
accepts: migration description, source/target systems
---

# Migration Plan

Plan a migration for:

```
$ARGUMENTS
```

## Process

1. **Assess current state** — Map what exists today: schemas, data volumes, dependencies, consumers, and integrations
2. **Define target state** — What the system looks like after migration. Be specific about schemas, APIs, and behavior changes.
3. **Identify risks** — Data loss scenarios, downtime requirements, backwards compatibility, and rollback triggers
4. **Design the plan** — Break into phases:
   - **Phase 1: Prepare** — Dual-write, feature flags, shadow reads
   - **Phase 2: Migrate** — Data migration scripts, cutover steps
   - **Phase 3: Verify** — Validation queries, smoke tests, monitoring
   - **Phase 4: Clean up** — Remove old code paths, drop old tables
5. **Rollback strategy** — For each phase, define how to safely revert

## Output

Phased plan with:
- Step-by-step instructions per phase
- Estimated risk level per step
- Rollback procedure per phase
- Validation criteria before proceeding to next phase

## Principles

- Every phase must be independently reversible
- Never delete old data until the new system is proven in production
- Dual-write is safer than big-bang cutover
- Define "done" criteria before starting — don't migrate without success metrics
