# LAB04 - Solutions: Reset vs Revert

Here are the solutions to the exercises:

## Task 1: Setup Project with Multiple Commits
```bash
# Create directory and initialize repository
mkdir git-reset-revert-lab
cd git-reset-revert-lab
git init

# Create app.py with Version 1
cat > app.py << EOF
def get_version():
    return "Version 1"

print(get_version())
EOF

# Make initial commit
git add app.py
git commit -m "v1: Initial commit with Version 1"

# Update to Version 2
cat > app.py << EOF
def get_version():
    return "Version 2"

print(get_version())
EOF

# Commit Version 2
git commit -am "v2: Update to Version 2"

# Update to Version 3
cat > app.py << EOF
def get_version():
    return "Version 3"

print(get_version())
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
cat app.py
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
cat > app.py << EOF
def get_version():
    return "Version 4 - Remote"

print(get_version())
EOF

git commit -am "v4: Update for remote demo"

# Pretend this is pushed to remote
echo "# This branch has been 'pushed' to a shared repository" >> app.py
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

- **Git Reset**: NEVER use reset for changes that have been pushed to a shared repository. 
  This will cause conflicts for other team members because you're rewriting history 
  that others depend on.

- **Git Revert**: ALWAYS use revert for undoing changes that have been pushed. 
  Revert creates a new commit that undoes previous changes while preserving history,
  which is safe for all team members working with the repository.

**Rule of thumb**: Only use reset for local, unpushed changes. Always use revert for shared changes.
EOF

git add COMPARISON.md
git commit -m "Update comparison with remote repository best practices"
```

## Task 6: Revert a Merge Commit
```bash
# Start from main branch
git checkout main

# Create feature branches
git checkout -b feature-x
cat > app.py << EOF
def get_version():
    return "Version 3 - Feature X"

def feature_x():
    return "This is feature X"

print(get_version())
print(feature_x())
EOF
git commit -am "Implement Feature X"

git checkout main
git checkout -b feature-y
cat > app.py << EOF
def get_version():
    return "Version 3 - Feature Y"

def feature_y():
    return "This is feature Y"

print(get_version())
print(feature_y())
EOF
git commit -am "Implement Feature Y"

# Switch to main and merge feature-x with a merge commit
git checkout main
git merge feature-x --no-ff -m "Merge feature-x into main"

# Check the log to get the merge commit hash
git log --oneline
# Example: a1b2c3d Merge feature-x into main

# Revert the merge commit
git revert -m 1 a1b2c3d

# Document the process
cat > MERGE-REVERT.md << EOF
# Reverting Merge Commits

## The Process

1. Created two feature branches: \`feature-x\` and \`feature-y\`
2. Made distinct changes to each branch
3. Merged \`feature-x\` into \`main\` with \`--no-ff\` to create a merge commit
4. Used \`git revert -m 1 <merge-commit-hash>\` to revert the merge

## Understanding the Command

- \`git revert -m 1 <merge-commit-hash>\`:
  - \`-m 1\` specifies which parent to revert to (mainline)
  - \`1\` refers to the first parent (the branch we merged into - main)
  - \`2\` would refer to the second parent (the branch we merged from - feature-x)

## Important Notes

- Reverting a merge creates a new commit that undoes all the changes from the merged branch
- After reverting a merge, if you want to re-merge the same branch later, you'll need to:
  1. Revert the revert commit (to prevent duplicate conflict resolution)
  2. Then merge the branch again
- Use this approach cautiously as it can create complex history trees
EOF

git add MERGE-REVERT.md
git commit -m "Add documentation on reverting merge commits"
```

## Bonus Task
```bash
# Explore Git reflog
git reflog

# Example of recovering lost commits
# (This is a demonstration assuming a commit was lost via hard reset)
git checkout some-branch
git reset --hard HEAD~3  # This would "lose" 3 commits
git reflog  # See the lost commits and their hashes
git reset --hard HEAD@{2}  # Recover to a specific point in reflog

# Batching multiple reverts
git checkout main
git revert --no-commit HEAD~2
git revert --no-commit HEAD~1
git revert --no-commit HEAD
git status  # Review the combined changes
git commit -m "Revert the last three commits in one go"
``` 