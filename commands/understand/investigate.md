---
description: Deep-dive into a codebase question with thorough research
argument-hint: question about the codebase (e.g., "how does auth work?")
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: comprehensive research report
accepts: question, topic, file path
---

# Investigate

Research the following question thoroughly:

```
$ARGUMENTS
```

## Process

1. **Scope the question** — Clarify what specifically needs to be answered. If the question is broad, break it into sub-questions.
2. **Find entry points** — Search for relevant files, functions, types, and configuration. Cast a wide net — check code, tests, config, and documentation.
3. **Trace the paths** — Follow the code paths end-to-end. Map how data flows, how components interact, how state changes.
4. **Gather evidence** — Collect specific code references, not generalizations. Note anything surprising, inconsistent, or undocumented.
5. **Synthesize** — Answer the original question with a clear narrative backed by evidence.

## Output

Structure as:
- **Answer** — Direct answer in 2-3 sentences
- **Details** — Thorough walkthrough with `file:line` references
- **Key files** — List of the most important files related to this question
- **Open questions** — Anything you couldn't determine from the code alone

## Principles

- Be thorough — check tests, config, and docs, not just source code
- Cite specific locations, not vague references
- Distinguish between what the code does and what it's supposed to do
- Flag dead code, inconsistencies, or undocumented behavior
