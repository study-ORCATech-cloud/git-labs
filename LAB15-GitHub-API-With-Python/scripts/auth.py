#!/usr/bin/env python3
"""
GitHub API Authentication Module

This module handles authentication with GitHub's API.
"""

import os
import sys

# TODO: Import required modules (e.g., requests)

def get_github_token():
    """
    Retrieves the GitHub token from the environment variable.
    
    Returns:
        str: GitHub Personal Access Token
    
    Exits if token is not found.
    """
    # TODO: Get token from environment variable
    # TODO: Add validation and error handling for missing token
    pass

def get_auth_headers():
    """
    Returns properly formatted authorization headers for GitHub API requests.
    
    Returns:
        dict: Headers dictionary with authorization and accept headers
    """
    # TODO: Create and return headers dictionary with token
    pass

def test_authentication():
    """
    Tests authentication by making a request to the user endpoint.
    
    Returns:
        bool: True if authentication is successful, False otherwise
    """
    # TODO: Make a request to GitHub API user endpoint
    # TODO: Handle authentication errors
    # TODO: Print user info if successful
    pass

if __name__ == "__main__":
    # TODO: Call test_authentication function
    pass 