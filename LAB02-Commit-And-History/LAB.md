# LAB02 - Exercise: Commit & History

Follow these steps to complete the lab:

## Task 1: Create Project & Initial Commit
* Create a new directory called `git-history-lab`, initialize a Git repository, and create a text file called `main.txt` with a simple message "Version 1".
* Make your initial commit with an appropriate message.

## Task 2: Make Multiple Commits
* Update `main.txt` to include a greeting message like "Hello, Git User!", then commit this change.
* Add a new file `README.md` with a brief project description, and commit it.
* Add a new section to `main.txt` with a list of Git commands you've learned so far, and commit this change.

## Task 3: Explore Commit History
* Use `git log` to view your commit history.
* Try the `--oneline` flag with `git log` and note the difference.
* Use `git log` with at least two additional flags to customize the output (explore options like `--graph`, `--decorate`, `--author`, `--since`, or `--until`).

## Task 4: Compare Versions
* Use `git diff` to see the changes between your working directory and the last commit.
* Create a new change in `main.txt` but don't commit it yet.
* Use `git diff` to see uncomitted changes.
* Use `git diff` with commit hashes to compare your first and last commit.

## Task 5: View Specific Commits
* Identify the hash of your second commit and use `git show` to view its changes.
* Use a relative reference (like `HEAD~1`) with `git show` to view a specific commit.

## Task 6: Annotated History
* Create a file called `HISTORY.md` where you list each commit you've made with its hash and a brief description.
* Commit this file with a message explaining its purpose.

## Bonus Task
* Use `git blame` on `main.txt` to see who made each change (line by line).
* Research and try `git shortlog` to get a summary of commits by author. 