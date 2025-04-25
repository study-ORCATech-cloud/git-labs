# LAB11 - Solutions: Git Hooks

Here are the solutions to the exercises:

## Task 1: Create a Test Repository
```bash
# Create a new directory and navigate into it
mkdir git-hooks-lab
cd git-hooks-lab

# Initialize a Git repository
git init

# Create a sample Python file
cat > sample.py << 'EOF'
print("Hello from Git hooks lab!")
EOF

# Add and commit the file
git add sample.py
git commit -m "Initial commit with sample Python file"
```

## Task 2: Explore Git Hooks Directory
```bash
# Navigate to the hooks directory
cd .git/hooks

# List the sample hook files
ls -l

# Examine a sample hook file
cat pre-commit.sample

# Return to the repository root
cd ../..
```

## Task 3: Create a Simple Pre-commit Hook
```bash
# Create a new pre-commit hook file
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash

echo "==============================================="
echo "Running pre-commit hook. Checking your changes..."
echo "==============================================="

# This is a simple hook that just prints a message
echo "Pre-commit hook executed successfully!"
echo "Proceeding with commit..."
EOF

# Make the hook executable
chmod +x .git/hooks/pre-commit

# Test the hook by making a change and committing
echo "# Additional comment" >> sample.py
git add sample.py
git commit -m "Test pre-commit hook"
```

## Task 4: Create a Python Linting Pre-commit Hook
```bash
# Install flake8 (if not already installed)
pip install flake8

# Modify the pre-commit hook to include linting
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash

echo "==============================================="
echo "Running pre-commit hook. Checking your changes..."
echo "==============================================="

# Find all staged Python files
files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.py$')

if [ -n "$files" ]; then
    echo "Checking Python files with flake8..."
    
    # Run flake8 on all staged Python files
    echo "$files" | xargs flake8
    
    # Check if flake8 found any issues
    if [ $? -ne 0 ]; then
        echo "❌ Flake8 found issues in your code. Please fix them before committing."
        exit 1
    else
        echo "✅ Flake8 check passed!"
    fi
else
    echo "No Python files to check."
fi

echo "Pre-commit hook executed successfully!"
echo "Proceeding with commit..."
EOF

# Make the hook executable
chmod +x .git/hooks/pre-commit

# Test with clean code
git add sample.py
git commit -m "Test with clean code"

# Test with code that has linting issues
cat > sample.py << 'EOF'
# This line is fine
print("Hello from Git hooks lab!")

# This line has extra spaces at the end     
x = 5   
if x == 5:
    print("x is 5")
else:
    print("x is not 5")
EOF

git add sample.py
# This commit should fail due to linting issues
git commit -m "Test with linting issues"

# Fix the issues and try again
cat > sample.py << 'EOF'
# This line is fine
print("Hello from Git hooks lab!")

# Fixed the extra spaces
x = 5
if x == 5:
    print("x is 5")
else:
    print("x is not 5")
EOF

git add sample.py
git commit -m "Fixed linting issues"
```

## Task 5: Create a Commit Message Validation Hook
```bash
# Create a commit-msg hook
cat > .git/hooks/commit-msg << 'EOF'
#!/bin/bash

commit_msg_file=$1
commit_msg=$(cat "$commit_msg_file")

# Define validation rules:
# 1. Message must be at least 10 characters long
# 2. Message must start with a capital letter
# 3. Message must not end with a period

# Check message length
if [ ${#commit_msg} -lt 10 ]; then
    echo "❌ Commit message too short. Must be at least 10 characters."
    exit 1
fi

# Check first letter is capitalized
first_char=$(echo "$commit_msg" | cut -c1)
if ! [[ "$first_char" =~ [A-Z] ]]; then
    echo "❌ Commit message must start with a capital letter."
    exit 1
fi

# Check message doesn't end with a period
last_char=$(echo "$commit_msg" | rev | cut -c1)
if [ "$last_char" == "." ]; then
    echo "❌ Commit message should not end with a period."
    exit 1
fi

echo "✅ Commit message validation passed!"
exit 0
EOF

# Make the hook executable
chmod +x .git/hooks/commit-msg

# Test with valid commit message
echo "# Another change" >> sample.py
git add sample.py
git commit -m "Added comment to sample file"

# Test with invalid commit message (too short)
echo "# Yet another change" >> sample.py
git add sample.py
git commit -m "Short"

# Test with invalid commit message (no capital letter)
git commit -m "added more content to the file"

# Test with invalid commit message (ends with period)
git commit -m "Added more content to the file."

# Test with valid commit message
git commit -m "Added more content to the sample file"
```

## Task 6: Create a Post-commit Hook
```bash
# Create a post-commit hook
cat > .git/hooks/post-commit << 'EOF'
#!/bin/bash

echo "==============================================="
echo "Post-commit hook executed"
echo "==============================================="

# Get the latest commit details
commit_hash=$(git rev-parse HEAD)
commit_author=$(git log -1 --format="%an <%ae>")
commit_date=$(git log -1 --format="%ad" --date=local)
commit_message=$(git log -1 --format="%s")

echo "Commit completed successfully!"
echo "Details:"
echo "  Hash:      $commit_hash"
echo "  Author:    $commit_author"
echo "  Date:      $commit_date"
echo "  Message:   $commit_message"
echo ""
echo "Total commits in repository: $(git rev-list --count HEAD)"
echo "==============================================="
EOF

# Make the hook executable
chmod +x .git/hooks/post-commit

# Test the post-commit hook by making a commit
echo "# Testing post-commit hook" >> sample.py
git add sample.py
git commit -m "Testing post-commit hook functionality"
```

## Task 7: Work with Pre-push Hook
```bash
# Create a pre-push hook
cat > .git/hooks/pre-push << 'EOF'
#!/bin/bash

echo "==============================================="
echo "Running pre-push hook"
echo "==============================================="

# Simple test to check Python files
echo "Running tests on all Python files..."

# Find all Python files in the repository
files=$(find . -name "*.py" | grep -v "__pycache__" | grep -v ".git")

# Check if there are any Python files to test
if [ -z "$files" ]; then
    echo "No Python files found to test."
    exit 0
fi

# Check if files can be executed without syntax errors
for file in $files; do
    echo "Checking $file..."
    python -m py_compile "$file"
    if [ $? -ne 0 ]; then
        echo "❌ Error: Python file $file has syntax errors!"
        exit 1
    fi
done

echo "✅ All Python files compiled successfully!"
echo "Proceeding with push..."
EOF

# Make the hook executable
chmod +x .git/hooks/pre-push

# Test the pre-push hook
# Create a remote repository (simulated local one in this case)
mkdir ../remote-repo
cd ../remote-repo
git init --bare
cd ../git-hooks-lab

# Add the remote
git remote add origin ../remote-repo

# Try to push (should succeed if all files are valid)
git push -u origin main

# Now create a file with syntax error
cat > broken.py << 'EOF'
# This Python file has a syntax error
print("This line is fine")
if True
    print("This line has a missing colon after the if statement")
EOF

git add broken.py
git commit -m "Added file with syntax error"

# Try to push (should fail)
git push origin main

# Fix the file
cat > broken.py << 'EOF'
# This Python file is now fixed
print("This line is fine")
if True:
    print("This line now has the correct syntax")
EOF

git add broken.py
git commit -m "Fixed syntax error in Python file"

# Try to push again (should succeed)
git push origin main
```

## Task 8: Create a Hook to Prevent Direct Commits to Main
```bash
# Create or modify the pre-commit hook
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash

echo "==============================================="
echo "Running pre-commit hook. Checking your changes..."
echo "==============================================="

# Get the current branch name
branch=$(git symbolic-ref --short HEAD)

# Check if we're on the main branch
if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    echo "❌ Error: Direct commits to the $branch branch are not allowed!"
    echo "Please create a feature branch and use pull requests."
    exit 1
fi

# Find all staged Python files
files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.py$')

if [ -n "$files" ]; then
    echo "Checking Python files with flake8..."
    
    # Run flake8 on all staged Python files
    echo "$files" | xargs flake8
    
    # Check if flake8 found any issues
    if [ $? -ne 0 ]; then
        echo "❌ Flake8 found issues in your code. Please fix them before committing."
        exit 1
    else
        echo "✅ Flake8 check passed!"
    fi
else
    echo "No Python files to check."
fi

echo "Pre-commit hook executed successfully!"
echo "Proceeding with commit..."
EOF

# Make the hook executable
chmod +x .git/hooks/pre-commit

# Test by trying to commit directly to main
echo "# Testing branch restriction" >> sample.py
git add sample.py
git commit -m "Testing branch restriction on main branch"

# Create and switch to a feature branch
git checkout -b feature/update-sample
echo "# Adding feature branch content" >> sample.py
git add sample.py
git commit -m "Adding content on feature branch"

# The commit on the feature branch should be allowed
```

## Bonus Task
```bash
# Create a script to install hooks
cat > install-hooks.sh << 'EOF'
#!/bin/bash

# Define the source directory where your hook templates are stored
HOOKS_DIR="$HOME/.git-hooks"

# Create global hooks directory if it doesn't exist
mkdir -p $HOOKS_DIR

# Create a pre-commit hook template
cat > $HOOKS_DIR/pre-commit << 'HOOK'
#!/bin/bash

echo "==============================================="
echo "Running pre-commit hook from global template"
echo "==============================================="

# Get the current branch name
branch=$(git symbolic-ref --short HEAD)

# Check if we're on the main branch
if [ "$branch" = "main" ] || [ "$branch" = "master" ]; then
    echo "❌ Error: Direct commits to the $branch branch are not allowed!"
    echo "Please create a feature branch and use pull requests."
    exit 1
fi

# Find all staged Python files
files=$(git diff --cached --name-only --diff-filter=ACM | grep '\.py$')

if [ -n "$files" ]; then
    echo "Checking Python files with flake8..."
    
    # Run flake8 on all staged Python files if flake8 is installed
    if command -v flake8 >/dev/null 2>&1; then
        echo "$files" | xargs flake8
        
        # Check if flake8 found any issues
        if [ $? -ne 0 ]; then
            echo "❌ Flake8 found issues in your code. Please fix them before committing."
            exit 1
        else
            echo "✅ Flake8 check passed!"
        fi
    else
        echo "ℹ️ flake8 not installed, skipping Python code check"
    fi
else
    echo "No Python files to check."
fi

echo "Pre-commit hook executed successfully!"
echo "Proceeding with commit..."
HOOK

# Create a post-commit hook template
cat > $HOOKS_DIR/post-commit << 'HOOK'
#!/bin/bash

echo "==============================================="
echo "Post-commit hook executed from global template"
echo "==============================================="

# Get the latest commit details
commit_hash=$(git rev-parse HEAD)
commit_author=$(git log -1 --format="%an <%ae>")
commit_date=$(git log -1 --format="%ad" --date=local)
commit_message=$(git log -1 --format="%s")

echo "Commit completed successfully!"
echo "Details:"
echo "  Hash:      $commit_hash"
echo "  Author:    $commit_author"
echo "  Date:      $commit_date"
echo "  Message:   $commit_message"
echo ""
echo "Total commits in repository: $(git rev-list --count HEAD)"
echo "==============================================="
HOOK

# Make hooks executable
chmod +x $HOOKS_DIR/pre-commit
chmod +x $HOOKS_DIR/post-commit

# Configure Git to use this global hooks directory
git config --global core.hooksPath $HOOKS_DIR

echo "Git global hooks installed and configured successfully!"
echo "Your hooks are located at: $HOOKS_DIR"
echo "All new Git operations will use these hooks."
EOF

# Make the script executable
chmod +x install-hooks.sh

# Run the script to install the global hooks
./install-hooks.sh

# Test the global hooks by creating a new repo
cd ..
mkdir global-hooks-test
cd global-hooks-test
git init
echo "print('Testing global hooks')" > test.py
git add test.py
git commit -m "Testing global hooks functionality"

# Clean up
cd ..
rm -rf git-hooks-lab
rm -rf remote-repo
rm -rf global-hooks-test
``` 