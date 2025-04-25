# LAB11 - Exercise: Git Hooks

Follow these steps to complete the lab:

## Task 1: Create a Test Repository
TODO: Create a new directory called `git-hooks-lab` and navigate into it.
TODO: Initialize a new Git repository in this directory.
TODO: Create a sample Python file called `sample.py` with a simple print statement.
TODO: Add and commit the file to the repository.

## Task 2: Explore Git Hooks Directory
TODO: Navigate to the `.git/hooks` directory in your repository.
TODO: List the sample hook files that Git provides by default.
TODO: Examine the content of a sample hook file to understand its structure.

## Task 3: Create a Simple Pre-commit Hook
TODO: Create a new file called `pre-commit` in the `.git/hooks` directory.
TODO: Add a shebang line at the top of the file: `#!/bin/bash` or `#!/bin/sh`.
TODO: Add a simple echo command to display a message when committing.
TODO: Make the hook executable using `chmod +x`.
TODO: Test the hook by making a change and attempting to commit it.

## Task 4: Create a Python Linting Pre-commit Hook
TODO: If you don't have a linter installed, install flake8 using `pip install flake8`.
TODO: Modify your pre-commit hook to run flake8 on all Python files in the repository.
TODO: Add code to make the commit fail if linting issues are found.
TODO: Test the hook with both clean code and code with linting issues.

## Task 5: Create a Commit Message Validation Hook
TODO: Create a new hook file called `commit-msg` in the `.git/hooks` directory.
TODO: Write a script that validates commit messages for a specific format or minimum length.
TODO: Make the hook executable.
TODO: Test the hook with valid and invalid commit messages.

## Task 6: Create a Post-commit Hook
TODO: Create a new hook file called `post-commit` in the `.git/hooks` directory.
TODO: Add commands to display a summary of the commit that was just created.
TODO: Make the hook executable.
TODO: Test the post-commit hook by making a commit.

## Task 7: Work with Pre-push Hook
TODO: Create a new hook file called `pre-push` in the `.git/hooks` directory.
TODO: Add commands to run tests or checks before pushing.
TODO: Make the hook executable.
TODO: Test the hook by attempting to push your changes.

## Task 8: Create a Hook to Prevent Direct Commits to Main
TODO: Create or modify the pre-commit hook to check the current branch.
TODO: Add logic to prevent commits directly to the main branch.
TODO: Test the hook by trying to commit while on the main branch.
TODO: Test the hook by committing to a feature branch.

## Bonus Task
TODO: Create a script to install all your hooks automatically for new repositories.
TODO: Set up a global Git hooks directory in your user profile.
TODO: Configure Git to use this global hooks directory by default.
TODO: Test that your hooks work across different repositories. 