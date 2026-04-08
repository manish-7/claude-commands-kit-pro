---
description: Brainstorm ideas and options with pros, cons, and a recommendation
argument-hint: problem, question, or area to explore (e.g., "how should we handle caching?")
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: ranked options with tradeoff analysis and recommendation
accepts: problem statement, question, constraint description
---

# Ideate

Brainstorm options for:

```
$ARGUMENTS
```

## Process

1. **Understand the problem space** — Clarify what we're deciding, who it affects, and what constraints exist. If a codebase is available, read relevant areas to ground ideas in reality.
2. **Generate options** — Produce 3-5 genuinely different approaches. Not variations of the same idea — each should represent a different tradeoff or philosophy.
3. **Analyze each option** — For every option, evaluate:
   - **How it works** — Concrete description, not hand-wavy
   - **Pros** — What it gets right
   - **Cons** — What it gets wrong or makes harder
   - **Effort** — Low / Medium / High
   - **Risk** — What could go wrong
4. **Recommend** — Pick one and say why. If it depends on context, state the deciding factor clearly.

## Output

For each option:
```
### Option N: Name
**How it works:** Description
**Pros:** What's good
**Cons:** What's not
**Effort:** Low / Medium / High
**Risk:** What could go wrong
```

End with:
```
### Recommendation
Option N because [reason]. Choose Option M instead if [condition].
```

## Principles

- Every option must be genuinely viable — don't include a straw man just to make one option look better
- Be opinionated in the recommendation — "it depends" is not a recommendation
- Ground ideas in the actual codebase and constraints, not theoretical ideals
- Effort and risk matter as much as elegance
