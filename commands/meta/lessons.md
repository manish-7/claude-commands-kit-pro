---
description: Review and update lessons learned from corrections and mistakes
argument-hint: correction or mistake to record, or "review" to see all lessons
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: updated tasks/lessons.md
accepts: correction description, "review" keyword
---

# Lessons

Manage the self-improvement loop:

```
$ARGUMENTS
```

## Process

1. **Check for lessons file** — Look for `tasks/lessons.md` in the project root. Create it if it doesn't exist.
2. **If recording a new lesson**:
   - Identify the pattern: what went wrong and why
   - Write a clear, actionable rule that prevents the same mistake
   - Categorize it (code style, architecture, testing, workflow, communication)
   - Add it to `tasks/lessons.md` with the date
3. **If reviewing lessons**:
   - Read `tasks/lessons.md`
   - Summarize the active lessons grouped by category
   - Flag any that seem outdated or superseded
4. **Apply** — Before starting any new task, check if any existing lessons are relevant

## Output

When recording:
```markdown
## [Category] - Short description
**Date**: YYYY-MM-DD
**Mistake**: What happened
**Rule**: What to do instead — specific and actionable
**Why**: Root cause, so edge cases can be judged
```

When reviewing: grouped summary with relevance to current work.

## Principles

- Lessons must be specific and actionable — "be more careful" is not a lesson
- Write rules that your future self can follow mechanically
- Remove lessons that are no longer relevant — stale rules cause confusion
- Review lessons at the start of every session, not just when things go wrong
