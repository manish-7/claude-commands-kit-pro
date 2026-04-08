# Claude Commands Kit Pro

A curated, production-grade collection of custom commands for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Built for real workflows — composable, validated, and easy to install.

## Features

- **Scope metadata** — Every command declares `read-only`, `modifies-files`, `creates-commits`, or `pushes` so you know the impact before running
- **Composable workflows** — Documented [pipelines](workflows/README.md) with input/output contracts showing how commands chain together
- **Validated structure** — `validate.sh` enforces frontmatter, section order, and line limits across all commands
- **One-liner install** — `install.sh` with symlink support, category filtering, and easy updates
- **Examples included** — [Sample input/output](examples/) for each category showing real-world usage
- **Contribution ready** — Quality checklist, command template, and review criteria in [CONTRIBUTING.md](CONTRIBUTING.md)

## Example: `/review`

Run `/commands:ship:review PR #247` and get:

```
Review: PR #247 — Add user preferences API

Blocker — src/api/preferences.ts:34
  SQL injection via string interpolation in query.
  Fix: Use parameterized query with $1 placeholder.

Major — src/services/PreferenceService.ts:52
  No authorization check — any user can read/write any other user's preferences.
  Fix: Add requestingUserId !== targetUserId guard.

Minor — src/api/preferences.ts:18
  Missing input validation on PATCH — accepts arbitrary keys.
  Fix: Validate against allowlist of known preference keys.

Summary: Not ready to merge. 1 blocker and 1 major must be fixed.
```

See more [examples](examples/) for every category.

## Commands

### Understand — Analyze and explore code

| Command | Description | Scope |
|---------|-------------|-------|
| `/explain` | Explain how code works at any level of detail | read-only |
| `/debug` | Diagnose a bug from symptoms or error output | read-only |
| `/investigate` | Deep-dive into a codebase question | read-only |
| `/trace` | Trace a request/event through the system end-to-end | read-only |

### Build — Write and improve code

| Command | Description | Scope |
|---------|-------------|-------|
| `/implement` | Implement a feature from a description or spec | modifies-files |
| `/fix` | Fix lint errors, type errors, or failing tests | modifies-files |
| `/refactor` | Restructure code without changing behavior | modifies-files |
| `/test` | Generate tests for existing code | modifies-files |
| `/perf` | Find and fix performance bottlenecks | modifies-files |
| `/scaffold` | Generate boilerplate for a new module or feature | modifies-files |

### Ship — Commit, review, and deploy

| Command | Description | Scope |
|---------|-------------|-------|
| `/commit` | Stage and commit with a clean message | creates-commits |
| `/pr` | Create a branch, push, and open a draft PR | pushes |
| `/review` | Review a PR or diff for issues | read-only |
| `/sync` | Rebase or merge upstream changes | modifies-files |
| `/pr-fix` | Address PR review comments | modifies-files |
| `/changelog` | Generate a changelog from recent commits | read-only |
| `/hotfix` | Create a hotfix branch, fix, and open a PR | pushes |
| `/deploy` | Run deployment commands or generate deploy config | modifies-files |

### Design — Plan and architect

| Command | Description | Scope |
|---------|-------------|-------|
| `/arch` | Design or evaluate system architecture | read-only |
| `/spec` | Write a technical specification | read-only |
| `/api` | Design or review an API | read-only |
| `/adr` | Write an Architecture Decision Record | modifies-files |
| `/migration` | Plan a data or system migration | read-only |
| `/schema` | Design or review a database schema | read-only |
| `/ci` | Design or fix CI/CD pipelines | modifies-files |
| `/prd` | Write a Product Requirements Document from a feature idea | read-only |

### Audit — Assess and improve quality

| Command | Description | Scope |
|---------|-------------|-------|
| `/security` | Security audit with severity ratings and fixes | read-only |
| `/deps` | Audit dependencies for risks and updates | read-only |
| `/debt` | Identify and prioritize technical debt | read-only |
| `/docs` | Audit documentation completeness and accuracy | read-only |
| `/coverage` | Analyze test coverage gaps and suggest tests | read-only |
| `/release` | Pre-release checklist and validation | read-only |

### Meta — Workflow orchestration and self-improvement

| Command | Description | Scope |
|---------|-------------|-------|
| `/plan` | Create a structured plan with checkable items in `tasks/todo.md` | modifies-files |
| `/verify` | Verify completed work meets quality standards before calling it done | read-only |
| `/lessons` | Record and review lessons learned from corrections | modifies-files |

## CLAUDE.md Template

Drop the included [CLAUDE.md template](templates/CLAUDE.md) into your project root for a ready-to-use project config with workflow orchestration rules, task management patterns, and core principles. Pair it with the commands for best results.

```bash
cp templates/CLAUDE.md /path/to/your/project/CLAUDE.md
```

## Install

```bash
# Clone and install (symlinks into ~/.claude/commands/)
git clone https://github.com/yourusername/claude-commands-kit-pro.git
cd claude-commands-kit-pro
./install.sh

# Update to latest
cd claude-commands-kit-pro && git pull && ./install.sh
```

Or install specific categories only:

```bash
./install.sh --only build,ship
```

## Usage

Invoke any command in Claude Code:

```
/commands:build:fix paste error output here
/commands:audit:security src/api/
/commands:understand:trace POST /api/orders
```

## Workflows

Commands are designed to chain. See [workflows/README.md](workflows/README.md) for documented pipelines:

```
/investigate → /fix → /test → /commit
/arch → /spec → /implement → /test → /pr
/security → /fix → /review → /pr
```

## Validate Commands

Run the validator to check all commands follow the template:

```bash
./validate.sh                    # Validate all commands
./validate.sh commands/build/    # Validate one category
```

## Create Your Own

```bash
cp templates/command-template.md commands/build/my-command.md
# Edit the file, then validate
./validate.sh commands/build/my-command.md
```

See [CONTRIBUTING.md](CONTRIBUTING.md) for the full guide.

## License

MIT
