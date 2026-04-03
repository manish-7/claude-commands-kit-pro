---
description: Generate boilerplate for a new module or feature
argument-hint: module name and type (e.g., "user-preferences API endpoint")
scope: modifies-files
allowed-tools: Read, Grep, Glob, Bash
outputs: boilerplate files matching project conventions
accepts: module name, feature type, description
---

# Scaffold

Generate boilerplate for:

```
$ARGUMENTS
```

## Process

1. **Study conventions** — Find an existing module or feature similar to what's being scaffolded. Read its structure: files, naming, patterns, registrations, and configuration.
2. **Identify components** — Based on the project's patterns, determine what needs to be created:
   - Source files (controllers, services, repositories, models, etc.)
   - Test files
   - Configuration or registration entries
   - Migration files if applicable
3. **Generate** — Create each file following the exact patterns found in step 1:
   - Same directory structure
   - Same naming conventions
   - Same imports and base classes
   - Same boilerplate (DI registration, routing, etc.)
4. **Register** — Add the new module to any central registries, DI containers, routing tables, or configuration files
5. **Verify** — Run the build to ensure the scaffold compiles and integrates correctly

## Output

List of created files and any registrations added. Note any TODOs left for the developer to fill in.

## Principles

- Mirror existing patterns exactly — don't improve or innovate during scaffolding
- Include TODO comments for business logic that needs to be filled in
- The scaffold must build and pass any existing tests without modification
- Less is more — generate the minimum viable structure
