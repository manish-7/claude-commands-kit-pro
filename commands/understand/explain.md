---
description: Explain how code works at any level of detail
argument-hint: file path, function name, or paste code
scope: read-only
allowed-tools: Read, Grep, Glob
outputs: structured explanation with context
accepts: file path, function name, code snippet
---

# Explain Code

Explain the following code clearly and thoroughly:

```
$ARGUMENTS
```

## Process

1. **Locate** — Find the code in question. If a file path is given, read it. If a name is given, search for it.
2. **Understand context** — Identify callers, callees, and related types. Read enough surrounding code to understand the role this code plays.
3. **Explain** — Walk through the logic in plain language, covering:
   - **Purpose** — What problem does this solve and why does it exist
   - **How it works** — Step-by-step logic flow
   - **Key decisions** — Non-obvious design choices and their rationale
   - **Dependencies** — What it relies on and what relies on it
4. **Summarize** — End with a one-paragraph summary suitable for a code review comment

## Output

Structure the explanation with clear headings. Use code references in `file:line` format. Adjust depth to the complexity — simple code gets a brief explanation, complex code gets a detailed walkthrough.

## Principles

- Explain the *why*, not just the *what*
- Don't restate the code in English — add insight
- Flag anything that looks like a bug, smell, or potential issue
- Match explanation depth to code complexity
