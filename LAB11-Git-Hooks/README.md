# LAB11: Git Hooks (Local Automation)

This lab introduces Git hooks, a powerful way to automate tasks during the Git workflow. Git hooks are scripts that Git executes before or after events such as commit, push, and merge.

## Learning Objectives

- Understand Git hooks and their role in the Git workflow
- Create and implement different types of Git hooks
- Use hooks to enforce code quality standards
- Automate repetitive tasks in your development workflow
- Apply hooks to enforce team development policies

## Prerequisites

- Git installed on your system
- Basic command-line knowledge
- Basic shell scripting familiarity
- Python installed for code checking examples

## Lab Overview

Git hooks provide a way to execute custom scripts when specific Git events occur. In this lab, you'll create several types of hooks to automate common development tasks and enforce best practices. You'll work with pre-commit hooks for code validation, commit-message hooks for standardization, and post-commit hooks for notifications.

## Lab Tasks

### Part 1: Understanding Git Hooks

1. Explore the default Git hooks directory
2. Examine the sample hooks that Git provides
3. Understand the different hook types and when they execute

### Part 2: Creating Basic Hooks

1. Create a simple pre-commit hook
2. Implement a commit message validation hook
3. Set up a post-commit notification hook
4. Create a pre-push validation hook

### Part 3: Advanced Hook Implementation

1. Implement code quality checks using linting tools
2. Create branch protection to prevent direct commits to main
3. Automate testing as part of the Git workflow
4. Create a global hooks configuration

## Lab Structure

```
LAB11-Git-Hooks/
├── sample-hooks/              # Sample hook implementations
│   ├── pre-commit             # Example pre-commit hook
│   ├── commit-msg             # Example commit-msg hook
│   ├── post-commit            # Example post-commit hook
│   └── pre-push               # Example pre-push hook
├── sample.py                  # Clean Python file for testing
├── sample-with-errors.py      # Python file with intentional errors
├── install-hooks.sh           # Script to install hooks
├── LAB.md                # Step-by-step exercises
├── solutions.md               # Detailed solutions
└── README.md                  # Lab overview
```

## Cleanup

After completing the lab:
1. You can keep the hooks if you find them useful
2. To disable a hook, simply remove its executable permission: `chmod -x .git/hooks/hook-name`
3. To remove hooks entirely, delete them from the .git/hooks directory

## Resources

- [Git Hooks Documentation](https://git-scm.com/docs/githooks)
- [Pro Git Book: Customizing Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)
- [Flake8 Documentation](https://flake8.pycqa.org/) - Python linter used in examples