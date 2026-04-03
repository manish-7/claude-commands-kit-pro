# Contributing

Thanks for contributing! This guide ensures every command meets a consistent quality bar.

## Before You Start

1. Check [existing commands](commands/) to avoid overlap
2. Read the [command template](templates/command-template.md)
3. One command = one focused purpose

## Creating a New Command

1. Copy the template:
   ```bash
   cp templates/command-template.md commands/<category>/<name>.md
   ```

2. Fill in all required frontmatter fields:
   ```yaml
   ---
   description: One-line description (required)
   argument-hint: What input to provide (required)
   scope: read-only | modifies-files | creates-commits | pushes (required)
   allowed-tools: Comma-separated tool list (required)
   outputs: What this command produces (required)
   accepts: What input formats work (required)
   ---
   ```

3. Follow the section order:
   - **Title** — `# Command Name`
   - **Brief framing** — 1-2 sentences + `$ARGUMENTS` block
   - **Process** — Numbered steps (3-5 max)
   - **Output** — Expected result format
   - **Principles** — Key constraints (3-5 bullets)

4. Keep it under **50 lines** (excluding frontmatter)

5. Add an example in `examples/<category>/<name>/`:
   - `input.md` — Sample input
   - `output.md` — Expected output

6. Validate:
   ```bash
   ./validate.sh commands/<category>/<name>.md
   ```

## Quality Checklist

Before submitting a PR, verify:

- [ ] Frontmatter has all required fields
- [ ] `scope` accurately reflects what the command does
- [ ] Command does ONE thing well
- [ ] No overlap with existing commands
- [ ] Process steps are numbered and actionable
- [ ] Principles section exists with 3-5 constraints
- [ ] Under 50 lines (excluding frontmatter)
- [ ] Example input/output provided
- [ ] `validate.sh` passes
- [ ] Works on a real codebase (not just in theory)

## Command Categories

Place your command in the right category:

| Category | When to use |
|----------|------------|
| `understand/` | Analyzing, exploring, reading code |
| `build/` | Writing, fixing, improving code |
| `ship/` | Committing, reviewing, deploying |
| `design/` | Planning, architecting, specifying |
| `audit/` | Assessing quality, security, coverage |

If your command doesn't fit, propose a new category in the PR description.

## Updating an Existing Command

- Keep changes focused
- Explain **why** in the PR description
- Don't change `scope` without reviewing downstream workflows

## Style Guide

- Use **imperative mood** in process steps ("Fix the issue" not "The issue is fixed")
- Be opinionated — recommend a specific approach, don't list options
- No filler words — every line should earn its place
- Use `file:line` format for location references
- Principles should be constraints, not aspirations
