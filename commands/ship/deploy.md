---
description: Run deployment steps or generate deployment configuration
argument-hint: environment name or deployment description
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: deployment status or config files
accepts: environment name, deployment description
---

# Deploy

Deploy or prepare deployment for:

```
$ARGUMENTS
```

## Process

1. **Find deploy config** — Look for existing deployment configuration: Dockerfiles, CI/CD pipelines, deploy scripts, IaC files
2. **Assess readiness** — Check:
   - Build passes
   - Tests pass
   - No uncommitted changes
   - Branch is up to date with remote
3. **Execute or generate** — Based on what's needed:
   - **Run deployment**: Execute the project's deploy commands for the target environment
   - **Generate config**: Create or update deployment configuration files
   - **Document steps**: If deployment is manual, produce a step-by-step runbook
4. **Verify** — Confirm the deployment succeeded or the configuration is valid

## Principles

- Never deploy with failing tests or uncommitted changes
- Always confirm the target environment before executing
- Prefer dry-run when available to preview changes
- Don't modify production configuration without explicit confirmation
