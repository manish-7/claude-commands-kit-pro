---
description: Security audit identifying vulnerabilities with severity and fixes
argument-hint: file path, directory, or paste code
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: security audit report with prioritized findings
accepts: file path, directory, code snippet
---

# Security Audit

Perform a security audit of:

```
$ARGUMENTS
```

## Process

1. **Input validation** — Injection (SQL, NoSQL, command, XSS), path traversal, deserialization
2. **Authentication & authorization** — Auth bypass, privilege escalation, missing checks, session management
3. **Data protection** — Secrets in code, PII exposure, missing encryption, insecure storage
4. **Dependencies** — Known CVEs, outdated packages, supply chain risks
5. **Configuration** — Permissive CORS, debug mode in prod, insecure defaults, exposed endpoints
6. **Cryptography** — Weak algorithms, improper key management, predictable tokens

## Output

For each vulnerability:
- **Severity**: Critical / High / Medium / Low (use CVSS reasoning)
- **Location**: `file:line`
- **CWE**: Reference number if applicable
- **Issue**: What's wrong and how it could be exploited
- **Fix**: Specific code change to remediate

End with a **Prioritized Remediation Plan** ordered by severity.

## Principles

- Assume an attacker who knows the codebase — security through obscurity is not a defense
- Every finding needs a specific, actionable fix — not just "validate input"
- False positives erode trust — only report real issues
- Check for secrets in git history, not just current files
