#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.claude/commands"
CATEGORIES=("understand" "build" "ship" "design" "audit")

usage() {
    echo "Usage: install.sh [OPTIONS]"
    echo ""
    echo "Install claude-commands-kit-pro into ~/.claude/commands/"
    echo ""
    echo "Options:"
    echo "  --only <categories>   Install specific categories (comma-separated)"
    echo "                        Example: --only build,ship"
    echo "  --target <dir>        Install to a custom directory"
    echo "  --copy                Copy files instead of symlinking"
    echo "  --uninstall           Remove installed commands"
    echo "  -h, --help            Show this help message"
}

install_category() {
    local category="$1"
    local method="$2"
    local source_dir="${SCRIPT_DIR}/commands/${category}"
    local target_category_dir="${TARGET_DIR}/${category}"

    if [ ! -d "$source_dir" ]; then
        echo "  Warning: Category '${category}' not found, skipping"
        return
    fi

    mkdir -p "$target_category_dir"

    for cmd_file in "$source_dir"/*.md; do
        [ -f "$cmd_file" ] || continue
        local filename
        filename=$(basename "$cmd_file")

        if [ "$method" = "symlink" ]; then
            ln -sf "$cmd_file" "${target_category_dir}/${filename}"
        else
            cp -f "$cmd_file" "${target_category_dir}/${filename}"
        fi
    done

    local count
    count=$(find "$source_dir" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
    echo "  ${category}/  (${count} commands)"
}

uninstall() {
    echo "Uninstalling claude-commands-kit-pro..."
    for category in "${CATEGORIES[@]}"; do
        local target_category_dir="${TARGET_DIR}/${category}"
        if [ -d "$target_category_dir" ]; then
            rm -rf "$target_category_dir"
            echo "  Removed ${category}/"
        fi
    done
    echo "Done."
}

main() {
    local method="symlink"
    local selected_categories=()

    while [[ $# -gt 0 ]]; do
        case $1 in
            --only)
                IFS=',' read -ra selected_categories <<< "$2"
                shift 2
                ;;
            --target)
                TARGET_DIR="$2"
                shift 2
                ;;
            --copy)
                method="copy"
                shift
                ;;
            --uninstall)
                uninstall
                exit 0
                ;;
            -h|--help)
                usage
                exit 0
                ;;
            *)
                echo "Unknown option: $1"
                usage
                exit 1
                ;;
        esac
    done

    if [ ${#selected_categories[@]} -eq 0 ]; then
        selected_categories=("${CATEGORIES[@]}")
    fi

    mkdir -p "$TARGET_DIR"

    echo "Installing claude-commands-kit-pro..."
    echo "  Source: ${SCRIPT_DIR}/commands/"
    echo "  Target: ${TARGET_DIR}/"
    echo "  Method: ${method}"
    echo ""

    for category in "${selected_categories[@]}"; do
        install_category "$category" "$method"
    done

    echo ""
    echo "Done! Commands are available as /commands:<category>:<name>"
    echo ""
    echo "To uninstall: ./install.sh --uninstall"
}

main "$@"
