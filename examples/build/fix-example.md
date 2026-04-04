# /fix — Example

## Input

```
$ npm run lint
src/utils/format.ts:23:5 - error TS2322: Type 'string | undefined' is not assignable to type 'string'.
src/api/users.ts:45:12 - error no-unused-vars: 'oldUser' is assigned a value but never used.

$ npm test
FAIL src/services/__tests__/auth.test.ts
  ● AuthService › login › should reject expired tokens
    Expected: "TOKEN_EXPIRED"
    Received: "INVALID_TOKEN"
```

## Expected Output

### Fixes Applied

**1. Type error** — `src/utils/format.ts:23`
- **Issue**: `formatDate()` returns `string | undefined` when `date` param is optional
- **Fix**: Added nullish coalescing with empty string default
  ```ts
  // Before
  const formatted: string = formatDate(user.createdAt);
  // After
  const formatted: string = formatDate(user.createdAt) ?? '';
  ```

**2. Lint error** — `src/api/users.ts:45`
- **Issue**: `oldUser` was captured for a comparison that was later removed
- **Fix**: Removed the unused variable. The comparison logic was deleted in a previous commit and this was left behind.

**3. Test failure** — `src/services/__tests__/auth.test.ts`
- **Issue**: `AuthService.login()` now throws `INVALID_TOKEN` for all token failures since the error handling was consolidated in PR #142. The test expects the old granular error code.
- **Fix**: Updated test expectation to match new behavior — `INVALID_TOKEN` is correct for expired tokens after the consolidation.

### Verification

```
$ npm run lint — 0 errors
$ npm test — 47 passed, 0 failed
```
