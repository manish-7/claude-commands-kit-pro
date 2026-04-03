---
description: Find and fix performance bottlenecks
argument-hint: file path, endpoint, or description of slowness
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: optimized code with before/after analysis
accepts: file path, endpoint, performance complaint, profiling output
---

# Performance

Analyze and optimize the following for performance:

```
$ARGUMENTS
```

## Process

1. **Profile** — If profiling data is provided, analyze it. Otherwise, read the code and identify likely bottlenecks:
   - N+1 queries or unbounded loops
   - Missing indexes or full table scans
   - Unnecessary allocations or copies
   - Synchronous operations that could be parallel
   - Missing caching for repeated expensive operations
2. **Quantify** — Estimate the impact of each issue. Focus on what matters most.
3. **Optimize** — Apply fixes in order of impact:
   - Algorithmic improvements first (O(n²) → O(n log n))
   - I/O optimizations second (batching, caching, parallelization)
   - Micro-optimizations last (only if they matter)
4. **Verify** — Run benchmarks or tests to confirm the fix helps and doesn't break correctness

## Output

For each finding:
- **Issue**: What's slow and why
- **Location**: `file:line`
- **Impact**: Estimated severity (Critical / High / Medium / Low)
- **Fix**: Specific change applied or recommended

## Principles

- Measure before optimizing — gut feelings about performance are often wrong
- Correctness over speed — a fast wrong answer is worse than a slow right one
- Don't optimize code that runs rarely or processes small data
- Prefer simple optimizations with large impact over clever ones with marginal gains
