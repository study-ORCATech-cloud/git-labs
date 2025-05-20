# LAB11 - Exercise: Git Hooks

Follow these steps to complete the lab:

## Task 1: Create a Test Repository
* Create a new directory called `git-hooks-lab` and navigate into it.
* Initialize a new Git repository in this directory.
* Create a sample text file called `sample.txt` with a few lines of content.
* Add and commit the file to the repository.

## Task 2: Explore Git Hooks Directory
* Navigate to the `.git/hooks` directory in your repository.
* List the sample hook files that Git provides by default.
* Examine the content of a sample hook file to understand its structure.

## Task 3: Create a Simple Pre-commit Hook
* Create a new file called `pre-commit` in the `.git/hooks` directory.
* Add a shebang line at the top of the file: `#!/bin/bash` or `#!/bin/sh`.
* Add a simple echo command to display a message when committing.
* Make the hook executable using `chmod +x`.
* Test the hook by making a change and attempting to commit it.

## Task 4: Create a Text Validation Pre-commit Hook
* Modify your pre-commit hook to check text files for common issues.
* Add checks for:
  * Trailing whitespace
  * Lines longer than 80 characters
  * TODO/FIXME markers
* Make the commit fail if any issues are found.
* Test the hook with both clean text and text with issues.

## Task 5: Create a Commit Message Validation Hook
* Create a new hook file called `commit-msg` in the `.git/hooks` directory.
* Write a script that validates commit messages for a specific format or minimum length.
* Make the hook executable.
* Test the hook with valid and invalid commit messages.

## Task 6: Create a Post-commit Hook
* Create a new hook file called `post-commit` in the `.git/hooks` directory.
* Add commands to display a summary of the commit that was just created.
* Make the hook executable.
* Test the post-commit hook by making a commit.

## Task 7: Work with Pre-push Hook
* Create a new hook file called `pre-push` in the `.git/hooks` directory.
* Add commands to run checks before pushing, such as validating file content.
* Make the hook executable.
* Test the hook by attempting to push your changes.

## Task 8: Create a Hook to Prevent Direct Commits to Main
* Create or modify the pre-commit hook to check the current branch.
* Add logic to prevent commits directly to the main branch.
* Test the hook by trying to commit while on the main branch.
* Test the hook by committing to a feature branch.

## Bonus Task
* Create a script to install all your hooks automatically for new repositories.
* Set up a global Git hooks directory in your user profile.
* Configure Git to use this global hooks directory by default.
* Test that your hooks work across different repositories. 