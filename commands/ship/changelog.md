---
description: Generate a changelog from recent commits or between versions
argument-hint: version range, tag, or number of commits (e.g., "v1.2.0..HEAD")
scope: read-only
allowed-tools: Bash(git:*), Read, Grep
outputs: formatted changelog
accepts: version range, tag name, commit count
---

# Changelog

Generate a changelog for:

```
$ARGUMENTS
```

## Process

1. **Determine range** — If a version range is given, use it. If a number, use the last N commits. If nothing, use commits since the last tag.
2. **Collect commits** — Get all commits in the range with their messages, authors, and dates
3. **Categorize** — Group by type based on commit messages and actual changes:
   - **Features** — New functionality
   - **Fixes** — Bug fixes
   - **Performance** — Speed or resource improvements
   - **Breaking Changes** — Changes that require action from users
   - **Internal** — Refactoring, CI, docs, dependencies
4. **Format** — Write a clean, human-readable changelog

## Output

```markdown
## [version] - YYYY-MM-DD

### Features
- Description of feature (#PR)

### Fixes
- Description of fix (#PR)

### Breaking Changes
- What changed and what to do about it
```

## Principles

- Write for the reader (user/developer), not the committer
- Summarize the *impact*, not the implementation details
- Group related commits into a single entry
- Always surface breaking changes prominently
