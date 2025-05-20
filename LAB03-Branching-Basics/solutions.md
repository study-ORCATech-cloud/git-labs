# LAB03 - Solutions: Branching Basics

Here are the solutions to the exercises:

## Task 1: Initialize a Repository
```bash
# Create directory and initialize repository
mkdir git-branching-lab
cd git-branching-lab
git init

# Create app.txt with initial content
cat > app.txt << EOF
MAIN BRANCH
EOF

# Make initial commit
git add app.txt
git commit -m "Initial commit with main branch text"
```

## Task 2: Create and Work on Feature Branch
```bash
# Create and switch to feature-login branch
git checkout -b feature-login

# Modify app.txt to add login section
cat > app.txt << EOF
MAIN BRANCH

LOGIN FEATURE
User can now log in
EOF

# Commit the changes
git add app.txt
git commit -m "Add login feature section on feature-login branch"
```

## Task 3: Create Another Feature Branch
```bash
# Switch back to main branch
git checkout main

# Create and switch to feature-dashboard branch
git checkout -b feature-dashboard

# Modify app.txt to add dashboard section
cat > app.txt << EOF
MAIN BRANCH

DASHBOARD FEATURE
Dashboard now displays user data
EOF

# Commit changes
git add app.txt
git commit -m "Add dashboard feature section on feature-dashboard branch"
```

## Task 4: Update Main Branch
```bash
# Switch back to main branch
git checkout main

# Modify app.txt to add logout section
cat > app.txt << EOF
MAIN BRANCH

LOGOUT FEATURE
User can now log out
EOF

# Commit changes
git add app.txt
git commit -m "Add logout feature section on main branch"
```

## Task 5: Merge Feature-Login
```bash
# Make sure we're on main branch
git checkout main

# Merge feature-login into main
git merge feature-login

# The merge will create a merge commit if there were no conflicts
# If Git opens an editor for the merge commit message, save and exit

# Verify the result
cat app.txt
# Output should contain both LOGIN FEATURE and LOGOUT FEATURE sections
```

## Task 6: Create a Merge Conflict
```bash
# Still on main branch, modify the first line
cat > app.txt << EOF
UPDATED MAIN BRANCH

LOGIN FEATURE
User can now log in

LOGOUT FEATURE
User can now log out
EOF

# Commit the change
git add app.txt
git commit -m "Update main branch text on first line"

# Switch to feature-dashboard
git checkout feature-dashboard

# Modify the same line to create conflict
cat > app.txt << EOF
DASHBOARD BRANCH

DASHBOARD FEATURE
Dashboard now displays user data
EOF

# Commit the change
git add app.txt
git commit -m "Update first line on dashboard branch"

# Switch back to main
git checkout main

# Try to merge feature-dashboard (will cause conflict)
git merge feature-dashboard
# Will see an error message about merge conflict
```

## Task 7: Resolve the Merge Conflict
```bash
# Open app.txt to see conflict markers
# It will look something like this:
# <<<<<<< HEAD
# UPDATED MAIN BRANCH
# =======
# DASHBOARD BRANCH
# >>>>>>> feature-dashboard

# Edit app.txt to resolve the conflict
cat > app.txt << EOF
UPDATED MAIN BRANCH WITH DASHBOARD SUPPORT

LOGIN FEATURE
User can now log in

LOGOUT FEATURE
User can now log out

DASHBOARD FEATURE
Dashboard now displays user data
EOF

# Add the resolved file and complete the merge
git add app.txt
git commit -m "Merge feature-dashboard and resolve conflict in first line"
```

## Task 8: Visualize Your Branches
```bash
# Visualize branches with graph
git log --graph --oneline --all

# Create BRANCHES.md file
cat > BRANCHES.md << EOF
# Branch Structure and Merge Process

## Branches Created

1. **main**: The default branch containing the core application content.
   - Contains the main text and logout, login, and dashboard feature sections
   - Serves as the integration branch for all features

2. **feature-login**: A feature branch for implementing user authentication.
   - Added the LOGIN FEATURE section
   - Merged into main without conflicts

3. **feature-dashboard**: A feature branch for implementing the dashboard UI.
   - Added the DASHBOARD FEATURE section
   - Created a conflict with main when merging
   - Successfully resolved conflict and merged

## Merging Process

1. **feature-login merge**: This was a simple fast-forward or recursive merge without conflicts.

2. **feature-dashboard merge**: This resulted in a conflict in the first line that needed to be resolved manually:
   - Main branch had updated the text to "UPDATED MAIN BRANCH"
   - Dashboard branch had updated it to "DASHBOARD BRANCH"
   - Resolved by combining both changes to "UPDATED MAIN BRANCH WITH DASHBOARD SUPPORT"
   - Created a merge commit to finalize the resolution

## Visualization

Running \`git log --graph --oneline --all\` shows how the branches diverged and were merged back together.
EOF

# Commit BRANCHES.md
git add BRANCHES.md
git commit -m "Add BRANCHES.md documenting branch structure and merge process"
```

## Bonus Task
```bash
# See detailed branch information
git branch -v

# See which branches are merged into current branch
git branch --merged

# Delete the feature-login branch which is fully merged
git branch -d feature-login
``` 