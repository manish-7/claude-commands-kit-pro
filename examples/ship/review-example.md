# /review — Example

## Input

```
PR #247
```

## Expected Output

### Review: PR #247 — Add user preferences API

**Blocker** — `src/api/preferences.ts:34`
- **Issue**: SQL injection via string interpolation in query
  ```ts
  const result = await db.query(`SELECT * FROM preferences WHERE user_id = '${userId}'`);
  ```
- **Suggestion**: Use parameterized query: `db.query('SELECT * FROM preferences WHERE user_id = $1', [userId])`

**Major** — `src/services/PreferenceService.ts:52`
- **Issue**: No authorization check — any authenticated user can read/write preferences for any other user
- **Suggestion**: Add `if (requestingUserId !== targetUserId) throw new ForbiddenError()`

**Minor** — `src/api/preferences.ts:18`
- **Issue**: Missing input validation on `PATCH /preferences` — accepts arbitrary keys
- **Suggestion**: Validate against an allowlist of known preference keys

**Nit** — `src/models/Preference.ts:5`
- **Issue**: `updatedAt` field is typed as `string` but stored as `timestamp` in DB
- **Suggestion**: Use `Date` type for consistency with other models

**Praise** — Clean separation between controller/service/repository. Tests cover the happy path well.

### Summary

**Not ready to merge.** 1 blocker (SQL injection) and 1 major (missing auth check) must be fixed. The minor and nit are optional but recommended.
