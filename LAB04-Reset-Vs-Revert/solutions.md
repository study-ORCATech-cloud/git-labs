# LAB04 - Solutions: Reset vs Revert

Here are the solutions to the exercises:

## Task 1: Setup Project with Multiple Commits
```bash
# Create directory and initialize repository
mkdir git-reset-revert-lab
cd git-reset-revert-lab
git init

# Create app.txt with Version 1
cat > app.txt << EOF
Version 1
EOF

# Make initial commit
git add app.txt
git commit -m "v1: Initial commit with Version 1"

# Update to Version 2
cat > app.txt << EOF
Version 2
EOF

# Commit Version 2
git commit -am "v2: Update to Version 2"

# Update to Version 3
cat > app.txt << EOF
Version 3
EOF

# Commit Version 3
git commit -am "v3: Update to Version 3"

# View commit history
git log --oneline
```

## Task 2: Using Git Reset (Local Changes)
```bash
# Create a branch for reset examples
git checkout -b reset-example

# Use soft reset (undo commit but keep changes staged)
git reset --soft HEAD~1

# Check status
git status
# You'll see changes are staged but not committed

# Reset with mixed mode (undo commit and unstage changes)
git reset --mixed HEAD~1

# Check status
git status
# You'll see changes are in working directory but not staged

# Reset with hard mode (undo commit and discard changes)
git reset --hard HEAD~1

# Check status and file contents
git status
cat app.txt
# Status is clean and file should show Version 1
```

## Task 3: Using Git Revert (Shared Changes)
```bash
# Return to main branch
git checkout main

# Create branch for revert examples
git checkout -b revert-example

# Revert the most recent commit
git revert HEAD

# Check log and status
git log --oneline
git status
# You should see a new commit that undoes Version 3, returning to Version 2

# Revert an earlier commit (not the most recent)
# First get the commit hash of v1
git log --oneline
# Example: a1b2c3d v1: Initial commit with Version 1

# Revert that commit
git revert a1b2c3d

# Check log
git log --oneline
# You'll see a new commit that undoes the v1 changes
```

## Task 4: Compare Reset and Revert Results
```bash
# Compare histories
git checkout reset-example
git log --oneline

git checkout revert-example
git log --oneline

# Create COMPARISON.md
cat > COMPARISON.md << EOF
# Reset vs Revert Comparison

## Git Reset

- **Purpose**: Moves the HEAD and branch pointer to a previous commit, effectively "erasing" commits
- **History**: Rewrites commit history by removing commits
- **Use Cases**:
  - When you want to completely undo local commits not yet pushed
  - When you need to clean up your commit history before sharing
  - When you made commits you don't want to keep at all

## Git Revert

- **Purpose**: Creates a new commit that undoes changes from a previous commit
- **History**: Preserves all commit history, adding new commits that undo previous ones
- **Use Cases**:
  - When you need to undo changes that have already been shared/pushed
  - When you need to maintain a complete audit trail of all actions
  - When you need to safely undo one commit in the middle of history

## Key Differences

1. **History Preservation**:
   - Reset: Removes commit history
   - Revert: Preserves full history and adds new commits

2. **Safety for Shared Repositories**:
   - Reset: Dangerous for shared branches as it breaks others' history
   - Revert: Safe for shared branches as history remains intact

3. **Command Complexity**:
   - Reset: Simpler to understand conceptually (just moving pointers)
   - Revert: More concepts to understand (creating inverse changes)

4. **Flexibility**:
   - Reset: Offers different modes (--soft, --mixed, --hard)
   - Revert: More limited options, but safer by design
EOF

# Commit the comparison document
git add COMPARISON.md
git commit -m "Add reset vs revert comparison document"
```

## Task 5: Working with Remote Repositories
```bash
# Return to main and create new branch
git checkout main
git checkout -b remote-simulation

# Make a change and commit it
cat > app.txt << EOF
Version 4 - Remote
EOF

git commit -am "v4: Update for remote demo"

# Pretend this is pushed to remote
echo "# This branch has been 'pushed' to a shared repository" >> app.txt
git commit -am "Add note about remote push"

# Try reset - WRONG approach for pushed changes
git reset --hard HEAD~1
# This removed the commit locally, but would cause problems if it was really pushed

# Return to the "pushed" state
git reflog
git reset --hard HEAD@{1}

# Use revert - RIGHT approach for pushed changes
git revert HEAD

# Update comparison document
cat >> COMPARISON.md << EOF

## Working with Remote Repositories

When dealing with commits that have been pushed to a shared repository:

- **Git Reset**: NEVER use reset for changes that have been pushed to a shared repository. This will cause conflicts and confusion for other developers who have pulled those changes.

- **Git Revert**: ALWAYS use revert for undoing changes in a shared repository. This creates a new commit that undoes the changes while preserving history, allowing others to pull the changes without disruption.

Remember: Reset rewrites history, Revert adds to history. Only rewrite history that you haven't shared yet.
EOF

git add COMPARISON.md
git commit -m "Add advice for remote repositories"
```

## Task 6: Revert a Merge Commit
```bash
# Go back to main
git checkout main

# Create feature branches
git checkout -b feature-x
cat > app.txt << EOF
Version 3 - Feature X
EOF
git commit -am "Implement Feature X"

git checkout main
git checkout -b feature-y
cat > app.txt << EOF
Version 3 - Feature Y
EOF
git commit -am "Implement Feature Y"

# Return to main and merge feature-x with no-ff
git checkout main
git merge --no-ff feature-x
# This creates a merge commit

# Revert the merge commit
# First identify the merge commit hash
git log --oneline
# Example: a1b2c3d Merge branch 'feature-x'

# Revert the merge with -m 1 to preserve main branch line
git revert -m 1 a1b2c3d

# Create documentation
cat > MERGE-REVERT.md << EOF
# Reverting a Merge Commit

## Process

1. Created feature-x and feature-y branches
2. Made separate changes in each
3. Merged feature-x into main using --no-ff (no fast-forward)
4. Used git revert with -m 1 to undo the merge

## Explanation

When reverting a merge commit, Git needs to know which parent to follow:
- The -m 1 option tells Git to follow the first parent (main branch)
- The -m 2 option would follow the second parent (feature branch)

Using -m 1 effectively undoes all changes that came in from the feature branch.

## Important Notes

1. After reverting a merge, the feature branch changes are now considered "already undone"
2. Trying to merge the same branch again may not work as expected
3. To re-merge those changes, you would need to:
   - Revert the revert commit, or
   - Create a new branch from the original feature branch

This is why feature branches should typically be small and focused, to avoid complex merge reverts.
EOF

git add MERGE-REVERT.md
git commit -m "Add documentation on reverting merge commits"
```

## Bonus Task
```bash
# Look at reflog to find "lost" commits
git reflog

# Try batch revert
git checkout main
git revert --no-commit HEAD~2..HEAD
# This stages reverts for the last 2 commits without committing yet

# Make a single commit for multiple reverts
git commit -m "Batch revert of last 2 commits"
``` 