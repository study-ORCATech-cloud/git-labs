# LAB08 - Exercise: Forks & Upstream Syncing

Follow these steps to complete the lab:

## Task 1: Find a Repository to Fork
TODO: Go to GitHub and find a public repository to fork. You can use one of these options:
   - The lab's sample repository (ask your instructor for the URL)
   - A GitHub learning repository like https://github.com/octocat/Spoon-Knife
   - A simple open-source project that interests you
TODO: Examine the repository structure and familiarize yourself with its content.

## Task 2: Fork the Repository
TODO: Click the "Fork" button in the top right corner of the repository page.
TODO: Select your GitHub account as the destination for the fork.
TODO: Wait for GitHub to create your copy of the repository.
TODO: Verify that the fork has been created in your GitHub account.

## Task 3: Clone Your Fork Locally
TODO: Copy the URL of your forked repository.
TODO: Open your terminal or command prompt.
TODO: Clone your fork to your local machine using `git clone`.
TODO: Navigate into the cloned repository directory.

## Task 4: Add the Upstream Repository
TODO: Identify the URL of the original repository (the one you forked).
TODO: Add this original repository as a remote called "upstream" using `git remote add`.
TODO: Verify your remote configuration with `git remote -v` (you should see both origin and upstream).

## Task 5: Make and Publish Changes to Your Fork
TODO: Create a new branch for your changes.
TODO: Make some appropriate changes to one of the files (add your username to a contributors list, improve documentation, etc.).
TODO: Commit these changes with a descriptive message.
TODO: Push your changes to your fork on GitHub.

## Task 6: Create a Pull Request (Optional - if allowed by the repository)
TODO: Go to your fork on GitHub.
TODO: Click "Contribute" or "Pull request".
TODO: Create a new pull request to the original repository.
TODO: Describe your changes clearly in the pull request description.
TODO: Submit the pull request.

## Task 7: Sync with the Upstream Repository
TODO: Fetch the latest changes from the upstream repository.
TODO: Check what changes exist in the upstream repository that you don't have locally.
TODO: Sync your main branch with the upstream main branch.
TODO: Push the updated main branch to your fork.

## Task 8: Resolve a Merge Conflict with Upstream
TODO: Make a change to a file in your fork's main branch and commit it.
TODO: Find the same file in the upstream repository and check if it has been modified recently.
TODO: If it hasn't been modified, make a change to the same line in that file through the GitHub interface on the original repository (if you have permission) or simulate this scenario by modifying your local upstream remote.
TODO: Fetch the upstream changes.
TODO: Try to merge the upstream changes and resolve any conflicts.
TODO: Push the resolved merge to your fork.

## Bonus Task
TODO: Create a second fork of a different repository.
TODO: Set up a GitHub Action in your fork that keeps it automatically synchronized with the upstream repository.
TODO: Document the steps you took to set up the automation in a file called SYNC_SETUP.md.
TODO: Test the automatic synchronization and verify it works. 