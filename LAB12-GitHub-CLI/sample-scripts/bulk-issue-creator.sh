#!/bin/bash

# Bulk Issue Creator - Sample Script for GitHub CLI Lab
# This script creates multiple GitHub issues from a CSV file
# 
# Usage: ./bulk-issue-creator.sh issues.csv [repository]
# If repository is not specified, it uses the current directory's repository

set -e

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Please install it following the instructions at: https://cli.github.com/manual/installation"
    exit 1
fi

# Check authentication status
echo "Checking GitHub CLI authentication status..."
if ! gh auth status &> /dev/null; then
    echo "You need to authenticate with GitHub CLI first. Run: gh auth login"
    exit 1
fi
echo "Authentication verified ✅"

# Check for input file
if [ -z "$1" ]; then
    echo "Error: No input file specified."
    echo "Usage: $0 issues.csv [repository]"
    exit 1
fi

CSV_FILE="$1"
if [ ! -f "$CSV_FILE" ]; then
    echo "Error: File '$CSV_FILE' not found."
    exit 1
fi

# Determine repository
REPO=""
if [ ! -z "$2" ]; then
    REPO="--repo $2"
    echo "Using specified repository: $2"
else
    echo "Using current repository"
fi

# Create issues from CSV
echo "Creating issues from $CSV_FILE..."
echo "----------------------------------------"

# Skip header line and process each row
tail -n +2 "$CSV_FILE" | while IFS=, read -r title body labels assignee milestone; do
    echo "Creating issue: \"$title\""
    
    # Build command with available parameters
    CMD="gh issue create --title \"$title\" $REPO"
    
    if [ ! -z "$body" ]; then
        CMD+=" --body \"$body\""
    fi
    
    if [ ! -z "$labels" ]; then
        # Convert semicolons to commas for multiple labels
        FORMATTED_LABELS=${labels//;/,}
        CMD+=" --label \"$FORMATTED_LABELS\""
    fi
    
    if [ ! -z "$assignee" ]; then
        CMD+=" --assignee \"$assignee\""
    fi
    
    if [ ! -z "$milestone" ]; then
        CMD+=" --milestone \"$milestone\""
    fi
    
    # Execute the command
    eval $CMD
    echo "Issue created successfully! ✅"
    echo "----------------------------------------"
    
    # Add a small delay to avoid rate limiting
    sleep 1
done

echo "All issues have been created!"
echo "Run 'gh issue list $REPO' to see your new issues" 