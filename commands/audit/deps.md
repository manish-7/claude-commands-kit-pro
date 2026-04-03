---
description: Audit dependencies for vulnerabilities, outdated packages, and risks
argument-hint: package file path or just run to auto-detect
scope: read-only
allowed-tools: Read, Grep, Glob, Bash
outputs: dependency audit report
accepts: file path, package manager name
---

# Dependency Audit

Audit dependencies for:

```
$ARGUMENTS
```

## Process

1. **Find package files** — Locate package.json, requirements.txt, Cargo.toml, go.mod, *.csproj, or equivalent
2. **Check vulnerabilities** — Run the package manager's audit command (`npm audit`, `pip audit`, `dotnet list package --vulnerable`, etc.)
3. **Check outdated** — List packages that are behind the latest version, grouped by:
   - **Major** — Breaking changes likely, review changelog
   - **Minor** — New features, usually safe
   - **Patch** — Bug fixes, update freely
4. **Assess risks** — Flag:
   - Packages with no recent maintenance (>12 months)
   - Packages with very few downloads or maintainers
   - Unnecessary dependencies that could be removed
   - Duplicate packages serving the same purpose

## Output

```
## Vulnerabilities (X found)
| Package | Severity | CVE | Fix |

## Outdated (X packages)
| Package | Current | Latest | Type |

## Risks
- Unmaintained: ...
- Removable: ...
```

## Principles

- Vulnerabilities with known exploits are urgent — everything else can wait
- Update one major version at a time and test between each
- Fewer dependencies = smaller attack surface
- Prefer packages with active maintenance and broad adoption
