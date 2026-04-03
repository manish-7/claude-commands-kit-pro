---
description: Audit documentation completeness and accuracy
argument-hint: file path, directory, or just run for the whole project
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: documentation gap report
accepts: file path, directory
---

# Documentation Audit

Audit documentation for:

```
$ARGUMENTS
```

## Process

1. **Inventory** — Find all documentation: README, API docs, inline comments, doc comments, wikis, ADRs, and guides
2. **Check completeness** — Verify each area is documented:
   - **Setup** — Can a new developer get running from the docs alone?
   - **Architecture** — Are the major components and their relationships explained?
   - **API** — Are all public endpoints/interfaces documented with examples?
   - **Configuration** — Are all environment variables and config options listed?
   - **Deployment** — Are deploy steps documented and up to date?
   - **Contributing** — Are conventions, branching strategy, and PR process documented?
3. **Check accuracy** — Compare documentation against actual code:
   - Do documented APIs match the implementation?
   - Do setup instructions actually work?
   - Are there documented features that no longer exist?
4. **Check quality** — Are docs clear, well-organized, and free of jargon?

## Output

| Area | Status | Gap |
|------|--------|-----|
| Setup | Missing / Outdated / OK | What's needed |

End with prioritized list of documentation to write or update.

## Principles

- Docs that exist but are wrong are worse than no docs
- Prioritize docs that save the most people the most time
- Setup docs are the highest priority — everything else follows
- Good docs explain *why*, not just *how*
