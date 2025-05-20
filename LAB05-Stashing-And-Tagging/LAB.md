# LAB05 - Exercise: Stashing & Tagging

Follow these steps to complete the lab:

## Task 1: Setup a Basic Repository
* Create a new directory called `git-stash-tag-lab` and initialize a Git repository.
* Create a Python file called `feature.py` with a basic function that returns "Initial version".
* Add and commit this file with an appropriate message.

## Task 2: Working with Git Stash
* Modify `feature.py` to add a new function that is partially implemented but not ready to commit.
* Use `git stash` to temporarily store your changes.
* Verify that your working directory is clean and your changes are hidden.
* Create a new branch called `hotfix` and modify the original function to fix a "bug".
* Commit this change on the hotfix branch.
* Switch back to main (or master) branch.
* Apply your stashed changes using `git stash apply`.
* Examine the file to confirm both changes are present.
* Remove the stash from the stash list using `git stash drop`.

## Task 3: Using Stash with Multiple Changes
* Make two different changes to `feature.py`: add a comment at the top and a new function at the bottom.
* Use `git stash push -m "Added comment and new function"` to stash with a descriptive message.
* View your stash list to see the saved message.
* Create a new file called `utils.py` and commit it.
* Use `git stash pop` to apply and remove the most recent stash in one command.
* Commit the reapplied changes.

## Task 4: Basic Tagging
* Create a lightweight tag named `v0.1` on your latest commit.
* List all tags to confirm it was created.
* Make a change to `feature.py` and commit it.
* Create an annotated tag named `v0.2` with a message describing this version.
* Use `git show` to examine the details of your annotated tag.

## Task 5: Working with Tags
* Make several more commits with small changes to your files.
* Create a tag named `v1.0` on your latest commit.
* Checkout the code at tag `v0.2` and notice the detached HEAD state.
* Create a new branch from this tag called `legacy-support`.
* Make a change to `feature.py` in this branch and commit it.
* Switch back to the main branch and verify you are seeing the latest version.

## Task 6: Tag Management
* Create a tag `v1.1` on your latest commit.
* Push your tag to a simulated remote using `git tag -n` (to just display tags and their messages).
* Delete the local tag `v0.1` using `git tag -d`.
* Re-create a tag with the same name but on a different commit.
* Document the process of deleting a remote tag in a file called `TAG-NOTES.md`.

## Bonus Task
* Research and demonstrate using `git stash branch` to create a new branch directly from a stash.
* Create two tags (a lightweight and an annotated one) and explain the differences in `TAG-NOTES.md`. 