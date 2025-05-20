# LAB08 - Exercise: Forks & Upstream Syncing

Follow these steps to complete the lab:

## Task 1: Find a Repository to Fork
* Go to GitHub and find a public repository to fork. You can use one of these options:
   - The lab's sample repository (ask your instructor for the URL)
   - A GitHub learning repository like https://github.com/octocat/Spoon-Knife
   - A simple open-source project that interests you
* Examine the repository structure and familiarize yourself with its content.

## Task 2: Fork the Repository
* Click the "Fork" button in the top right corner of the repository page.
* Select your GitHub account as the destination for the fork.
* Wait for GitHub to create your copy of the repository.
* Verify that the fork has been created in your GitHub account.

## Task 3: Clone Your Fork Locally
* Copy the URL of your forked repository.
* Open your terminal or command prompt.
* Clone your fork to your local machine using `git clone`.
* Navigate into the cloned repository directory.

## Task 4: Add the Upstream Repository
* Identify the URL of the original repository (the one you forked).
* Add this original repository as a remote called "upstream" using `git remote add`.
* Verify your remote configuration with `git remote -v` (you should see both origin and upstream).

## Task 5: Make and Publish Changes to Your Fork
* Create a new branch for your changes.
* Make some appropriate changes to one of the files (add your username to a contributors list, improve documentation, etc.).
* Commit these changes with a descriptive message.
* Push your changes to your fork on GitHub.

## Task 6: Create a Pull Request (Optional - if allowed by the repository)
* Go to your fork on GitHub.
* Click "Contribute" or "Pull request".
* Create a new pull request to the original repository.
* Describe your changes clearly in the pull request description.
* Submit the pull request.

## Task 7: Sync with the Upstream Repository
* Fetch the latest changes from the upstream repository.
* Check what changes exist in the upstream repository that you don't have locally.
* Sync your main branch with the upstream main branch.
* Push the updated main branch to your fork.

## Task 8: Resolve a Merge Conflict with Upstream
* Make a change to a file in your fork's main branch and commit it.
* Find the same file in the upstream repository and check if it has been modified recently.
* If it hasn't been modified, make a change to the same line in that file through the GitHub interface on the original repository (if you have permission) or simulate this scenario by modifying your local upstream remote.
* Fetch the upstream changes.
* Try to merge the upstream changes and resolve any conflicts.
* Push the resolved merge to your fork.

## Bonus Task
* Create a second fork of a different repository.
* Set up a GitHub Action in your fork that keeps it automatically synchronized with the upstream repository.
* Document the steps you took to set up the automation in a file called SYNC_SETUP.md.
* Test the automatic synchronization and verify it works. 