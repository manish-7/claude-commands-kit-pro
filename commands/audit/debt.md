---
description: Identify and prioritize technical debt
argument-hint: file path, directory, or area of concern
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: prioritized tech debt report
accepts: file path, directory, area description
---

# Technical Debt Audit

Assess technical debt in:

```
$ARGUMENTS
```

## Process

1. **Scan for signals** — Search for indicators of debt:
   - TODO/FIXME/HACK/WORKAROUND comments
   - Suppressed linter rules or warnings
   - Duplicated code blocks
   - Overly complex functions (high cyclomatic complexity)
   - Dead code and unused imports
   - Inconsistent patterns within the same codebase
   - Missing error handling or empty catch blocks
2. **Assess impact** — For each item, evaluate:
   - How much does it slow down development?
   - How likely is it to cause a bug?
   - How many people/features does it affect?
3. **Prioritize** — Rank using effort vs. impact:
   - **Quick wins** — Low effort, high impact → do first
   - **Strategic** — High effort, high impact → plan for
   - **Minor** — Low effort, low impact → do when nearby
   - **Defer** — High effort, low impact → document and move on

## Output

Prioritized list grouped by category (quick wins, strategic, minor, defer). Each item includes location, description, impact, and estimated effort.

## Principles

- Not all debt needs to be paid — some is acceptable
- Focus on debt that slows down current and upcoming work
- Quantify impact in terms of developer time or bug risk, not abstract quality
- Include the cost of NOT fixing it
