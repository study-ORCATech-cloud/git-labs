#!/bin/bash

# Script to install Git hooks for the lab
# This will copy sample hooks to the .git/hooks directory and make them executable

echo "==============================================="
echo "Installing Git hooks for the repository"
echo "==============================================="

# Get the directory where this script is located
SCRIPT_DIR=$(dirname "$0")
HOOKS_DIR="$SCRIPT_DIR/sample-hooks"
REPO_HOOKS_DIR=".git/hooks"

# Check if .git directory exists
if [ ! -d ".git" ]; then
    echo "❌ Error: Not a Git repository or .git directory not found."
    echo "   Please run this script from the root of a Git repository."
    exit 1
fi

# Check if sample hooks directory exists
if [ ! -d "$HOOKS_DIR" ]; then
    echo "❌ Error: Sample hooks directory not found."
    echo "   Expected location: $HOOKS_DIR"
    exit 1
fi

# Create hooks directory if it doesn't exist
mkdir -p "$REPO_HOOKS_DIR"

echo "Installing hooks from $HOOKS_DIR to $REPO_HOOKS_DIR"

# Copy each hook file and make it executable
for hook in "$HOOKS_DIR"/*; do
    if [ -f "$hook" ]; then
        hook_name=$(basename "$hook")
        echo "Installing $hook_name hook..."
        cp "$hook" "$REPO_HOOKS_DIR/$hook_name"
        chmod +x "$REPO_HOOKS_DIR/$hook_name"
        echo "✅ $hook_name installed successfully!"
    fi
done

echo "==============================================="
echo "Git hooks installation complete!"
echo "The following hooks are now active:"
ls -l "$REPO_HOOKS_DIR" | grep -v .sample
echo ""
echo "These hooks will help maintain text quality by:"
echo "- Checking for trailing whitespace"
echo "- Ensuring reasonable line lengths"
echo "- Validating commit messages"
echo "- Preventing commits to protected branches"
echo "- Providing useful commit summaries"
echo "==============================================="

exit 0 