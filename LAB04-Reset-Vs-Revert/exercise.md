# LAB04 - Exercise: Reset vs Revert

Follow these steps to complete the lab:

## Task 1: Setup Project with Multiple Commits
TODO: Create a new directory called `git-reset-revert-lab`, initialize a Git repository, and create a Python file called `app.py` with a function that prints "Version 1".
TODO: Make your initial commit with an appropriate message.
TODO: Modify `app.py` to change the message to "Version 2" and make a second commit.
TODO: Modify `app.py` again to change the message to "Version 3" and make a third commit.
TODO: Use `git log --oneline` to view your commit history and note the commit hashes.

## Task 2: Using Git Reset (Local Changes)
TODO: Create a new branch called `reset-example` from your current position.
TODO: Use `git reset --soft HEAD~1` to undo the last commit but keep changes staged.
TODO: Check the status and understand what happened (changes are in staging area).
TODO: Now use `git reset --mixed HEAD~1` to undo another commit and unstage changes.
TODO: Check the status and understand what happened (changes are in working directory).
TODO: Finally, use `git reset --hard HEAD~1` to completely remove the first commit.
TODO: Check the status and verify the file contents to understand what happened.

## Task 3: Using Git Revert (Shared Changes)
TODO: Return to the main branch with all three commits.
TODO: Create a new branch called `revert-example`.
TODO: Use `git revert HEAD` to undo the last commit by creating a new commit.
TODO: Check the log and status to see the new revert commit.
TODO: Use `git revert` with a specific commit hash to undo an earlier change (not the most recent).
TODO: Check the log and status to see the changes.

## Task 4: Compare Reset and Revert Results
TODO: Compare the commit history in both the `reset-example` and `revert-example` branches using `git log --oneline`.
TODO: Note the differences in the commit history structure between the two approaches.
TODO: Create a file called `COMPARISON.md` where you explain the key differences between `reset` and `revert` and when to use each.

## Task 5: Working with Remote Repositories
TODO: Create a third branch called `remote-simulation` from your original main branch.
TODO: Make a change to `app.py` and commit it.
TODO: Pretend this branch has been pushed to a shared remote repository.
TODO: Try using both reset and revert to undo the change, and explain in `COMPARISON.md` which approach is safer for changes that have been pushed.

## Task 6: Revert a Merge Commit
TODO: Create two new branches: `feature-x` and `feature-y` from your main branch.
TODO: Make distinct changes to `app.py` in each branch and commit them.
TODO: Switch back to main and merge `feature-x` with `--no-ff` option to force a merge commit.
TODO: Use `git revert -m 1 <merge-commit-hash>` to revert the merge.
TODO: Document this process in a file called `MERGE-REVERT.md`.

## Bonus Task
TODO: Research and experiment with `git reflog` to recover commits that were "lost" during reset operations.
TODO: Try `git revert --no-commit` to batch multiple reverts before committing. 