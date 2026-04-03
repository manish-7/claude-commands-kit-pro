---
description: Pre-release validation checklist
argument-hint: version number or just run for current state
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: release readiness report
accepts: version number, release branch
---

# Release Checklist

Validate release readiness for:

```
$ARGUMENTS
```

## Process

1. **Build** — Verify the project builds cleanly with no warnings or errors
2. **Tests** — Run the full test suite. All tests must pass.
3. **Dependencies** — Check for known vulnerabilities in dependencies
4. **Version** — Verify version numbers are bumped in all relevant files (package.json, *.csproj, CHANGELOG, etc.)
5. **Changelog** — Confirm changelog is updated for this version
6. **Configuration** — Check for:
   - Debug flags or dev-only settings left enabled
   - Hardcoded localhost URLs or test credentials
   - TODO/FIXME comments in critical paths
7. **Migration** — If there are database migrations, verify they're included and tested
8. **Breaking changes** — Identify any breaking changes and verify they're documented

## Output

```
## Release Readiness: READY / NOT READY

### Passed
- [x] Build clean
- [x] Tests passing (X/X)

### Failed
- [ ] Issue description and what to fix

### Warnings
- [ ] Non-blocking concerns
```

## Principles

- A failed check means NOT READY — no exceptions
- Warnings are informational but don't block the release
- This checklist catches mechanical issues — it doesn't replace QA
- Better to delay a release than to ship a known issue
