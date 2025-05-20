# LAB11 - Solutions: Git Hooks

Here are the solutions to the exercises:

## Task 1: Create a Test Repository
```bash
# Create a new directory and navigate into it
mkdir git-hooks-lab
cd git-hooks-lab

# Initialize a Git repository
git init

# Create a sample text file
cat > sample.txt << 'EOF'
# Sample text file for Git hooks lab
# This file will be used to test the Git hooks

Welcome to the Git Hooks Lab!
This file will be used to test various Git hooks.

Here's a simple list of items:
  1. First item
  2. Second item
  3. Third item
  4. Fourth item
  5. Fifth item

Project tasks:
- Initialize repository
- Create Git hooks
- Test hook functionality
- Document the process
EOF

# Add and commit the file
git add sample.txt
git commit -m "Initial commit with sample text file"
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
echo "# Additional content" >> sample.txt
git add sample.txt
git commit -m "Test pre-commit hook"
```

## Task 4: Create a Text Validation Pre-commit Hook
```bash
# Modify the pre-commit hook to include text validation
cat > .git/hooks/pre-commit << 'EOF'
#!/bin/bash

echo "==============================================="
echo "Running pre-commit hook. Checking your changes..."
echo "==============================================="

# Find all staged text files
files=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(txt|md)$')

if [ -n "$files" ]; then
    echo "Checking text files for issues..."
    
    # Check for issues in each file
    for file in $files; do
        echo "Checking: $file"
        
        # Check for trailing whitespace
        if grep -q "[[:blank:]]$" "$file"; then
            echo "❌ Error: $file contains trailing whitespace"
            grep -n "[[:blank:]]$" "$file"
            exit 1
        fi
        
        # Check for lines longer than 80 characters
        if grep -q ".\{81,\}" "$file"; then
            echo "❌ Error: $file contains lines longer than 80 characters"
            grep -n ".\{81,\}" "$file"
            exit 1
        fi
        
        # Check for TODO, FIXME, XXX or DEBUG markers
        if grep -q "TODO\|FIXME\|XXX\|DEBUG" "$file"; then
            echo "❌ Error: $file contains TODO, FIXME, XXX or DEBUG markers"
            grep -n "TODO\|FIXME\|XXX\|DEBUG" "$file"
            exit 1
        fi
    done
    
    echo "✅ All text file checks passed!"
else
    echo "No text files to check."
fi

echo "Pre-commit hook executed successfully!"
echo "Proceeding with commit..."
EOF

# Make the hook executable
chmod +x .git/hooks/pre-commit

# Test with clean text
git add sample.txt
git commit -m "Test with clean text"

# Test with text that has issues
cat > sample.txt << 'EOF'
# This line is fine
Welcome to the Git Hooks Lab!

# This line has trailing whitespace   
This file contains intentional errors.

# This line has a TODO marker
TODO: Complete this section later

# This line is too long...........................................................................................................
EOF

git add sample.txt
# This commit should fail due to validation issues
git commit -m "Test with text issues"

# Fix the issues and try again
cat > sample.txt << 'EOF'
# This line is fine
Welcome to the Git Hooks Lab!

# This line no longer has trailing whitespace
This file contains fixed content.

# This line no longer has a TODO marker
Complete this section later

# This line is no longer too long
This line has a reasonable length now.
EOF

git add sample.txt
git commit -m "Fixed text issues"
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
echo "# Another change" >> sample.txt
git add sample.txt
git commit -m "Added comment to sample file"

# Test with invalid commit message (too short)
echo "# Yet another change" >> sample.txt
git add sample.txt
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

# Get information about text files
text_files=$(git show --pretty="" --name-only HEAD | grep -E '\.txt|\.md')
text_file_count=$(echo "$text_files" | grep -v "^$" | wc -l)

echo "Commit completed successfully!"
echo "Details:"
echo "  Hash:      $commit_hash"
echo "  Author:    $commit_author"
echo "  Date:      $commit_date"
echo "  Message:   $commit_message"
echo ""
echo "Text Files Changed: $text_file_count"
if [ "$text_file_count" -gt 0 ]; then
    echo "$text_files"
fi
echo ""
echo "Total commits in repository: $(git rev-list --count HEAD)"
echo "==============================================="
EOF

# Make the hook executable
chmod +x .git/hooks/post-commit

# Test the post-commit hook by making a commit
echo "# Testing post-commit hook" >> sample.txt
git add sample.txt
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

# Simple test to check text files
echo "Validating text files before push..."

# Find all text files in the repository
files=$(find . -name "*.txt" -o -name "*.md" | grep -v ".git")

# Check if there are any text files to validate
if [ -z "$files" ]; then
    echo "No text files found to validate."
    exit 0
fi

# Check for various issues
for file in $files; do
    echo "Checking $file..."
    
    # Check file size (reject files larger than 100KB)
    size=$(stat -c %s "$file" 2>/dev/null || stat -f %z "$file" 2>/dev/null)
    if [ "$size" -gt 102400 ]; then
        echo "❌ Error: File $file is too large (${size} bytes)!"
        echo "   Please keep text files under 100KB."
        exit 1
    fi
    
    # Check for very long lines
    long_lines=$(grep -l '.\{100,\}' "$file")
    if [ -n "$long_lines" ]; then
        echo "⚠️ Warning: File $file contains very long lines"
        echo "   Consider breaking them into shorter lines for readability."
    fi
    
    # Check for trailing whitespace
    trailing_space=$(grep -l '[[:blank:]]$' "$file")
    if [ -n "$trailing_space" ]; then
        echo "⚠️ Warning: File $file contains trailing whitespace"
    fi
done

echo "✅ All text files pass validation!"
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

# Now create a file with issues
cat > problematic.txt << 'EOF'
# This text file has some issues
This line is fine.
This line has trailing whitespace   
This is a very, very, very, very, very, very, very, very, very, very, very, very, very, very, very long line that exceeds our recommended length limit.
EOF

git add problematic.txt
git commit -m "Added file with potential issues"

# Try to push (should succeed with warnings)
git push origin main

# Fix the file
cat > problematic.txt << 'EOF'
# This text file is now fixed
This line is fine.
This line no longer has trailing whitespace
This line is now a reasonable length.
EOF

git add problematic.txt
git commit -m "Fixed issues in text file"

# Try to push again (should succeed without warnings)
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

# Find all staged text files
files=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(txt|md)$')

if [ -n "$files" ]; then
    echo "Checking text files for issues..."
    
    # Check for issues in each file
    for file in $files; do
        echo "Checking: $file"
        
        # Check for trailing whitespace
        if grep -q "[[:blank:]]$" "$file"; then
            echo "❌ Error: $file contains trailing whitespace"
            grep -n "[[:blank:]]$" "$file"
            exit 1
        fi
        
        # Check for lines longer than 80 characters
        if grep -q ".\{81,\}" "$file"; then
            echo "❌ Error: $file contains lines longer than 80 characters"
            grep -n ".\{81,\}" "$file"
            exit 1
        fi
    done
    
    echo "✅ All text file checks passed!"
else
    echo "No text files to check."
fi

echo "Pre-commit hook executed successfully!"
echo "Proceeding with commit..."
EOF

# Make the hook executable
chmod +x .git/hooks/pre-commit

# Test by trying to commit directly to main
echo "# Testing branch restriction" >> sample.txt
git add sample.txt
git commit -m "Testing branch restriction on main branch"

# Create and switch to a feature branch
git checkout -b feature/update-sample
echo "# Adding feature branch content" >> sample.txt
git add sample.txt
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

# Find all staged text files
files=$(git diff --cached --name-only --diff-filter=ACM | grep -E '\.(txt|md)$')

if [ -n "$files" ]; then
    echo "Checking text files for issues..."
    
    # Check for issues in each file
    for file in $files; do
        echo "Checking: $file"
        
        # Check for trailing whitespace
        if grep -q "[[:blank:]]$" "$file"; then
            echo "❌ Error: $file contains trailing whitespace"
            grep -n "[[:blank:]]$" "$file"
            exit 1
        fi
        
        # Check for lines longer than 80 characters
        if grep -q ".\{81,\}" "$file"; then
            echo "❌ Error: $file contains lines longer than 80 characters"
            grep -n ".\{81,\}" "$file"
            exit 1
        fi
    done
    
    echo "✅ All text file checks passed!"
else
    echo "No text files to check."
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

# Get information about text files
text_files=$(git show --pretty="" --name-only HEAD | grep -E '\.txt|\.md')
text_file_count=$(echo "$text_files" | grep -v "^$" | wc -l)

echo "Commit completed successfully!"
echo "Details:"
echo "  Hash:      $commit_hash"
echo "  Author:    $commit_author"
echo "  Date:      $commit_date"
echo "  Message:   $commit_message"
echo ""
echo "Text Files Changed: $text_file_count"
if [ "$text_file_count" -gt 0 ]; then
    echo "$text_files"
fi
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
echo "This is a test file for global hooks" > test.txt
git add test.txt
git commit -m "Testing global hooks functionality"

# Clean up
cd ..
rm -rf git-hooks-lab
rm -rf remote-repo
rm -rf global-hooks-test
``` 