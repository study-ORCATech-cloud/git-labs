# LAB14: GitHub Tokens & Secrets

This lab teaches you how to securely manage credentials and sensitive data in GitHub workflows using encrypted secrets and GitHub-provided tokens.

## Learning Objectives

- Understand the purpose and use of GitHub's `GITHUB_TOKEN`
- Create and store encrypted secrets in repository settings
- Access and use secrets securely within GitHub Actions workflows
- Implement best practices for credential management in CI/CD pipelines
- Understand different scopes and permissions for GitHub tokens

## Prerequisites

- GitHub account
- Repository with GitHub Actions enabled
- Basic understanding of GitHub Actions workflows (from previous labs)

## Lab Overview

Secure authentication is essential for CI/CD pipelines that interact with external services or protected resources. GitHub provides a robust secrets management system that keeps sensitive information encrypted while making it accessible to authorized workflows. In this lab, you'll learn how to create, store, and use secrets securely in your automation workflows.

## Lab Tasks

### Part 1: Understanding GitHub Tokens

1. Explore the automatic GITHUB_TOKEN
2. Review token permissions and scopes
3. Use the token for authenticated GitHub operations
4. Understand token security limitations

### Part 2: Repository Secrets

1. Create repository-level secrets
2. Access secrets in workflow files
3. Pass secrets to actions safely
4. Implement best practices for secret handling

### Part 3: Advanced Secret Management

1. Work with organization-level secrets
2. Create environment-specific secrets
3. Implement secret rotation practices
4. Secure secrets in fork and pull request workflows

## Lab Structure

```
LAB14-Tokens-And-Secrets/
├── .github/workflows/
│   ├── use-secrets.yml                # Workflow demonstrating secret usage
│   └── github-token.yml               # Workflow demonstrating GITHUB_TOKEN
├── exercise.md                        # Step-by-step exercises
├── solutions.md                       # Detailed solutions
└── README.md                          # Lab overview
```

## Cleanup

After completing the lab:
1. Delete any test secrets from your repository settings
2. Remove any workflow files that might expose secret handling patterns
3. Cancel any running workflow jobs that might be using secrets

## Resources

- [GitHub Secrets Documentation](https://docs.github.com/en/actions/security-guides/encrypted-secrets)
- [Automatic Token Authentication](https://docs.github.com/en/actions/security-guides/automatic-token-authentication)
- [GitHub Token Permissions](https://docs.github.com/en/actions/security-guides/automatic-token-authentication#permissions-for-the-github_token)

