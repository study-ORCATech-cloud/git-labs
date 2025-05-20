# LAB03 - Exercise: Branching Basics

Follow these steps to complete the lab:

## Task 1: Initialize a Repository
* Create a new directory called `git-branching-lab`, initialize a Git repository, and create a text file called `app.txt` with the content "MAIN BRANCH".
* Make your initial commit with an appropriate message.

## Task 2: Create and Work on Feature Branch
* Create a new branch named `feature-login`.
* Switch to this branch and modify `app.txt` to add a new section called "LOGIN FEATURE" with the text "User can now log in".
* Commit these changes with an appropriate message.

## Task 3: Create Another Feature Branch
* From the main branch, create a new branch named `feature-dashboard`.
* Switch to this branch and modify `app.txt` to add a section called "DASHBOARD FEATURE" with the text "Dashboard now displays user data".
* Commit these changes with an appropriate message.

## Task 4: Update Main Branch
* Switch back to the main branch.
* Make a different change to `app.txt` by adding a section called "LOGOUT FEATURE" with the text "User can now log out".
* Commit this change to the main branch.

## Task 5: Merge Feature-Login
* Merge the `feature-login` branch into the main branch.
* Verify that the main branch now contains both the "LOGOUT FEATURE" and "LOGIN FEATURE" sections.

## Task 6: Create a Merge Conflict
* Modify the first line of `app.txt` in the main branch to say "UPDATED MAIN BRANCH" and commit the change.
* Switch to the `feature-dashboard` branch.
* Modify the same first line in `app.txt` to say "DASHBOARD BRANCH" and commit the change.
* Switch back to main and try to merge `feature-dashboard`.

## Task 7: Resolve the Merge Conflict
* Observe the merge conflict message.
* Open `app.txt` and find the conflict markers (<<<<<<, =======, >>>>>>>).
* Edit the file to resolve the conflict by keeping both changes in a meaningful way.
* Add the resolved file and complete the merge with a commit.

## Task 8: Visualize Your Branches
* Use `git log` with the `--graph`, `--oneline`, and `--all` flags to visualize your branch structure.
* Create a text file called `BRANCHES.md` that describes the purpose of each branch you created and the merging process you followed.
* Commit this file to the main branch.

## Bonus Task
* Try the `git branch -v` and `git branch --merged` commands to see additional branch information.
* Delete a feature branch that has been fully merged using `git branch -d`. 