# LAB07 - Exercise: Branches & Pull Requests

Follow these steps to complete the lab:

## Task 1: Create a Feature Branch Repository
* Create a new GitHub repository called `github-collaboration-lab` or use an existing one.
* Clone the repository to your local machine.
* Create a basic README.md file with a project title and description if it doesn't exist.
* Add at least one code file (e.g., `app.py` with a simple "Hello World" function).
* Commit and push these files to the main branch.

## Task 2: Create and Work on a Feature Branch
* Create a new branch called `feature-user-greeting` from the main branch.
* Switch to this new branch.
* Modify your code file to add a new function that takes a username and returns a personalized greeting.
* Add a new file called `CONTRIBUTORS.md` with your name or username.
* Commit these changes with a descriptive message.
* Push the feature branch to GitHub.

## Task 3: Create a Pull Request
* Go to your GitHub repository in your web browser.
* Create a new pull request from your `feature-user-greeting` branch to the main branch.
* Add a title and description explaining your changes.
* Reference any related issues (if they exist).
* Submit the pull request.

## Task 4: Review and Comment
* Examine the pull request page on GitHub to see the diff view of your changes.
* Add a comment to your own pull request explaining a specific part of your code.
* If working with a partner, review their pull request and leave constructive comments.

## Task 5: Modify Based on Feedback
* Return to your local repository and make sure you're on the feature branch.
* Make an additional change based on a real or simulated review comment.
* Commit this change.
* Push the update to GitHub.
* Observe how the pull request automatically updates.

## Task 6: Merge the Pull Request
* On GitHub, merge the pull request using the "Merge pull request" button.
* Choose an appropriate merge strategy (standard merge, squash, or rebase).
* Delete the feature branch on GitHub after merging.
* Update your local repository by pulling the changes from the main branch.
* Delete the local feature branch.

## Task 7: Create a Conflicting Branch
* Create a new branch called `feature-formatting` from the main branch.
* Modify the same file and line that you changed in the previous feature branch.
* Commit and push this branch to GitHub.
* Create a pull request and observe any merge conflicts.
* Resolve the conflicts using the GitHub interface or locally.
* Complete the merge after resolving conflicts.

## Bonus Task
* Create a branch protection rule for the main branch that requires pull request reviews before merging.
* Attempt to push directly to the main branch and observe what happens.
* Create a draft pull request for a new experimental feature. 