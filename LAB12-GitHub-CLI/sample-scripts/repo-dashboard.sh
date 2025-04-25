#!/bin/bash

# GitHub Repository Dashboard Generator
# This script creates a dashboard view of repository stats using GitHub CLI
#
# Usage: ./repo-dashboard.sh [username/repository]
# If no repository is specified, it uses the current directory's repository

set -e

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed."
    echo "Please install it following the instructions at: https://cli.github.com/manual/installation"
    exit 1
fi

# Check if jq is installed (used for JSON processing)
if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed."
    echo "Please install it before running this script."
    echo "Instructions: https://stedolan.github.io/jq/download/"
    exit 1
fi

# Determine repository to use
if [ -z "$1" ]; then
    # Try to get repository from current directory
    if git rev-parse --git-dir > /dev/null 2>&1; then
        REPO_URL=$(git config --get remote.origin.url)
        REPO=$(echo $REPO_URL | sed -n 's/.*github.com[:/]\(.*\)\.git/\1/p')
        if [ -z "$REPO" ]; then
            REPO=$(echo $REPO_URL | sed -n 's/.*github.com[:/]\(.*\)/\1/p')
        fi
    else
        echo "Error: Not in a git repository and no repository specified."
        echo "Usage: $0 [username/repository]"
        exit 1
    fi
else
    REPO="$1"
fi

echo "Generating dashboard for repository: $REPO"
echo "==============================================="

# Get repository information
echo "📊 Repository Overview"
gh api repos/$REPO --jq '{name: .name, description: .description, stars: .stargazers_count, forks: .forks_count, open_issues: .open_issues_count, watchers: .subscribers_count, created_at: .created_at, updated_at: .updated_at}' | jq .

# Get contributor statistics
echo -e "\n👥 Top Contributors"
gh api repos/$REPO/contributors --jq 'sort_by(-.contributions) | .[0:5] | .[] | {name: .login, contributions: .contributions, profile: .html_url}' | jq .

# Get recent commits
echo -e "\n📝 Recent Commits"
gh api repos/$REPO/commits --jq '.[0:5] | .[] | {sha: .sha[0:7], author: .commit.author.name, message: (.commit.message | split("\n")[0]), date: .commit.author.date}' | jq .

# Get open pull requests
echo -e "\n🔄 Open Pull Requests"
gh api repos/$REPO/pulls --jq '.[] | {number: .number, title: .title, author: .user.login, created_at: .created_at, comments: .comments}' | jq .

# Get open issues
echo -e "\n🐛 Open Issues"
gh api repos/$REPO/issues --jq '.[] | select(.pull_request == null) | {number: .number, title: .title, author: .user.login, created_at: .created_at, comments: .comments, labels: [.labels[].name]}' | jq .

# Get latest release
echo -e "\n📦 Latest Release"
gh api repos/$REPO/releases/latest --jq '{tag_name: .tag_name, name: .name, published_at: .published_at, author: .author.login, assets: [.assets[].name]}' | jq .

echo -e "\n✅ Dashboard generation complete!"
echo "===============================================" 