# LAB15: GitHub API with Python

This final lab teaches you how to interact with GitHub's REST API using Python, allowing you to automate repository management, issue tracking, and other GitHub tasks programmatically.

## Learning Objectives

- Authenticate with GitHub's API using personal access tokens
- Interact with GitHub programmatically using Python's requests library
- Create scripts to automate common GitHub tasks
- Implement best practices for API rate limiting and error handling
- Understand the structure and capabilities of GitHub's REST API

## Prerequisites

- GitHub account
- Personal access token with appropriate scopes (repo, read:org, etc.)
- Python 3.8+ installed
- Basic Python programming knowledge

## Lab Overview

GitHub provides a powerful REST API that lets you access nearly all GitHub functionality programmatically. By combining this API with Python's flexibility, you can create custom tools and automations for your specific workflows. This lab will teach you how to authenticate securely, make API requests, and handle responses to build useful GitHub automation scripts.

## Lab Tasks

### Part 1: Setting Up Authentication

1. Create a personal access token with appropriate scopes
2. Set up secure token handling in Python scripts
3. Verify authentication by retrieving your user profile
4. Understand API rate limits and authentication headers

### Part 2: Basic GitHub API Operations

1. List your repositories and extract metadata
2. Search for repositories using query parameters
3. Retrieve issue information from repositories
4. Create new issues via the API

### Part 3: Advanced API Usage

1. Create and manage repository webhooks
2. Work with pull requests programmatically
3. Access organization data and team information
4. Implement pagination for large result sets

## Lab Structure

```
LAB15-GitHub-API-With-Python/
├── scripts/
│   ├── github_repos.py              # Script to list repositories
│   ├── github_issues.py             # Script to manage issues
│   └── github_advanced.py           # Script for advanced features
├── exercise.md                      # Step-by-step exercises
├── requirements.txt                 # Python dependencies
├── solutions.md                     # Detailed solutions
└── README.md                        # Lab overview
```

## Cleanup

After completing the lab:
1. Revoke any temporary personal access tokens
2. Clean up any test issues or repositories created during practice
3. Consider setting up token expiration if using long-term tokens

## Resources

- [GitHub REST API Documentation](https://docs.github.com/en/rest)
- [Python Requests Library Documentation](https://docs.python-requests.org/en/latest/)
- [GitHub API Rate Limiting](https://docs.github.com/en/rest/overview/resources-in-the-rest-api#rate-limiting)

