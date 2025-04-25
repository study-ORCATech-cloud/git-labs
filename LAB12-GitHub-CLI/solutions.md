# LAB12 - Solutions: GitHub CLI

Here are the solutions to the exercises:

## Task 1: Install and Set Up GitHub CLI
```bash
# Install GitHub CLI based on your operating system

# For Windows (using winget)
winget install --id GitHub.cli

# For MacOS (using Homebrew)
brew install gh

# For Linux (using apt for Ubuntu/Debian)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

# Check the installed version
gh --version

# Authenticate with GitHub
gh auth login
# Follow the interactive prompts:
# - Select GitHub.com (not enterprise)
# - Select HTTPS protocol
# - Whether to authenticate with your GitHub credentials
# - Choose browser authentication method
# - Copy your one-time code and continue in the browser

# Verify authentication status
gh auth status
```

## Task 2: Explore Basic GitHub CLI Commands
```bash
# Get help and overview of available commands
gh help

# View your GitHub profile information
gh api user | jq .
# Or for a formatted version without jq:
gh api user --jq '.login + " (" + .name + ") - " + .bio'

# List your repositories
gh repo list
# For more detailed view:
gh repo list --limit 10 --json name,description,visibility,updatedAt

# Check notifications
gh api notifications
# For a formatted list of unread notifications:
gh api notifications --jq '.[] | {repo: .repository.full_name, title: .subject.title, type: .subject.type}'
```

## Task 3: Create and Clone a Repository
```bash
# Create a new repository
gh repo create github-cli-lab --public --description "A repository for practicing GitHub CLI commands"

# Options:
# --public: Make the repository public
# --private: Make the repository private
# --clone: Clone the repository after creation
# --add-readme: Add a README file

# For interactive creation:
gh repo create

# Clone the repository (if you didn't use --clone option above)
gh repo clone your-username/github-cli-lab
cd github-cli-lab

# Create a simple README with more content
cat > README.md << 'EOF'
# GitHub CLI Lab

This repository is used for practicing GitHub CLI commands as part of a DevOps training lab.

## Commands Used

- `gh repo create`
- `gh issue create`
- `gh pr create`
- And more!

## Benefits of GitHub CLI

- Automation of GitHub workflows
- Easier management of issues and PRs
- Integration with scripts and CI/CD
EOF

# Commit and push the README
git add README.md
git commit -m "Add detailed README"
git push
```

## Task 4: Work with Issues
```bash
# Create a new issue
gh issue create --title "Add documentation on installation" --body "We need to add a document explaining how to install and configure the project."

# For interactive issue creation:
gh issue create

# List all issues in your repository
gh issue list

# View the details of a specific issue (replace 1 with your issue number)
gh issue view 1

# Close an issue
gh issue close 1
# With comment:
gh issue close 1 --comment "Closing this as it's no longer relevant."

# Reopen a closed issue
gh issue reopen 1
```

## Task 5: Manage Pull Requests
```bash
# Create a new branch
git checkout -b feature/add-docs

# Create a documentation file
mkdir docs
cat > docs/INSTALL.md << 'EOF'
# Installation Guide

## Prerequisites
- Git
- GitHub account

## Steps
1. Clone the repository
   ```
   gh repo clone your-username/github-cli-lab
   ```

2. Navigate to the repository
   ```
   cd github-cli-lab
   ```

3. Create your feature branch
   ```
   git checkout -b feature/your-feature
   ```
EOF

# Commit the changes
git add docs/
git commit -m "Add installation documentation"

# Push the branch to GitHub
git push -u origin feature/add-docs

# Create a pull request
gh pr create --title "Add installation documentation" --body "This PR adds installation instructions to the docs folder."

# For interactive PR creation:
gh pr create

# List open pull requests
gh pr list

# Check the details of your pull request
gh pr view

# Merge your pull request
gh pr merge
# With options:
gh pr merge --squash --delete-branch
```

## Task 6: Use GitHub CLI for Repository Management
```bash
# View repository details
gh repo view

# Open repository in browser
gh repo view --web

# Add topics to the repository
gh api repos/your-username/github-cli-lab/topics -X PUT -f names='["github-cli","devops","training"]'

# List repository collaborators
gh api repos/your-username/github-cli-lab/collaborators

# Create a release
git tag v1.0.0
git push origin v1.0.0

gh release create v1.0.0 --title "Initial Release" --notes "This is the first release of the GitHub CLI Lab project."

# For interactive release creation:
gh release create v1.0.0
```

## Task 7: Working with GitHub Actions
```bash
# Create a .github/workflows directory
mkdir -p .github/workflows

# Create a simple workflow file
cat > .github/workflows/main.yml << 'EOF'
name: CI

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Run a one-line script
      run: echo Hello, GitHub Actions!
EOF

# Commit and push the workflow
git add .github/workflows/
git commit -m "Add GitHub Actions workflow"
git push

# List workflows in the repository
gh workflow list

# View workflow runs
gh run list

# Check the status of a specific run (replace RUN_ID with actual ID)
gh run view RUN_ID

# Watch workflow run in progress
gh run watch
```

## Task 8: GitHub CLI Aliases and Extensions
```bash
# Create a custom alias for a frequently used command
gh alias set repo-create 'repo create --public --clone'

# Use the alias
gh repo-create test-alias-repo

# Remove an alias
gh alias delete repo-create

# List installed extensions
gh extension list

# Browse available extensions
gh extension browse

# Install an extension (example: gh-contribution)
gh extension install mislav/gh-contribution

# Use the installed extension
gh contribution

# Update extensions
gh extension upgrade --all
```

## Bonus Task
```bash
# Create a script to automate issue creation from a CSV file
cat > create_issues.sh << 'EOF'
#!/bin/bash

# Script to create GitHub issues from a CSV file
# CSV format: Title,Body,Labels (comma-separated)

CSV_FILE="issues.csv"

if [ ! -f "$CSV_FILE" ]; then
    echo "Error: $CSV_FILE not found"
    exit 1
fi

# Skip header line and process each issue
tail -n +2 "$CSV_FILE" | while IFS=, read -r title body labels; do
    echo "Creating issue: $title"
    gh issue create --title "$title" --body "$body" --label "${labels//;/,}"
    echo "Issue created successfully!"
    sleep 1
done
EOF

# Create a sample CSV file
cat > issues.csv << 'EOF'
Title,Body,Labels
Add user authentication,Implement user login and registration,feature;high-priority
Fix navigation bar,The navigation bar has display issues on mobile devices,bug;ui
Update dependencies,Update all npm packages to latest versions,maintenance
EOF

# Make the script executable
chmod +x create_issues.sh

# Run the script
./create_issues.sh

# Using JQ with GitHub CLI for advanced queries
# Get all PRs with their reviews status
gh api repos/your-username/github-cli-lab/pulls --jq '.[] | {number: .number, title: .title, state: .state, reviews: .reviews}'

# Create a dashboard of repository activity
gh api repos/your-username/github-cli-lab/stats/contributors --jq '.[] | {author: .author.login, total_commits: .total, weeks: (.weeks | length)}'
``` 