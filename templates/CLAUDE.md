# CLAUDE.md — Project Guidelines

<!-- Copy this file to your project root and customize for your codebase. -->
<!-- Pair with claude-commands-kit-pro commands for best results. -->

## Build/Test Commands

- Build: `<your build command>`
- Test all: `<your test command>`
- Test single: `<your single test command>`
- Lint: `<your lint command>`
- Type check: `<your type check command>`

## Code Style

- **Language/Framework**: <!-- e.g., TypeScript 5.x, .NET 9, Go 1.22, Python 3.12 -->
- **Naming**: <!-- e.g., PascalCase for classes, camelCase for variables -->
- **Formatting**: <!-- e.g., Prettier, gofmt, Black, follow .editorconfig -->
- **Imports**: <!-- e.g., System namespaces first, then external, then project -->
- **Error handling**: <!-- e.g., custom exception classes, Result types, error codes -->
- **Testing**: <!-- e.g., NUnit + FluentAssertions, Jest, pytest -->

## Project Structure

<!-- Describe the high-level architecture so Claude understands where things go. -->
<!-- e.g., "Domain-driven design with modules under src/modules/, each with a -->
<!-- repository for data access and a service for business logic." -->

## Workflow Orchestration

### 1. Plan Mode Default
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately — don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

### 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One task per subagent for focused execution

### 3. Self-Improvement Loop
- After ANY correction from the user: update `tasks/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant project

### 4. Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- Skip this for simple, obvious fixes — don't over-engineer
- Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests — then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

## Task Management

1. **Plan First**: Write plan to `tasks/todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step
5. **Document Results**: Add review section to `tasks/todo.md`
6. **Capture Lessons**: Update `tasks/lessons.md` after corrections

## Core Principles

- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.
- **Consistency**: Match existing patterns in the codebase. Code should look like one person wrote it.
- **Prove It Works**: Tests pass, build succeeds, behavior is correct — before calling it done.
