# LAB13: GitHub Actions Workflow Templates

This lab introduces reusable **GitHub Actions workflow templates** — a powerful way to share common CI/CD patterns across multiple repositories and standardize your automation practices.

## Learning Objectives

- Understand how reusable workflows work in GitHub Actions
- Create workflow templates with the `workflow_call` trigger
- Reference and use workflow templates in other repositories
- Pass inputs and secrets between calling workflows and reusable workflows
- Implement best practices for maintainable CI/CD patterns

## Prerequisites

- GitHub account
- Basic understanding of GitHub Actions (from LAB10)
- At least two GitHub repositories (one for template, one to reuse it)

## Lab Overview

GitHub Actions reusable workflows allow you to define a workflow once and reference it from other repositories or workflows. This powerful feature helps teams standardize CI/CD practices, reduce duplication, and simplify maintenance across multiple projects.

## Lab Tasks

### Part 1: Creating a Reusable Workflow Template

1. Set up a dedicated repository for workflow templates
2. Create a reusable workflow with the `workflow_call` trigger
3. Define inputs and outputs for the template
4. Add basic validation and testing steps

### Part 2: Using the Workflow Template

1. Create a project repository that will use the template
2. Reference the template workflow from another workflow
3. Pass parameters to the reusable workflow
4. Trigger and verify the workflow execution

### Part 3: Advanced Template Features

1. Pass secrets between workflows
2. Add conditional logic to the template
3. Create matrix-based reusable workflows
4. Compose multiple reusable workflows

## Lab Structure

```
LAB13-Workflow-Templates/
├── template-repo/              # Repository containing the workflow template
│   └── .github/workflows/
│       └── ci-template.yml     # Reusable workflow definition
├── project-repo/               # Repository using the template
│   └── .github/workflows/
│       └── main.yml            # Workflow that calls the template
├── LAB.md                 # Step-by-step exercises
├── solutions.md                # Detailed solutions
└── README.md                   # Lab overview
```

## Cleanup

After completing the lab:
1. You can delete the practice repositories if no longer needed
2. Workflow runs will remain in the Actions tab history

## Resources

- [GitHub Reusable Workflows Documentation](https://docs.github.com/en/actions/using-workflows/reusing-workflows)
- [GitHub Actions Context Reference](https://docs.github.com/en/actions/learn-github-actions/contexts)
- [GitHub Actions Workflow Syntax](https://docs.github.com/en/actions/using-workflows/workflow-syntax-for-github-actions)