# LAB04 - Exercise: Reset vs Revert

Follow these steps to complete the lab:

## Task 1: Setup Project with Multiple Commits
* Create a new directory called `git-reset-revert-lab`, initialize a Git repository, and create a text file called `app.txt` that contains the line "Version 1".
* Make your initial commit with an appropriate message.
* Modify `app.txt` to change the text to "Version 2" and make a second commit.
* Modify `app.txt` again to change the text to "Version 3" and make a third commit.
* Use `git log --oneline` to view your commit history and note the commit hashes.

## Task 2: Using Git Reset (Local Changes)
* Create a new branch called `reset-example` from your current position.
* Use `git reset --soft HEAD~1` to undo the last commit but keep changes staged.
* Check the status and understand what happened (changes are in staging area).
* Now use `git reset --mixed HEAD~1` to undo another commit and unstage changes.
* Check the status and understand what happened (changes are in working directory).
* Create a new commit with the current changes so the next reset has something to act on.
* Finally, use `git reset --hard HEAD~1` to completely remove the first commit.
* Check the status and verify the file contents to understand what happened.

## Task 3: Using Git Revert (Shared Changes)
* Return to the main branch with all three commits.
* Create a new branch called `revert-example`.
* Use `git revert HEAD` to undo the last commit by creating a new commit.
* Check the log and status to see the new revert commit.
* Use `git revert` with a specific commit hash to undo an earlier change (not the most recent).
* Check the log and status to see the changes.

## Task 4: Compare Reset and Revert Results
* Compare the commit history in both the `reset-example` and `revert-example` branches using `git log --oneline`.
* Note the differences in the commit history structure between the two approaches.
* Create a file called `COMPARISON.md` where you explain the key differences between `reset` and `revert` and when to use each.

## Task 5: Working with Remote Repositories
* Create a third branch called `remote-simulation` from your original main branch.
* Make a change to `app.txt` and commit it.
* Pretend this branch has been pushed to a shared remote repository.
* Try using both reset and revert to undo the change, and explain in `COMPARISON.md` which approach is safer for changes that have been pushed.

## Task 6: Revert a Merge Commit
* Create two new branches: `feature-x` and `feature-y` from your main branch.
* Make distinct changes to `app.txt` in each branch and commit them.
* Switch back to main and merge `feature-x` with `--no-ff` option to force a merge commit.
* Use `git revert -m 1 <merge-commit-hash>` to revert the merge.
* Document this process in a file called `MERGE-REVERT.md`.

## Bonus Task
* Research and experiment with `git reflog` to recover commits that were "lost" during reset operations.
* Try `git revert --no-commit` to batch multiple reverts before committing. 
