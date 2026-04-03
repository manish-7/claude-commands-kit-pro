---
description: Diagnose a bug from symptoms or error output
argument-hint: error message, stack trace, or bug description
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: root cause analysis with fix recommendation
accepts: error output, stack trace, bug description, file path
---

# Debug

Diagnose the following issue:

```
$ARGUMENTS
```

## Process

1. **Parse the signal** — Extract the key information: error type, message, file, line number, stack trace, or behavioral description
2. **Form hypotheses** — Based on the error, list 2-3 most likely root causes ranked by probability
3. **Investigate** — For each hypothesis, read the relevant code and verify or eliminate:
   - Check the exact line referenced in the error
   - Trace the data flow backwards to find where things go wrong
   - Look for recent changes in the area (`git log` / `git blame`)
4. **Confirm root cause** — Identify the specific line(s) and condition causing the issue
5. **Recommend fix** — Describe the minimal change needed, with the exact code

## Output

```
**Root Cause**: One-line summary
**Location**: file:line
**Why**: Explanation of the failure mechanism
**Fix**: Specific code change
**Confidence**: High / Medium / Low
```

## Principles

- Start from the error, not from assumptions
- Read the actual code before theorizing
- Prefer the simplest explanation that fits all symptoms
- If confidence is low, say so and suggest what to check next
