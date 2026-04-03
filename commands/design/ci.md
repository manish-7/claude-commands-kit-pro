---
description: Design or fix CI/CD pipelines
argument-hint: CI system (GitHub Actions, GitLab CI, etc.) and what needs to change
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: CI/CD configuration files
accepts: CI system, pipeline description, existing config to fix
---

# CI/CD Pipeline

Design or fix CI/CD for:

```
$ARGUMENTS
```

## Process

1. **Assess** — Read existing CI/CD configuration. Understand the current pipeline stages, triggers, and artifacts.
2. **Design or fix** — Based on the request:
   - **New pipeline**: Design stages (lint → test → build → deploy) with appropriate triggers, caching, and parallelization
   - **Fix**: Identify why the pipeline is failing and apply the correct fix
   - **Optimize**: Reduce build time through caching, parallelization, and conditional execution
3. **Implement** — Write or modify the configuration files
4. **Validate** — Check syntax and common mistakes (missing permissions, wrong paths, circular dependencies)

## Output

Configuration file(s) with inline comments explaining non-obvious choices.

## Principles

- Fast feedback — lint and unit tests should run first and fast
- Cache aggressively — dependencies, build artifacts, Docker layers
- Fail fast — stop the pipeline on the first failure
- Keep secrets in the CI system, never in config files
- Pipeline-as-code — everything versioned, nothing configured in the UI
