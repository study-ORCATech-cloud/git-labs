# LAB15 - Exercise: GitHub API with Python

Follow these steps to complete the lab:

## Task 1: Set Up Authentication
TODO: Generate a personal access token with appropriate scopes (repo, read:org).
TODO: Create a file named `auth.py` in the scripts directory.
TODO: Write code to securely load the token from an environment variable.
TODO: Create a reusable function that returns properly formatted authorization headers.
TODO: Test the authentication by making a request to the user endpoint.
TODO: Handle potential authentication errors with proper error messages.

## Task 2: List and Analyze Repositories
TODO: Create a file named `github_repos.py` in the scripts directory.
TODO: Import the authentication function from your auth module.
TODO: Write a function to retrieve all repositories for the authenticated user.
TODO: Add functionality to filter repositories by specific criteria (e.g., language, visibility).
TODO: Create a function to display repository statistics (stars, forks, etc.).
TODO: Sort repositories by a specified attribute (e.g., creation date, stars).
TODO: Implement proper pagination handling for users with many repositories.

## Task 3: Work with Issues
TODO: Create a file named `github_issues.py` in the scripts directory.
TODO: Write a function to list all issues for a specific repository.
TODO: Create a function to create a new issue with title, body, and labels.
TODO: Implement functionality to update an existing issue's status.
TODO: Add a function to add comments to an issue.
TODO: Create a feature to assign an issue to a specific user.
TODO: Handle API rate limiting with appropriate retry logic.

## Task 4: Search GitHub
TODO: Create a function to search for repositories using GitHub's search API.
TODO: Implement query parameter handling for complex searches.
TODO: Write a function to search for issues with specific criteria.
TODO: Create functionality to search for users.
TODO: Format and display search results in a readable manner.
TODO: Add sorting and filtering options for search results.

## Task 5: Work with Pull Requests
TODO: Write a function to list pull requests for a repository.
TODO: Create a function to retrieve details about a specific pull request.
TODO: Implement functionality to create a new pull request.
TODO: Add code to review a pull request with comments.
TODO: Create a function to merge a pull request.
TODO: Handle conflicts and other pull request states appropriately.

## Task 6: Organization and Team Data
TODO: Write a function to retrieve organization information.
TODO: Create functionality to list teams within an organization.
TODO: Implement a function to get team members.
TODO: Add a feature to get repositories accessible to a specific team.
TODO: Handle permissions and visibility constraints appropriately.

## Task 7: Repository Webhooks
TODO: Create functions to list existing webhooks for a repository.
TODO: Implement functionality to create a new webhook.
TODO: Write code to update webhook configuration.
TODO: Add a function to test a webhook.
TODO: Create functionality to delete a webhook.
TODO: Implement proper security considerations for webhook secrets.

## Bonus Task
TODO: Create a command-line interface (CLI) tool that combines all previous functionality.
TODO: Add argument parsing for different commands and options.
TODO: Implement configuration file support for saving preferences.
TODO: Create a comprehensive error handling and logging system.
TODO: Add interactive mode for user-friendly operation. 