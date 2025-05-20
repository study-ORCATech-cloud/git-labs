# LAB05 - Solutions: Stashing & Tagging

Here are the solutions to the exercises:

## Task 1: Setup a Basic Repository
```bash
# Create directory and initialize repository
mkdir git-stash-tag-lab
cd git-stash-tag-lab
git init

# Create feature.txt with initial content
cat > feature.txt << EOF
FEATURE: Initial version
EOF

# Make initial commit
git add feature.txt
git commit -m "Initial commit with base feature"
```

## Task 2: Working with Git Stash
```bash
# Modify feature.txt with incomplete feature
cat > feature.txt << EOF
FEATURE: Initial version

NEW FEATURE: Work in progress
This section isn't ready to commit yet
EOF

# Stash the changes
git stash

# Verify working directory is clean
git status

# Create a hotfix branch
git checkout -b hotfix

# Fix the feature line
cat > feature.txt << EOF
FEATURE: Fixed version

EOF

# Commit the hotfix
git add feature.txt
git commit -m "Fix feature text"

# Switch back to main/master branch
git checkout main  # or git checkout master

# Apply stashed changes
git stash apply

# Examine the file (should have both fixed text and incomplete new feature)
cat feature.txt

# Remove the stash from stash list
git stash drop
```

## Task 3: Using Stash with Multiple Changes
```bash
# Make two different changes to feature.txt
cat > feature.txt << EOF
COMMENT: This file contains features

FEATURE: Fixed version

NEW FEATURE: Work in progress
This section isn't ready to commit yet

ANOTHER FEATURE: Additional functionality
EOF

# Stash with descriptive message
git stash push -m "Added comment and new feature"

# View stash list
git stash list

# Create and commit utils.txt
cat > utils.txt << EOF
UTILITY: Helper function
This file contains utility functions
EOF

git add utils.txt
git commit -m "Add utilities file"

# Apply and remove the stash
git stash pop

# Commit the reapplied changes
git add feature.txt
git commit -m "Add comment and another feature section"
```

## Task 4: Basic Tagging
```bash
# Create lightweight tag
git tag v0.1

# List all tags
git tag

# Make a change to feature.txt
cat > feature.txt << EOF
COMMENT: This file contains features
Updated for v0.2

FEATURE: Fixed version

NEW FEATURE: Implemented
Now fully implemented

ANOTHER FEATURE: Additional functionality
EOF

# Commit the change
git add feature.txt
git commit -m "Implement new feature"

# Create annotated tag
git tag -a v0.2 -m "Version 0.2 with new feature implementation"

# Examine the tag details
git show v0.2
```

## Task 5: Working with Tags
```bash
# Make more commits
cat > feature.txt << EOF
COMMENT: This file contains features
Updated for next version

FEATURE: Enhanced version

NEW FEATURE: Implemented
Now fully implemented

ANOTHER FEATURE: Enhanced functionality
This feature has been improved
EOF

git commit -am "Enhance features"

# Add one more file
cat > config.txt << EOF
CONFIG: {
    "version": "1.0",
    "api_endpoint": "https://api.example.com"
}
EOF

git add config.txt
git commit -m "Add configuration file"

# Create tag for v1.0
git tag v1.0

# Checkout code at v0.2
git checkout v0.2

# Notice the detached HEAD state message
# Create a branch from this tag
git checkout -b legacy-support

# Modify feature.txt
cat > feature.txt << EOF
COMMENT: This file contains features
Updated for legacy support

FEATURE: Fixed version (legacy)

NEW FEATURE: Implemented with backward compatibility
This feature now works with older systems

ANOTHER FEATURE: Additional functionality
EOF

# Commit the change
git commit -am "Add legacy support modifications"

# Switch back to main/master branch
git checkout main  # or git checkout master

# Verify latest version
cat feature.txt
```

## Task 6: Tag Management
```bash
# Create a tag v1.1
git tag v1.1

# Show tags with descriptions
git tag -n

# Delete local tag v0.1
git tag -d v0.1

# Re-create tag with same name on different commit
git checkout HEAD~2  # Go back two commits
git tag v0.1
git checkout main  # Go back to main

# Document process of deleting remote tags
cat > TAG-NOTES.md << EOF
# Git Tag Management Notes

## Deleting Remote Tags

When you need to delete a tag that has been pushed to a remote repository:

1. First, delete the tag locally:
   \`\`\`bash
   git tag -d <tag_name>
   \`\`\`

2. Then, push the deletion to the remote repository:
   \`\`\`bash
   git push origin :refs/tags/<tag_name>
   \`\`\`
   
   Or use the simpler syntax:
   \`\`\`bash
   git push --delete origin <tag_name>
   \`\`\`

3. Other team members will need to run a fetch with the prune option to update their local copies:
   \`\`\`bash
   git fetch --prune --prune-tags
   \`\`\`
EOF

git add TAG-NOTES.md
git commit -m "Add tag management documentation"
```

## Bonus Task
```bash
# Create a stash for demonstration
cat >> feature.txt << EOF

BONUS FEATURE: Extra functionality
This is a bonus feature
EOF

git stash

# Create branch directly from stash
git stash branch feature-bonus

# You'll notice the branch contains the stashed changes
# Commit the change
git commit -am "Add bonus feature from stash branch"

# Update tag notes with tag differences
cat >> TAG-NOTES.md << EOF

## Differences Between Lightweight and Annotated Tags

| Feature | Lightweight Tag | Annotated Tag |
|---------|----------------|---------------|
| Creation | \`git tag <tag_name>\` | \`git tag -a <tag_name> -m "message"\` |
| Storage | Simply a reference/pointer to a commit | Stored as full objects in the Git database |
| Information | Only contains commit reference | Contains tagger name, email, date, and message |
| Best for | Temporary or private markers | Public releases and version marks |
| \`git show\` output | Shows commit details | Shows tag information followed by commit details |

Annotated tags are preferred for public releases as they contain more metadata and can be signed and verified.
EOF

git add TAG-NOTES.md
git commit -m "Add lightweight vs annotated tag comparison"