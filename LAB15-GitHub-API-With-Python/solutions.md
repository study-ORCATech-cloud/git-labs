# LAB15 - Solutions: GitHub API with Python

Here are the solutions to the exercises:

## Task 1: Set Up Authentication

```python
# scripts/auth.py
import os
import requests
import sys

def get_github_token():
    """
    Retrieves the GitHub token from the environment variable.
    Exits with error message if token is not found.
    """
    token = os.getenv("GITHUB_TOKEN")
    if not token:
        print("Error: GITHUB_TOKEN environment variable not set.")
        print("Please set it with your GitHub Personal Access Token:")
        print("  export GITHUB_TOKEN=your_token_here")
        sys.exit(1)
    return token

def get_auth_headers():
    """
    Returns properly formatted authorization headers for GitHub API requests.
    """
    token = get_github_token()
    return {
        "Authorization": f"Bearer {token}",
        "Accept": "application/vnd.github.v3+json"
    }

def test_authentication():
    """
    Tests authentication by making a request to the user endpoint.
    """
    headers = get_auth_headers()
    try:
        response = requests.get("https://api.github.com/user", headers=headers)
        response.raise_for_status()  # Raise exception for HTTP errors
        user_data = response.json()
        print(f"Authentication successful! Logged in as: {user_data['login']}")
        print(f"User profile: {user_data['html_url']}")
        return True
    except requests.exceptions.HTTPError as e:
        if response.status_code == 401:
            print("Authentication failed: Invalid token or insufficient permissions.")
        else:
            print(f"HTTP Error: {e}")
        return False
    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")
        return False

if __name__ == "__main__":
    # Test authentication when run directly
    test_authentication()
```

**Steps explanation:**
1. Created an authentication module with functions to:
   - Get the GitHub token from environment variables
   - Generate proper authorization headers
   - Test authentication with the GitHub API
2. Implemented error handling for missing tokens
3. Added response validation and error handling for API requests
4. Created a test function that can be run directly to verify token works

## Task 2: List and Analyze Repositories

```python
# scripts/github_repos.py
import requests
import sys
from auth import get_auth_headers

def get_user_repositories(username=None, visibility=None, sort_by="updated", direction="desc"):
    """
    Retrieves repositories for the authenticated user or a specified user.
    
    Args:
        username (str, optional): If provided, gets repos for this user. Otherwise, gets authenticated user's repos.
        visibility (str, optional): Filter by visibility (all, public, private).
        sort_by (str, optional): Property to sort by (created, updated, pushed, full_name).
        direction (str, optional): Sort direction (asc or desc).
    
    Returns:
        list: List of repository dictionaries.
    """
    headers = get_auth_headers()
    params = {
        "sort": sort_by,
        "direction": direction,
        "per_page": 100  # Maximum allowed per page
    }
    
    if visibility and visibility in ["all", "public", "private"]:
        params["visibility"] = visibility
    
    # Get authenticated user's repos or a specific user's repos
    if username:
        url = f"https://api.github.com/users/{username}/repos"
    else:
        url = "https://api.github.com/user/repos"
    
    all_repos = []
    page = 1
    
    while True:
        params["page"] = page
        response = requests.get(url, headers=headers, params=params)
        
        if response.status_code == 404:
            print(f"User '{username}' not found.")
            return []
        
        response.raise_for_status()
        repos = response.json()
        
        if not repos:
            break  # No more repositories
            
        all_repos.extend(repos)
        page += 1
        
        # Check if we've reached the last page
        if len(repos) < params["per_page"]:
            break
    
    return all_repos

def filter_repositories(repositories, language=None, min_stars=0, min_forks=0, is_fork=None, archived=None):
    """
    Filters repositories based on specified criteria.
    
    Args:
        repositories (list): List of repository dictionaries.
        language (str, optional): Filter by programming language.
        min_stars (int, optional): Minimum number of stars.
        min_forks (int, optional): Minimum number of forks.
        is_fork (bool, optional): Filter by fork status.
        archived (bool, optional): Filter by archived status.
    
    Returns:
        list: Filtered list of repositories.
    """
    filtered_repos = repositories
    
    if language:
        filtered_repos = [repo for repo in filtered_repos if repo.get("language") == language]
    
    if min_stars > 0:
        filtered_repos = [repo for repo in filtered_repos if repo.get("stargazers_count", 0) >= min_stars]
    
    if min_forks > 0:
        filtered_repos = [repo for repo in filtered_repos if repo.get("forks_count", 0) >= min_forks]
    
    if is_fork is not None:
        filtered_repos = [repo for repo in filtered_repos if repo.get("fork") == is_fork]
    
    if archived is not None:
        filtered_repos = [repo for repo in filtered_repos if repo.get("archived") == archived]
    
    return filtered_repos

def display_repository_stats(repositories):
    """
    Displays statistics for a list of repositories.
    
    Args:
        repositories (list): List of repository dictionaries.
    """
    if not repositories:
        print("No repositories found matching the criteria.")
        return
    
    total_stars = sum(repo.get("stargazers_count", 0) for repo in repositories)
    total_forks = sum(repo.get("forks_count", 0) for repo in repositories)
    languages = {}
    
    for repo in repositories:
        lang = repo.get("language") or "Unknown"
        if lang in languages:
            languages[lang] += 1
        else:
            languages[lang] = 1
    
    print(f"\nRepository Statistics:")
    print(f"=====================")
    print(f"Total repositories: {len(repositories)}")
    print(f"Total stars: {total_stars}")
    print(f"Total forks: {total_forks}")
    
    print(f"\nLanguage breakdown:")
    for lang, count in sorted(languages.items(), key=lambda x: x[1], reverse=True):
        percentage = (count / len(repositories)) * 100
        print(f"  {lang}: {count} ({percentage:.1f}%)")
    
    print(f"\nTop repositories by stars:")
    for repo in sorted(repositories, key=lambda r: r.get("stargazers_count", 0), reverse=True)[:5]:
        print(f"  {repo['name']}: {repo['stargazers_count']} stars, {repo['forks_count']} forks")

def sort_repositories(repositories, sort_key="updated_at", reverse=True):
    """
    Sorts repositories by the specified attribute.
    
    Args:
        repositories (list): List of repository dictionaries.
        sort_key (str): The key to sort by.
        reverse (bool): Whether to sort in descending order.
    
    Returns:
        list: Sorted list of repositories.
    """
    # Map of common sort keys to their actual property names in the API response
    key_mapping = {
        "stars": "stargazers_count",
        "forks": "forks_count",
        "updated": "updated_at",
        "created": "created_at",
        "pushed": "pushed_at",
        "name": "name",
        "size": "size"
    }
    
    # Use mapped key if available, otherwise use the provided key
    actual_key = key_mapping.get(sort_key, sort_key)
    
    # Sort with a safe getter that handles missing keys
    return sorted(repositories, key=lambda r: r.get(actual_key, 0) if isinstance(r.get(actual_key, 0), (int, float)) else "", reverse=reverse)

def print_repositories(repositories, show_details=False):
    """
    Prints repository information in a formatted way.
    
    Args:
        repositories (list): List of repository dictionaries.
        show_details (bool): Whether to show detailed information.
    """
    if not repositories:
        print("No repositories found.")
        return
    
    print(f"\nFound {len(repositories)} repositories:\n")
    
    for i, repo in enumerate(repositories, 1):
        print(f"{i}. {repo['name']} - {repo['html_url']}")
        
        if show_details:
            print(f"   Description: {repo.get('description', 'No description')}")
            print(f"   Language: {repo.get('language', 'Not specified')}")
            print(f"   Stars: {repo.get('stargazers_count', 0)}, Forks: {repo.get('forks_count', 0)}")
            print(f"   Created: {repo.get('created_at', 'Unknown')}, Last updated: {repo.get('updated_at', 'Unknown')}")
            print(f"   Fork: {repo.get('fork', False)}, Archived: {repo.get('archived', False)}")
            print("")

if __name__ == "__main__":
    try:
        # Example usage
        username = None  # Set to None for authenticated user's repos or specify a username
        repos = get_user_repositories(username)
        
        # Filter repositories
        filtered_repos = filter_repositories(
            repos,
            language="Python",
            min_stars=0,
            is_fork=False
        )
        
        # Sort by stars
        sorted_repos = sort_repositories(filtered_repos, "stars")
        
        # Display repositories
        print_repositories(sorted_repos, show_details=True)
        
        # Show stats
        display_repository_stats(filtered_repos)
        
    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        sys.exit(1)
```

**Steps explanation:**
1. Created a script to work with GitHub repositories
2. Implemented functions to:
   - Retrieve repositories with pagination support
   - Filter repositories by language, stars, fork status, etc.
   - Sort repositories by different attributes
   - Display repository statistics
   - Print repository details in a readable format
3. Added proper error handling and parameter validation
4. Included example usage when run directly 

## Task 3: Work with Issues

```python
# scripts/github_issues.py
import requests
import time
import sys
from auth import get_auth_headers

def list_repository_issues(owner, repo, state="open", labels=None, sort_by="created", direction="desc"):
    """
    Lists issues for a specific repository.
    
    Args:
        owner (str): Repository owner username.
        repo (str): Repository name.
        state (str, optional): Issue state (open, closed, all).
        labels (str, optional): Comma-separated list of label names.
        sort_by (str, optional): Property to sort by (created, updated, comments).
        direction (str, optional): Sort direction (asc or desc).
    
    Returns:
        list: List of issue dictionaries.
    """
    headers = get_auth_headers()
    params = {
        "state": state,
        "sort": sort_by,
        "direction": direction,
        "per_page": 100
    }
    
    if labels:
        params["labels"] = labels
    
    url = f"https://api.github.com/repos/{owner}/{repo}/issues"
    all_issues = []
    page = 1
    
    while True:
        params["page"] = page
        
        try:
            response = requests.get(url, headers=headers, params=params)
            
            # Handle rate limiting
            if response.status_code == 403 and 'X-RateLimit-Remaining' in response.headers and int(response.headers['X-RateLimit-Remaining']) == 0:
                reset_time = int(response.headers['X-RateLimit-Reset'])
                sleep_time = max(reset_time - time.time(), 0) + 1
                print(f"Rate limit exceeded. Waiting {sleep_time:.0f} seconds...")
                time.sleep(sleep_time)
                continue  # Retry the request
            
            response.raise_for_status()
            issues = response.json()
            
            if not issues:
                break  # No more issues
                
            # Filter out pull requests (GitHub API returns PRs as issues too)
            issues = [issue for issue in issues if 'pull_request' not in issue]
            
            all_issues.extend(issues)
            page += 1
            
            # Check if we've reached the last page
            if len(issues) < params["per_page"]:
                break
                
        except requests.exceptions.RequestException as e:
            print(f"Error fetching issues: {e}")
            return all_issues
    
    return all_issues

def create_issue(owner, repo, title, body, labels=None, assignees=None):
    """
    Creates a new issue in a repository.
    
    Args:
        owner (str): Repository owner username.
        repo (str): Repository name.
        title (str): Issue title.
        body (str): Issue body text.
        labels (list, optional): List of label names.
        assignees (list, optional): List of usernames to assign.
    
    Returns:
        dict: Created issue data if successful, None otherwise.
    """
    headers = get_auth_headers()
    url = f"https://api.github.com/repos/{owner}/{repo}/issues"
    
    # Prepare the issue data
    issue_data = {
        "title": title,
        "body": body
    }
    
    if labels:
        issue_data["labels"] = labels
        
    if assignees:
        issue_data["assignees"] = assignees
    
    try:
        response = requests.post(url, headers=headers, json=issue_data)
        response.raise_for_status()
        issue = response.json()
        print(f"Issue created successfully: {issue['html_url']}")
        return issue
    except requests.exceptions.HTTPError as e:
        if response.status_code == 404:
            print(f"Repository '{owner}/{repo}' not found or you don't have access.")
        elif response.status_code == 403:
            print("Forbidden: You don't have permission to create issues in this repository.")
        elif response.status_code == 422:
            print(f"Validation error: {response.json().get('message', '')}")
        else:
            print(f"HTTP Error: {e}")
        return None
    except requests.exceptions.RequestException as e:
        print(f"Request error: {e}")
        return None

def update_issue_state(owner, repo, issue_number, state):
    """
    Updates an issue's state (open or closed).
    
    Args:
        owner (str): Repository owner username.
        repo (str): Repository name.
        issue_number (int): Issue number.
        state (str): New state ('open' or 'closed').
    
    Returns:
        dict: Updated issue data if successful, None otherwise.
    """
    if state not in ['open', 'closed']:
        print("Error: State must be 'open' or 'closed'.")
        return None
    
    headers = get_auth_headers()
    url = f"https://api.github.com/repos/{owner}/{repo}/issues/{issue_number}"
    
    try:
        response = requests.patch(url, headers=headers, json={"state": state})
        response.raise_for_status()
        issue = response.json()
        print(f"Issue #{issue_number} state changed to '{state}': {issue['html_url']}")
        return issue
    except requests.exceptions.RequestException as e:
        print(f"Error updating issue state: {e}")
        return None

def add_issue_comment(owner, repo, issue_number, comment_body):
    """
    Adds a comment to an issue.
    
    Args:
        owner (str): Repository owner username.
        repo (str): Repository name.
        issue_number (int): Issue number.
        comment_body (str): Comment text.
    
    Returns:
        dict: Comment data if successful, None otherwise.
    """
    headers = get_auth_headers()
    url = f"https://api.github.com/repos/{owner}/{repo}/issues/{issue_number}/comments"
    
    try:
        response = requests.post(url, headers=headers, json={"body": comment_body})
        response.raise_for_status()
        comment = response.json()
        print(f"Comment added to issue #{issue_number}: {comment['html_url']}")
        return comment
    except requests.exceptions.RequestException as e:
        print(f"Error adding comment: {e}")
        return None

def assign_issue(owner, repo, issue_number, assignees):
    """
    Assigns users to an issue.
    
    Args:
        owner (str): Repository owner username.
        repo (str): Repository name.
        issue_number (int): Issue number.
        assignees (list): List of usernames to assign.
    
    Returns:
        dict: Updated issue data if successful, None otherwise.
    """
    headers = get_auth_headers()
    url = f"https://api.github.com/repos/{owner}/{repo}/issues/{issue_number}/assignees"
    
    try:
        response = requests.post(url, headers=headers, json={"assignees": assignees})
        response.raise_for_status()
        issue = response.json()
        print(f"Issue #{issue_number} assigned to: {', '.join(assignees)}")
        return issue
    except requests.exceptions.RequestException as e:
        print(f"Error assigning issue: {e}")
        return None

if __name__ == "__main__":
    try:
        # Example usage
        owner = "octocat"
        repo = "hello-world"
        
        # List issues
        print("\nListing open issues...")
        issues = list_repository_issues(owner, repo, state="open")
        for i, issue in enumerate(issues, 1):
            print(f"{i}. #{issue['number']} - {issue['title']}")
            print(f"   Created by: {issue['user']['login']}")
            print(f"   URL: {issue['html_url']}")
            print()
        
        # Create a new issue (uncomment to test)
        # new_issue = create_issue(
        #     owner, 
        #     repo, 
        #     "Test issue from GitHub API script", 
        #     "This is a test issue created via GitHub API using Python.",
        #     labels=["bug", "documentation"],
        #     assignees=["your-username"]
        # )
        
        # if new_issue:
        #     # Add a comment to the new issue
        #     add_issue_comment(
        #         owner, 
        #         repo, 
        #         new_issue['number'], 
        #         "This is a comment added via the API."
        #     )
        #     
        #     # Assign the issue
        #     assign_issue(owner, repo, new_issue['number'], ["another-username"])
        #     
        #     # Close the issue
        #     update_issue_state(owner, repo, new_issue['number'], "closed")
        
    except KeyboardInterrupt:
        print("\nOperation cancelled by user.")
        sys.exit(0) 