# LAB05 - Exercise: Stashing & Tagging

Follow these steps to complete the lab:

## Task 1: Setup a Basic Repository
TODO: Create a new directory called `git-stash-tag-lab` and initialize a Git repository.
TODO: Create a Python file called `feature.py` with a basic function that returns "Initial version".
TODO: Add and commit this file with an appropriate message.

## Task 2: Working with Git Stash
TODO: Modify `feature.py` to add a new function that is partially implemented but not ready to commit.
TODO: Use `git stash` to temporarily store your changes.
TODO: Verify that your working directory is clean and your changes are hidden.
TODO: Create a new branch called `hotfix` and modify the original function to fix a "bug".
TODO: Commit this change on the hotfix branch.
TODO: Switch back to main (or master) branch.
TODO: Apply your stashed changes using `git stash apply`.
TODO: Examine the file to confirm both changes are present.
TODO: Remove the stash from the stash list using `git stash drop`.

## Task 3: Using Stash with Multiple Changes
TODO: Make two different changes to `feature.py`: add a comment at the top and a new function at the bottom.
TODO: Use `git stash push -m "Added comment and new function"` to stash with a descriptive message.
TODO: View your stash list to see the saved message.
TODO: Create a new file called `utils.py` and commit it.
TODO: Use `git stash pop` to apply and remove the most recent stash in one command.
TODO: Commit the reapplied changes.

## Task 4: Basic Tagging
TODO: Create a lightweight tag named `v0.1` on your latest commit.
TODO: List all tags to confirm it was created.
TODO: Make a change to `feature.py` and commit it.
TODO: Create an annotated tag named `v0.2` with a message describing this version.
TODO: Use `git show` to examine the details of your annotated tag.

## Task 5: Working with Tags
TODO: Make several more commits with small changes to your files.
TODO: Create a tag named `v1.0` on your latest commit.
TODO: Checkout the code at tag `v0.2` and notice the detached HEAD state.
TODO: Create a new branch from this tag called `legacy-support`.
TODO: Make a change to `feature.py` in this branch and commit it.
TODO: Switch back to the main branch and verify you are seeing the latest version.

## Task 6: Tag Management
TODO: Create a tag `v1.1` on your latest commit.
TODO: Push your tag to a simulated remote using `git tag -n` (to just display tags and their messages).
TODO: Delete the local tag `v0.1` using `git tag -d`.
TODO: Re-create a tag with the same name but on a different commit.
TODO: Document the process of deleting a remote tag in a file called `TAG-NOTES.md`.

## Bonus Task
TODO: Research and demonstrate using `git stash branch` to create a new branch directly from a stash.
TODO: Create two tags (a lightweight and an annotated one) and explain the differences in `TAG-NOTES.md`. 