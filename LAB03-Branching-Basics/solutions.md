# LAB03 - Solutions: Branching Basics

Here are the solutions to the exercises:

## Task 1: Initialize a Repository
```bash
# Create directory and initialize repository
mkdir git-branching-lab
cd git-branching-lab
git init

# Create app.py with initial content
cat > app.py << EOF
def main():
    return "Main branch"

print(main())
EOF

# Make initial commit
git add app.py
git commit -m "Initial commit with main() function"
```

## Task 2: Create and Work on Feature Branch
```bash
# Create and switch to feature-login branch
git checkout -b feature-login

# Modify app.py to add login function
cat > app.py << EOF
def main():
    return "Main branch"

def login():
    return "User logged in"

print(main())
print(login())
EOF

# Commit the changes
git add app.py
git commit -m "Add login function on feature-login branch"
```

## Task 3: Create Another Feature Branch
```bash
# Switch back to main branch
git checkout main

# Create and switch to feature-dashboard branch
git checkout -b feature-dashboard

# Modify app.py to add dashboard function
cat > app.py << EOF
def main():
    return "Main branch"

def show_dashboard():
    return "Dashboard displayed"

print(main())
print(show_dashboard())
EOF

# Commit changes
git add app.py
git commit -m "Add show_dashboard function on feature-dashboard branch"
```

## Task 4: Update Main Branch
```bash
# Switch back to main branch
git checkout main

# Modify app.py to add logout function
cat > app.py << EOF
def main():
    return "Main branch"

def logout():
    return "User logged out"

print(main())
print(logout())
EOF

# Commit changes
git add app.py
git commit -m "Add logout function on main branch"
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
cat app.py
# Output should contain both login() and logout() functions
```

## Task 6: Create a Merge Conflict
```bash
# Still on main branch, modify the first line
cat > app.py << EOF
def main():
    return "Updated main branch"

def login():
    return "User logged in"

def logout():
    return "User logged out"

print(main())
print(login())
print(logout())
EOF

# Commit the change
git add app.py
git commit -m "Update main function return value on main branch"

# Switch to feature-dashboard
git checkout feature-dashboard

# Modify the same line to create conflict
cat > app.py << EOF
def main():
    return "Dashboard branch"

def show_dashboard():
    return "Dashboard displayed"

print(main())
print(show_dashboard())
EOF

# Commit the change
git add app.py
git commit -m "Update main function return value on dashboard branch"

# Switch back to main
git checkout main

# Try to merge feature-dashboard (will cause conflict)
git merge feature-dashboard
# Will see an error message about merge conflict
```

## Task 7: Resolve the Merge Conflict
```bash
# Open app.py to see conflict markers
# It will look something like this:
# <<<<<<< HEAD
# def main():
#     return "Updated main branch"
# =======
# def main():
#     return "Dashboard branch"
# >>>>>>> feature-dashboard

# Edit app.py to resolve the conflict
cat > app.py << EOF
def main():
    return "Updated main branch with dashboard support"

def login():
    return "User logged in"

def logout():
    return "User logged out"

def show_dashboard():
    return "Dashboard displayed"

print(main())
print(login())
print(logout())
print(show_dashboard())
EOF

# Add the resolved file and complete the merge
git add app.py
git commit -m "Merge feature-dashboard and resolve conflict in main function"
```

## Task 8: Visualize Your Branches
```bash
# Visualize branches with graph
git log --graph --oneline --all

# Create BRANCHES.md file
cat > BRANCHES.md << EOF
# Branch Structure and Merge Process

## Branches Created

1. **main**: The default branch containing the core application functionality.
   - Contains the main(), login(), logout(), and show_dashboard() functions
   - Serves as the integration branch for all features

2. **feature-login**: A feature branch for implementing user authentication.
   - Added the login() function
   - Merged into main without conflicts

3. **feature-dashboard**: A feature branch for implementing the dashboard UI.
   - Added the show_dashboard() function
   - Created a conflict with main when merging
   - Successfully resolved conflict and merged

## Merging Process

1. **feature-login merge**: This was a simple fast-forward or recursive merge without conflicts.

2. **feature-dashboard merge**: This resulted in a conflict in the main() function that needed to be resolved manually:
   - Main branch had updated the return value to "Updated main branch"
   - Dashboard branch had updated it to "Dashboard branch"
   - Resolved by combining both changes to "Updated main branch with dashboard support"
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

# Try to delete feature-dashboard (should work if properly merged)
git branch -d feature-dashboard
``` 