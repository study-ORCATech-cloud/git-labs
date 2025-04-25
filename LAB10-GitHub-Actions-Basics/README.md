# LAB10: GitHub Actions Basics

This lab introduces GitHub Actions, GitHub's integrated CI/CD platform that enables automation directly within your GitHub repository.

## Learning Objectives

- Understand GitHub Actions core concepts (workflows, jobs, steps)
- Create and configure workflow files in YAML format
- Trigger workflows based on GitHub events
- Use actions from the GitHub Marketplace
- Work with environment variables and contexts
- Implement conditional execution and matrix builds
- Monitor and troubleshoot workflow runs

## Prerequisites

- GitHub account
- Basic knowledge of YAML syntax
- Understanding of Git operations (push, pull, branch)
- Basic Python knowledge

## Lab Overview

GitHub Actions allows you to automate your software development workflows directly in your GitHub repository. In this lab, you'll create a basic workflow that runs automatically when code is pushed, set up Python, and execute a simple script. You'll learn how to view workflow results and troubleshoot issues.

## Lab Tasks

### Part 1: Creating a Basic Workflow

1. Create a GitHub Actions workflow file structure
2. Define a basic workflow that runs on push events
3. Add steps to check out code and run commands
4. Trigger the workflow by pushing changes

### Part 2: Working with Python in GitHub Actions

1. Create a simple Python script
2. Configure the workflow to run your Python code
3. Pass environment variables to your script
4. Install and use Python packages

### Part 3: Advanced Workflow Features

1. Create conditional steps based on branch names
2. Set up a matrix build to test on multiple Python versions
3. Create a scheduled workflow that runs automatically
4. Review and analyze workflow run results

## Lab Structure

```
LAB10-GitHub-Actions-Basics/
├── .github/workflows/
│   ├── main.yml              # Main workflow file
│   └── scheduled.yml         # Scheduled workflow file (bonus)
├── main.py                   # Sample Python script
├── exercise.md               # Step-by-step exercises
├── solutions.md              # Detailed solutions
└── README.md                 # Lab overview
```

## Cleanup

After completing the lab:
1. You can keep your workflows active if desired
2. To disable workflows: Go to Actions tab → select workflow → click "Disable workflow"
3. Or delete the workflow files from your repository

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Marketplace for Actions](https://github.com/marketplace?type=actions)
- [Workflow Syntax Reference](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Context and Expression Syntax](https://docs.github.com/en/actions/reference/context-and-expression-syntax-for-github-actions)