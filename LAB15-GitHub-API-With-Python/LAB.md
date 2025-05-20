# LAB15 - Exercise: GitHub API with Python

Follow these steps to complete the lab:

## Task 1: Set Up Authentication
* Generate a personal access token with appropriate scopes (repo, read:org).
* Create a file named `auth.py` in the scripts directory.
* Write code to securely load the token from an environment variable.
* Create a reusable function that returns properly formatted authorization headers.
* Test the authentication by making a request to the user endpoint.
* Handle potential authentication errors with proper error messages.

## Task 2: List and Analyze Repositories
* Create a file named `github_repos.py` in the scripts directory.
* Import the authentication function from your auth module.
* Write a function to retrieve all repositories for the authenticated user.
* Add functionality to filter repositories by specific criteria (e.g., language, visibility).
* Create a function to display repository statistics (stars, forks, etc.).
* Sort repositories by a specified attribute (e.g., creation date, stars).
* Implement proper pagination handling for users with many repositories.

## Task 3: Work with Issues
* Create a file named `github_issues.py` in the scripts directory.
* Write a function to list all issues for a specific repository.
* Create a function to create a new issue with title, body, and labels.
* Implement functionality to update an existing issue's status.
* Add a function to add comments to an issue.
* Create a feature to assign an issue to a specific user.
* Handle API rate limiting with appropriate retry logic.

## Task 4: Search GitHub
* Create a function to search for repositories using GitHub's search API.
* Implement query parameter handling for complex searches.
* Write a function to search for issues with specific criteria.
* Create functionality to search for users.
* Format and display search results in a readable manner.
* Add sorting and filtering options for search results.

## Task 5: Work with Pull Requests
* Write a function to list pull requests for a repository.
* Create a function to retrieve details about a specific pull request.
* Implement functionality to create a new pull request.
* Add code to review a pull request with comments.
* Create a function to merge a pull request.
* Handle conflicts and other pull request states appropriately.

## Task 6: Organization and Team Data
* Write a function to retrieve organization information.
* Create functionality to list teams within an organization.
* Implement a function to get team members.
* Add a feature to get repositories accessible to a specific team.
* Handle permissions and visibility constraints appropriately.

## Task 7: Repository Webhooks
* Create functions to list existing webhooks for a repository.
* Implement functionality to create a new webhook.
* Write code to update webhook configuration.
* Add a function to test a webhook.
* Create functionality to delete a webhook.
* Implement proper security considerations for webhook secrets.

## Bonus Task
* Create a command-line interface (CLI) tool that combines all previous functionality.
* Add argument parsing for different commands and options.
* Implement configuration file support for saving preferences.
* Create a comprehensive error handling and logging system.
* Add interactive mode for user-friendly operation. 