# LAB02 - Solutions: Commit & History

Here are the solutions to the exercises:

## Task 1: Create Project & Initial Commit
```bash
# Create directory and initialize repository
mkdir git-history-lab
cd git-history-lab
git init

# Create main.py with initial content
echo 'print("Hello from Version 1")' > main.py

# Make initial commit
git add main.py
git commit -m "Initial commit: Add main.py with Version 1"
```

## Task 2: Make Multiple Commits
```bash
# Update main.py with greeting function
cat > main.py << EOF
def greet(name):
    return f"Hello, {name}!"

print("Hello from Version 2")
print(greet("Git User"))
EOF

# Commit the greeting function
git add main.py
git commit -m "Add greeting function to main.py"

# Create README.md
cat > README.md << EOF
# Git History Lab

A simple Python project for learning Git commit history and version tracking.

This project demonstrates:
- Basic Git commands
- Commit history tracking
- Comparing versions with diff
EOF

# Commit README
git add README.md
git commit -m "Add project README with description"

# Update main.py with sum function
cat > main.py << EOF
def greet(name):
    return f"Hello, {name}!"

def sum_numbers(a, b):
    return a + b

print("Hello from Version 3")
print(greet("Git User"))
print(f"Sum of 5 and 7 is: {sum_numbers(5, 7)}")
EOF

# Commit the sum function
git add main.py
git commit -m "Add sum_numbers function to main.py"
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
echo "# This line will be uncommitted" >> main.py

# View uncommitted changes
git diff

# Compare first and last commit
# (Replace these hashes with your actual commit hashes)
git log --oneline
# Example output:
# a1b2c3d Add sum_numbers function to main.py
# e4f5g6h Add project README with description  
# i7j8k9l Add greeting function to main.py
# m0n1o2p Initial commit: Add main.py with Version 1

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

1. \`m0n1o2p\` - Initial commit: Add main.py with Version 1
   Created the project with a basic Python file.

2. \`i7j8k9l\` - Add greeting function to main.py
   Added functionality to greet users by name.

3. \`e4f5g6h\` - Add project README with description
   Added documentation explaining the project purpose.

4. \`a1b2c3d\` - Add sum_numbers function to main.py
   Added numerical calculation functionality.

*Note: Replace the commit hashes above with your actual hashes.*
EOF

# Commit HISTORY.md
git add HISTORY.md
git commit -m "Add HISTORY.md documenting our commit progression"
```

## Bonus Task
```bash
# See who changed each line of main.py
git blame main.py

# Summary of commits by author
git shortlog

# Summary with commit count by author
git shortlog -sn
```

Note: In a real scenario, you would see different authors if working as a team. Since this is your individual lab, all commits will likely show your name as the author. 