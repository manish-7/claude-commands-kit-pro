# /lessons — Example

## Input: Recording a new lesson

```
I told you to use parameterized queries and you used string interpolation again
```

## Expected Output

Updated `tasks/lessons.md`:

```markdown
## [Security] - Always use parameterized queries
**Date**: 2026-04-04
**Mistake**: Used string interpolation for SQL query construction instead of
parameterized queries, creating a SQL injection vulnerability.
**Rule**: Never construct SQL queries with string interpolation or template
literals. Always use the database driver's parameterized query API ($1, ?, @param).
**Why**: String interpolation in SQL is the #1 source of injection vulnerabilities.
Even when the input "looks safe," always parameterize — no exceptions.
```

---

## Input: Reviewing lessons

```
review
```

## Expected Output

### Active Lessons (4 total)

**Security (2)**
- Always use parameterized queries — never string interpolation for SQL
- Check authorization on every endpoint — don't assume middleware covers it

**Code Style (1)**
- Use the project's existing test patterns — don't introduce new assertion libraries

**Workflow (1)**
- Run the full test suite before marking a task complete, not just the changed tests

All lessons are current and relevant to ongoing work. No stale entries to remove.
