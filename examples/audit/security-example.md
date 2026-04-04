# /security — Example

## Input

```
src/api/
```

## Expected Output

### Security Audit: src/api/

**Critical** — `src/api/auth.ts:67`
- **CWE**: CWE-798 (Hardcoded Credentials)
- **Issue**: JWT secret is hardcoded as `const SECRET = "super-secret-key-123"`. Anyone with source access can forge tokens.
- **Fix**: Move to environment variable: `const SECRET = process.env.JWT_SECRET`. Add validation that it's set at startup.

**High** — `src/api/users.ts:34`
- **CWE**: CWE-89 (SQL Injection)
- **Issue**: User search endpoint interpolates query param directly: `` `WHERE name LIKE '%${query}%'` ``
- **Fix**: Use parameterized query: `WHERE name LIKE $1`, `['%' + query + '%']`

**High** — `src/api/files.ts:22`
- **CWE**: CWE-22 (Path Traversal)
- **Issue**: File download endpoint uses `req.params.filename` directly in `path.join(uploadsDir, filename)`. Attacker can use `../../etc/passwd`.
- **Fix**: Validate filename contains no path separators: `if (filename !== path.basename(filename)) throw 403`

**Medium** — `src/api/auth.ts:15`
- **CWE**: CWE-307 (Brute Force)
- **Issue**: Login endpoint has no rate limiting. Attacker can brute-force passwords.
- **Fix**: Add rate limiter: max 5 failed attempts per IP per 15 minutes.

**Low** — `src/api/index.ts:3`
- **CWE**: CWE-942 (Permissive CORS)
- **Issue**: CORS is set to `origin: '*'` — allows any domain to make authenticated requests.
- **Fix**: Restrict to known origins: `origin: ['https://app.example.com']`

### Prioritized Remediation Plan

1. **Immediately**: Remove hardcoded JWT secret (Critical)
2. **This sprint**: Fix SQL injection and path traversal (High)
3. **Next sprint**: Add login rate limiting (Medium)
4. **Backlog**: Restrict CORS origins (Low)
