# LAB08 - Solutions: Forks & Upstream Syncing

Here are the solutions to the exercises:

## Task 1: Find a Repository to Fork
```
1. Go to GitHub and search for a repository to fork.
   - For this example, we'll use https://github.com/octocat/Spoon-Knife
   - This is a simple test repository maintained by GitHub for learning purposes

2. Examine the repository:
   - It has a simple README
   - A few files to practice with
   - An existing history of commits
```

## Task 2: Fork the Repository
```
1. Go to the repository page (https://github.com/octocat/Spoon-Knife)
2. Click the "Fork" button in the top-right corner
3. If prompted, select your GitHub account as the destination
4. Wait for GitHub to create your fork (usually takes just a few seconds)
5. You'll be redirected to your fork - the URL will now be:
   https://github.com/your-username/Spoon-Knife
   
6. Notice that GitHub indicates it's a fork with text like "forked from octocat/Spoon-Knife"
```

## Task 3: Clone Your Fork Locally
```bash
# Copy the URL of your fork (HTTPS or SSH, depending on your setup)
# For example: https://github.com/your-username/Spoon-Knife.git

# Clone the repository
git clone https://github.com/your-username/Spoon-Knife.git

# Navigate into the repository directory
cd Spoon-Knife
```

## Task 4: Add the Upstream Repository
```bash
# Add the original repository as "upstream"
git remote add upstream https://github.com/octocat/Spoon-Knife.git

# Verify your remotes
git remote -v

# Output should look like:
# origin    https://github.com/your-username/Spoon-Knife.git (fetch)
# origin    https://github.com/your-username/Spoon-Knife.git (push)
# upstream  https://github.com/octocat/Spoon-Knife.git (fetch)
# upstream  https://github.com/octocat/Spoon-Knife.git (push)
```

## Task 5: Make and Publish Changes to Your Fork
```bash
# Create a new branch for your changes
git checkout -b add-my-contribution

# Make a change to a file
# For example, add your name to contributors or modify README.md
echo "- @your-username - Added during Git fork learning lab" >> CONTRIBUTORS.md

# If the file doesn't exist, create it:
if [ ! -f CONTRIBUTORS.md ]; then
  echo "# Contributors\n\nPeople who have contributed to this repository:\n" > CONTRIBUTORS.md
  echo "- @your-username - Added during Git fork learning lab" >> CONTRIBUTORS.md
fi

# Commit the change
git add CONTRIBUTORS.md
git commit -m "Add myself to contributors list"

# Push the branch to your fork
git push origin add-my-contribution
```

## Task 6: Create a Pull Request (Optional)
```
1. Go to your fork on GitHub (https://github.com/your-username/Spoon-Knife)
2. You might see a notification about your recently pushed branch with a "Compare & pull request" button
   - If you don't see this, click on "Contribute" and then "Open pull request"

3. Ensure the base repository is set to "octocat/Spoon-Knife" and base branch is "main"
4. Ensure the head repository is set to "your-username/Spoon-Knife" and compare branch is "add-my-contribution"

5. Add a title: "Add myself to contributors"
6. Add a description: "This PR adds my username to the contributors list as part of learning about GitHub forks and pull requests."

7. Click "Create pull request"

Note: For the octocat/Spoon-Knife repository, the maintainers might not accept new PRs regularly since it's a learning repo.
```

## Task 7: Sync with the Upstream Repository
```bash
# Make sure you're on your main branch
git checkout main

# Fetch all changes from the upstream repository
git fetch upstream

# Check what changes exist in upstream
git diff upstream/main

# Merge the changes from upstream's main branch into your local main branch
git merge upstream/main

# If there are no conflicts, the merge will complete automatically
# Push the updated main branch to your fork
git push origin main
```

## Task 8: Resolve a Merge Conflict with Upstream
```bash
# Create a conflict by editing a file
# For example, modify the README.md
echo "# My Additional Notes" >> README.md
echo "This is my fork of the Spoon-Knife repository" >> README.md

# Commit and push to your fork's main branch
git add README.md
git commit -m "Add notes to README"
git push origin main

# Now simulate a change to the same file in the upstream repository
# (Since we don't have direct access to the upstream repo, we'll simulate this locally)

# Create a temporary branch based on upstream
git checkout -b temp-upstream upstream/main

# Make conflicting changes
echo "# Official Notes" >> README.md
echo "This is the official Spoon-Knife repository" >> README.md

# Commit these changes
git add README.md
git commit -m "Simulate upstream changes"

# Force push this to a temporary branch on your fork (to simulate upstream)
git push -f origin temp-upstream

# Switch back to main
git checkout main

# Now pretend temp-upstream is actually the upstream main
# Fetch all changes
git fetch origin

# Try to merge the simulated upstream changes
git merge origin/temp-upstream

# This will likely cause a conflict that looks like:
# Auto-merging README.md
# CONFLICT (content): Merge conflict in README.md
# Automatic merge failed; fix conflicts and then commit the result.

# Open README.md in your editor and resolve the conflict
# The file will have conflict markers like:
# <<<<<<< HEAD
# # My Additional Notes
# This is my fork of the Spoon-Knife repository
# =======
# # Official Notes
# This is the official Spoon-Knife repository
# >>>>>>> origin/temp-upstream

# Edit the file to keep both changes in a sensible way:
# # Spoon-Knife Repository Notes
# 
# ## My Additional Notes
# This is my fork of the Spoon-Knife repository
# 
# ## Official Notes
# This is the official Spoon-Knife repository

# Add the resolved file
git add README.md

# Complete the merge
git commit -m "Merge simulated upstream changes and resolve conflicts"

# Push the resolved merge to your fork
git push origin main

# Cleanup: delete the temporary branch
git branch -D temp-upstream
git push origin --delete temp-upstream
```

## Bonus Task
```bash
# Create a second fork of a different repository
# For example, fork https://github.com/github/gitignore

# Clone your new fork
git clone https://github.com/your-username/gitignore.git
cd gitignore

# Create a GitHub Action workflow file
mkdir -p .github/workflows
cat > .github/workflows/sync-upstream.yml << EOF
name: Sync Fork with Upstream

on:
  schedule:
    - cron: '0 0 * * *'  # Run daily at midnight
  workflow_dispatch:     # Allow manual trigger

jobs:
  sync:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
      
      - name: Add Upstream
        run: |
          git remote add upstream https://github.com/github/gitignore.git
          git fetch upstream
      
      - name: Sync Fork
        run: |
          git checkout main
          git merge upstream/main
          git push origin main
EOF

# Document the setup
cat > SYNC_SETUP.md << EOF
# Automated Fork Synchronization

This document explains how I set up automated synchronization between this fork and the upstream repository.

## Setup Process

1. Created a GitHub Actions workflow file at \`.github/workflows/sync-upstream.yml\`
2. Configured the workflow to run:
   - On a daily schedule (midnight UTC)
   - Manually when triggered through the GitHub UI

3. The workflow performs these steps:
   - Checks out the repository
   - Adds the upstream repository as a remote
   - Fetches changes from upstream
   - Merges upstream changes into the main branch
   - Pushes the updated main branch to the fork

## Testing the Automation

To manually trigger the workflow:
1. Go to the 'Actions' tab in this repository
2. Select the 'Sync Fork with Upstream' workflow
3. Click 'Run workflow' and select the branch to run it on (usually main)
4. Click the green 'Run workflow' button

## Limitations

- If there are merge conflicts, the automated process will fail
- You will need to resolve conflicts manually when this happens
- The workflow requires GitHub API access, which is provided by default for GitHub Actions
EOF

# Commit and push the workflow file and documentation
git add .github/workflows/sync-upstream.yml SYNC_SETUP.md
git commit -m "Add automated upstream sync workflow and documentation"
git push origin main

# Test the workflow manually:
# 1. Go to your fork on GitHub
# 2. Click the "Actions" tab
# 3. Select "Sync Fork with Upstream" workflow
# 4. Click "Run workflow" dropdown
# 5. Click the green "Run workflow" button
# 6. Wait for the action to complete and verify it worked
``` 