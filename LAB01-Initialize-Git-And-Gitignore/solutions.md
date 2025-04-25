# LAB01 - Solutions: Initialize Git & Setup .gitignore

Here are the solutions to the exercises:

## Task 1: Initialize a Git Repository
```bash
mkdir my-first-repo
cd my-first-repo
git init
```

## Task 2: Examine the .git Directory
```bash
ls -la .git
```

Important files/folders in the .git directory:
1. `config` - Repository-specific configuration
2. `HEAD` - Reference to the current branch
3. `objects/` - Database of all content
4. `refs/` - Pointers to commit objects (branches and tags)
5. `hooks/` - Scripts that can be executed at specific Git events

## Task 3: Create Project Files
```bash
# Create app.py
echo 'print("Hello, Git World!")' > app.py

# Create notes.txt
cat > notes.txt << EOF
Git Notes:
- Git is a distributed version control system
- Created by Linus Torvalds in 2005
- Helps track changes in files and coordinate work among developers
EOF
```

## Task 4: Create a .gitignore File
```bash
cat > .gitignore << EOF
# Python cache files
__pycache__/
*.pyc

# Log files
*.log

# Temporary files
temp_files/

# Sensitive files
credentials.txt
EOF
```

## Task 5: Check Status and Make First Commit
```bash
git status
git add .gitignore app.py notes.txt
git commit -m "Initial commit: Add Python app, notes and gitignore"
```

## Task 6: Verify Your Setup
```bash
# Create a file that should be ignored
echo "ERROR: Something went wrong" > debug.log
mkdir temp_files
echo "temporary content" > temp_files/temp.txt
echo "username=admin" > credentials.txt

# Check if files are being ignored
git status
```
The output should not show debug.log, the temp_files directory, or credentials.txt.

## Task 7: Document What You've Learned
```bash
cat > LEARNINGS.md << EOF
# Git Learnings

- The .git directory contains all the information and history for the repository
- .gitignore helps prevent unwanted files from being tracked by Git
- Git has a staging area (index) where changes are prepared before committing
EOF

git add LEARNINGS.md
git commit -m "Add learnings from Git initialization"
```

## Bonus Task
```bash
git config user.name "Your Name"
git config user.email "your.email@example.com"

# To verify the configuration
git config user.name
git config user.email
```

This sets the configuration for the current repository only. To set globally, add the `--global` flag. 