# LAB03 - Exercise: Branching Basics

Follow these steps to complete the lab:

## Task 1: Initialize a Repository
* Create a new directory called `git-branching-lab`, initialize a Git repository, and create a Python file called `app.py` with a simple function that returns "Main branch".
* Make your initial commit with an appropriate message.

## Task 2: Create and Work on Feature Branch
* Create a new branch named `feature-login`.
* Switch to this branch and modify `app.py` to add a new function called `login()` that returns "User logged in".
* Add a line to call this function and print its result.
* Commit these changes with an appropriate message.

## Task 3: Create Another Feature Branch
* From the main branch, create a new branch named `feature-dashboard`.
* Switch to this branch and modify `app.py` to add a function called `show_dashboard()` that returns "Dashboard displayed".
* Add a line to call this function and print its result.
* Commit these changes with an appropriate message.

## Task 4: Update Main Branch
* Switch back to the main branch.
* Make a different change to `app.py` by adding a function called `logout()` that returns "User logged out".
* Commit this change to the main branch.

## Task 5: Merge Feature-Login
* Merge the `feature-login` branch into the main branch.
* Verify that the main branch now contains both the `logout()` and `login()` functions.

## Task 6: Create a Merge Conflict
* Modify the first line of `app.py` in the main branch to return "Updated main branch" and commit the change.
* Switch to the `feature-dashboard` branch.
* Modify the same line in `app.py` to return "Dashboard branch" and commit the change.
* Switch back to main and try to merge `feature-dashboard`.

## Task 7: Resolve the Merge Conflict
* Observe the merge conflict message.
* Open `app.py` and find the conflict markers (<<<<<<, =======, >>>>>>>).
* Edit the file to resolve the conflict by keeping both changes in a meaningful way.
* Add the resolved file and complete the merge with a commit.

## Task 8: Visualize Your Branches
* Use `git log` with the `--graph`, `--oneline`, and `--all` flags to visualize your branch structure.
* Create a text file called `BRANCHES.md` that describes the purpose of each branch you created and the merging process you followed.
* Commit this file to the main branch.

## Bonus Task
* Try the `git branch -v` and `git branch --merged` commands to see additional branch information.
* Delete a feature branch that has been fully merged using `git branch -d`. 