# LAB10: GitHub Actions Basics

This lab introduces GitHub Actions as a powerful tool for continuous integration and workflow automation.

## Learning Objectives

- Understand GitHub Actions fundamentals
- Create and configure workflow files
- Configure jobs, steps, and runners
- Use environment variables in workflows
- Leverage GitHub Actions marketplace
- Implement conditional execution
- Work with matrix builds
- Set up scheduled workflows

## Prerequisites

- GitHub account
- Basic Git knowledge (committing, pushing, branching)
- Basic command line familiarity
- Completion of previous labs (especially LAB06-LAB09)

## Lab Overview

In this lab, you'll create GitHub Actions workflows to automate tasks in your repository. You'll learn how to set up workflows that run when code is pushed, on a schedule, or manually triggered. The lab uses simple shell commands and text file manipulation to demonstrate GitHub Actions concepts without requiring programming knowledge.

## Lab Tasks

### Part 1: Setting Up Workflows

1. Create the workflows directory structure
2. Create a basic workflow file
3. Configure workflow triggers
4. Set up the runner environment

### Part 2: Working With Steps and Commands

1. Use checkout action to access code
2. Run shell commands
3. Create and read text files
4. Use environment variables
5. Process and transform text content

### Part 3: Advanced Workflow Features

1. Explore the GitHub Actions marketplace
2. Create conditional workflows
3. Set up matrix builds for multi-environment testing
4. Create scheduled workflows
5. Configure workflow outputs and artifacts

## TODO Items

Throughout this lab, you'll see TODO markers indicating tasks you need to complete. Make sure to address all of these tasks to fully complete the lab.

## Cleanup

After completing the lab:
1. You can leave your workflows in place - they won't run unless triggered
2. If you want to clean up, you can delete the `.github/workflows` directory
3. Make sure to commit and push any cleanup changes

## Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [GitHub Actions Marketplace](https://github.com/marketplace?type=actions)
- [GitHub Actions Syntax Reference](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions)
- [Workflow Command Reference](https://docs.github.com/en/actions/reference/workflow-commands-for-github-actions)