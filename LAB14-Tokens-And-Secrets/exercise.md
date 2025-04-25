# LAB14 - Exercise: GitHub Tokens & Secrets

Follow these steps to complete the lab:

## Task 1: Explore the GitHub Automatic Token
TODO: Create a new GitHub repository for this exercise.
TODO: Create a simple GitHub Actions workflow file named `.github/workflows/github-token.yml`.
TODO: Configure the workflow to trigger on push events.
TODO: Add a job that uses the default `GITHUB_TOKEN` to list repository details.
TODO: Use the GitHub REST API with the token to retrieve repository information.
TODO: Print the repository name and other basic information from the API response.
TODO: Push your changes and observe the workflow execution.

## Task 2: Understand Token Permissions
TODO: Examine the default permissions of the `GITHUB_TOKEN`.
TODO: Modify your workflow to add explicit permissions declaration for the token.
TODO: Set read permissions for the repository contents.
TODO: Set write permissions for issues.
TODO: Add a step that creates an issue using the token.
TODO: Test the workflow to verify the permissions work correctly.

## Task 3: Create and Use Repository Secrets
TODO: Go to your repository settings to create a new secret.
TODO: Name the secret `API_KEY` with a sample value (use a dummy value, not a real key).
TODO: Create a workflow file named `.github/workflows/use-secrets.yml`.
TODO: Add a job that accesses the secret in a secure way.
TODO: Demonstrate passing the secret as an environment variable to a step.
TODO: Show how to pass the secret to an action that requires authentication.
TODO: Test the workflow but ensure no secret values are printed directly in logs.

## Task 4: Work with Organization Secrets
TODO: If you have an organization account, create an organization-level secret.
TODO: If not, explain how you would create and use organization secrets.
TODO: Create a workflow that would access an organization-level secret.
TODO: Explain the precedence between repository and organization secrets.

## Task 5: Create Environment-Specific Secrets
TODO: Create an environment in your repository settings (e.g., "production").
TODO: Add an environment-specific secret to this environment.
TODO: Create a workflow that uses the environment and its secrets.
TODO: Configure environment protection rules if available.
TODO: Test the workflow and verify environment secrets are working.

## Task 6: Implement Secret Rotation Example
TODO: Create a workflow that simulates secret rotation.
TODO: Add a step that generates a new API key or token.
TODO: Set up a mechanism to update the repository secret with the new value.
TODO: Explain the security benefits of secret rotation.

## Task 7: Secure Secrets in Fork and Pull Request Workflows
TODO: Configure a workflow to handle pull requests safely.
TODO: Implement a strategy to prevent secret exposure in forked repositories.
TODO: Test the workflow with a simulated pull request.

## Bonus Task
TODO: Create a composite action that securely manages token authentication.
TODO: Implement a workflow that uses secret masking to prevent accidental exposure.
TODO: Add a step that validates secrets have proper format before use. 