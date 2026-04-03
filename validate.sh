#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ERRORS=0
WARNINGS=0
CHECKED=0

REQUIRED_FRONTMATTER=("description" "argument-hint" "scope" "allowed-tools" "outputs" "accepts")
VALID_SCOPES=("read-only" "modifies-files" "creates-commits" "pushes")
MAX_LINES=50

red()    { echo -e "\033[0;31m$1\033[0m"; }
yellow() { echo -e "\033[0;33m$1\033[0m"; }
green()  { echo -e "\033[0;32m$1\033[0m"; }

error()   { red "  ERROR: $1"; ((ERRORS++)); }
warn()    { yellow "  WARN:  $1"; ((WARNINGS++)); }

validate_file() {
    local file="$1"
    local relative_path="${file#$SCRIPT_DIR/}"
    echo "Checking ${relative_path}..."
    ((CHECKED++))

    # Check frontmatter exists
    local first_line
    first_line=$(head -1 "$file")
    if [ "$first_line" != "---" ]; then
        error "Missing frontmatter (file must start with ---)"
        return
    fi

    # Extract frontmatter (between first and second ---)
    local frontmatter
    frontmatter=$(awk 'BEGIN{found=0} /^---$/{found++; next} found==1{print} found>=2{exit}' "$file")

    if [ -z "$frontmatter" ]; then
        error "Empty or unclosed frontmatter"
        return
    fi

    # Check required fields
    for field in "${REQUIRED_FRONTMATTER[@]}"; do
        if ! echo "$frontmatter" | grep -q "^${field}:"; then
            error "Missing required field: ${field}"
        fi
    done

    # Check scope is valid
    local scope
    scope=$(echo "$frontmatter" | grep "^scope:" | sed 's/^scope: *//' | sed 's/[[:space:]]*$//')
    if [ -n "$scope" ]; then
        local valid=false
        for valid_scope in "${VALID_SCOPES[@]}"; do
            if [ "$scope" = "$valid_scope" ]; then
                valid=true
                break
            fi
        done
        if [ "$valid" = false ]; then
            error "Invalid scope '${scope}'. Must be one of: ${VALID_SCOPES[*]}"
        fi
    fi

    # Count content lines (excluding frontmatter)
    local content_start
    content_start=$(grep -n "^---$" "$file" | sed -n '2p' | cut -d: -f1)
    if [ -n "$content_start" ]; then
        local total_lines
        total_lines=$(wc -l < "$file" | tr -d ' ')
        local content_lines=$((total_lines - content_start))

        if [ "$content_lines" -gt "$MAX_LINES" ]; then
            warn "Command is ${content_lines} lines (recommended max: ${MAX_LINES})"
        fi
    fi

    # Check for required sections
    if ! grep -q "^# " "$file"; then
        error "Missing title (# heading)"
    fi

    if ! grep -qE "^## .*(Process|Steps|Instructions|For )" "$file"; then
        warn "Missing Process/Steps/Instructions section"
    fi

    if ! grep -qE "^## .*(Principles|Constraints|Rules)" "$file"; then
        warn "Missing Principles/Constraints/Rules section"
    fi

    # Check for $ARGUMENTS placeholder
    if ! grep -q '\$ARGUMENTS' "$file"; then
        warn "Missing \$ARGUMENTS placeholder"
    fi
}

main() {
    local targets=("$@")

    if [ ${#targets[@]} -eq 0 ]; then
        targets=("${SCRIPT_DIR}/commands/")
    fi

    echo "Validating commands..."
    echo ""

    for target in "${targets[@]}"; do
        if [ -f "$target" ]; then
            validate_file "$target"
        elif [ -d "$target" ]; then
            while IFS= read -r -d '' file; do
                validate_file "$file"
            done < <(find "$target" -name "*.md" -type f -print0 | sort -z)
        else
            red "Not found: ${target}"
            ((ERRORS++))
        fi
    done

    echo ""
    echo "Results: ${CHECKED} files checked, $(red "${ERRORS} errors"), $(yellow "${WARNINGS} warnings")"

    if [ "$ERRORS" -gt 0 ]; then
        exit 1
    fi
}

main "$@"
