# Claude Commands Kit Pro

A curated, production-grade collection of custom commands for [Claude Code](https://docs.anthropic.com/en/docs/claude-code). Built for real workflows — composable, validated, and easy to install.

## What's Different

| Feature | Other Repos | This Kit |
|---------|-------------|----------|
| Scope metadata | No | `scope: read-only \| modifies-files \| creates-commits \| pushes` |
| Composability | Hinted | Documented workflows with input/output contracts |
| Validation | None | `validate.sh` enforces template structure |
| Install/Update | Manual copy | One-liner install script |
| Examples | None | [Sample input/output](examples/) per category |
| Contribution guide | None | Checklist + review criteria |

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
