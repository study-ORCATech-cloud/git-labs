# LAB14 - Exercise: GitHub Tokens & Secrets

Follow these steps to complete the lab:

## Task 1: Explore the GitHub Automatic Token
* Create a new GitHub repository for this exercise.
* Create a simple GitHub Actions workflow file named `.github/workflows/github-token.yml`.
* Configure the workflow to trigger on push events.
* Add a job that uses the default `GITHUB_TOKEN` to list repository details.
* Use the GitHub REST API with the token to retrieve repository information.
* Print the repository name and other basic information from the API response.
* Push your changes and observe the workflow execution.

## Task 2: Understand Token Permissions
* Examine the default permissions of the `GITHUB_TOKEN`.
* Modify your workflow to add explicit permissions declaration for the token.
* Set read permissions for the repository contents.
* Set write permissions for issues.
* Add a step that creates an issue using the token.
* Test the workflow to verify the permissions work correctly.

## Task 3: Create and Use Repository Secrets
* Go to your repository settings to create a new secret.
* Name the secret `API_KEY` with a sample value (use a dummy value, not a real key).
* Create a workflow file named `.github/workflows/use-secrets.yml`.
* Add a job that accesses the secret in a secure way.
* Demonstrate passing the secret as an environment variable to a step.
* Show how to pass the secret to an action that requires authentication.
* Test the workflow but ensure no secret values are printed directly in logs.

## Task 4: Work with Organization Secrets
* If you have an organization account, create an organization-level secret.
* If not, explain how you would create and use organization secrets.
* Create a workflow that would access an organization-level secret.
* Explain the precedence between repository and organization secrets.

## Task 5: Create Environment-Specific Secrets
* Create an environment in your repository settings (e.g., "production").
* Add an environment-specific secret to this environment.
* Create a workflow that uses the environment and its secrets.
* Configure environment protection rules if available.
* Test the workflow and verify environment secrets are working.

## Task 6: Implement Secret Rotation Example
* Create a workflow that simulates secret rotation.
* Add a step that generates a new API key or token.
* Set up a mechanism to update the repository secret with the new value.
* Explain the security benefits of secret rotation.

## Task 7: Secure Secrets in Fork and Pull Request Workflows
* Configure a workflow to handle pull requests safely.
* Implement a strategy to prevent secret exposure in forked repositories.
* Test the workflow with a simulated pull request.

## Bonus Task
* Create a composite action that securely manages token authentication.
* Implement a workflow that uses secret masking to prevent accidental exposure.
* Add a step that validates secrets have proper format before use. 