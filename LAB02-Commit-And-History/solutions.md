# LAB02 - Solutions: Commit & History

Here are the solutions to the exercises:

## Task 1: Create Project & Initial Commit
```bash
# Create directory and initialize repository
mkdir git-history-lab
cd git-history-lab
git init

# Create main.txt with initial content
echo 'Version 1' > main.txt

# Make initial commit
git add main.txt
git commit -m "Initial commit: Add main.txt with Version 1"
```

## Task 2: Make Multiple Commits
```bash
# Update main.txt with greeting message
cat > main.txt << EOF
Version 1

Hello, Git User!
Welcome to the Git History Lab!
EOF

# Commit the greeting message
git add main.txt
git commit -m "Add greeting message to main.txt"

# Create README.md
cat > README.md << EOF
# Git History Lab

A simple project for learning Git commit history and version tracking.

This project demonstrates:
- Basic Git commands
- Commit history tracking
- Comparing versions with diff
EOF

# Commit README
git add README.md
git commit -m "Add project README with description"

# Update main.txt with Git commands list
cat > main.txt << EOF
Version 1

Hello, Git User!
Welcome to the Git History Lab!

Git Commands I've Learned:
- git init: Initialize a repository
- git add: Stage changes
- git commit: Save changes to history
- git status: Check current state
- git log: View commit history
EOF

# Commit the Git commands list
git add main.txt
git commit -m "Add list of Git commands to main.txt"
```

## Task 3: Explore Commit History
```bash
# View commit history
git log

# View compact commit history
git log --oneline

# View history with graph and decorations
git log --graph --decorate --all

# View history with date ranges
git log --since="yesterday" --until="now"

# View history with author and changed files
git log --author="Your Name" --name-status
```

## Task 4: Compare Versions
```bash
# Compare working directory with last commit
git diff

# Make a change without committing
echo "# This line will be uncommitted" >> main.txt

# View uncommitted changes
git diff

# Compare first and last commit
# (Replace these hashes with your actual commit hashes)
git log --oneline
# Example output:
# a1b2c3d Add list of Git commands to main.txt
# e4f5g6h Add project README with description  
# i7j8k9l Add greeting message to main.txt
# m0n1o2p Initial commit: Add main.txt with Version 1

git diff m0n1o2p a1b2c3d
```

## Task 5: View Specific Commits
```bash
# Identify second commit hash and show its changes
# (Replace with your actual hash)
git show i7j8k9l

# Use relative reference to show previous commit
git show HEAD~1
```

## Task 6: Annotated History
```bash
# Create HISTORY.md
cat > HISTORY.md << EOF
# Project Commit History

This file documents the progression of commits in this repository:

1. \`m0n1o2p\` - Initial commit: Add main.txt with Version 1
   Created the project with a basic text file.

2. \`i7j8k9l\` - Add greeting message to main.txt
   Added a welcoming message for users.

3. \`e4f5g6h\` - Add project README with description
   Added documentation explaining the project purpose.

4. \`a1b2c3d\` - Add list of Git commands to main.txt
   Added a reference list of Git commands learned.

*Note: Replace the commit hashes above with your actual hashes.*
EOF

# Commit HISTORY.md
git add HISTORY.md
git commit -m "Add HISTORY.md documenting our commit progression"
```

## Bonus Task
```bash
# See who changed each line of main.txt
git blame main.txt

# Summary of commits by author
git shortlog

# Summary with commit count by author
git shortlog -sn
```

Note: In a real scenario, you would see different authors if working as a team. Since this is your individual lab, all commits will likely show your name as the author. 