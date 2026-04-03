# Workflows

Commands are designed to compose. The output of one command serves as natural input to the next. Below are tested workflows for common development scenarios.

## Bug Fix

```
/investigate → /fix → /test → /commit
```

1. **`/investigate`** — Identify the root cause from symptoms or a bug report
2. **`/fix`** — Apply the minimal correct fix
3. **`/test`** — Generate tests that cover the bug and the fix
4. **`/commit`** — Commit with a clean message referencing the issue

## New Feature

```
/spec → /implement → /test → /review → /pr
```

1. **`/spec`** — Write a technical spec from requirements
2. **`/implement`** — Build the feature to the spec
3. **`/test`** — Generate comprehensive tests
4. **`/review`** — Self-review the diff before submitting
5. **`/pr`** — Open a draft PR with a clear description

## Architecture Change

```
/arch → /adr → /migration → /implement → /test → /pr
```

1. **`/arch`** — Design or evaluate the architecture
2. **`/adr`** — Record the decision and rationale
3. **`/migration`** — Plan the migration path
4. **`/implement`** — Execute the changes
5. **`/test`** — Validate nothing broke
6. **`/pr`** — Ship it

## Security Hardening

```
/security → /fix → /test → /review → /pr
```

1. **`/security`** — Audit for vulnerabilities
2. **`/fix`** — Remediate findings by severity
3. **`/test`** — Add tests for the security fixes
4. **`/review`** — Verify fixes don't introduce regressions
5. **`/pr`** — Open PR with security context

## Dependency Update

```
/deps → /fix → /test → /changelog → /pr
```

1. **`/deps`** — Audit for outdated/vulnerable packages
2. **`/fix`** — Update dependencies and resolve breaking changes
3. **`/test`** — Run full test suite
4. **`/changelog`** — Generate changelog of what changed
5. **`/pr`** — Open PR with upgrade notes

## Release Prep

```
/coverage → /docs → /release → /changelog → /pr
```

1. **`/coverage`** — Check test coverage gaps
2. **`/docs`** — Audit documentation completeness
3. **`/release`** — Run pre-release checklist
4. **`/changelog`** — Generate release notes
5. **`/pr`** — Open release PR

## Hotfix

```
/debug → /hotfix
```

1. **`/debug`** — Quickly diagnose the production issue
2. **`/hotfix`** — Create hotfix branch, apply fix, open PR

## Tech Debt Sprint

```
/debt → /refactor → /test → /pr
```

1. **`/debt`** — Identify and prioritize debt items
2. **`/refactor`** — Clean up highest-priority items
3. **`/test`** — Ensure refactors don't break anything
4. **`/pr`** — Ship with clear before/after context

## Tips

- You don't have to run the full workflow — start at any step
- Pass context between commands naturally: "fix the issues found above"
- Commands within `read-only` scope are always safe to run first
- Check `scope` metadata before running commands that modify files or push
