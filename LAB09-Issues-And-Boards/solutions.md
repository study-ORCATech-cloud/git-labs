# LAB09 - Solutions: Issues & Project Boards

Here are the solutions to the exercises:

## Task 1: Create and Configure a GitHub Repository
```
1. To create a new repository:
   - Go to GitHub.com and sign in
   - Click the "+" icon in the top right corner and select "New repository"
   - Enter "github-issue-tracker" as the repository name
   - Add a description, e.g., "A repository for learning GitHub Issues and Project Boards"
   - Choose whether to make it public or private
   - Check "Add a README file"
   - Click "Create repository"

2. To ensure Issues are enabled:
   - Go to the repository's main page
   - Click "Settings"
   - Scroll down to the "Features" section
   - Make sure "Issues" is checked/enabled
   - If not, check the box and click "Save"

3. To clone the repository locally:
   - From the repository's main page, click the "Code" button
   - Copy the HTTPS or SSH URL
   - In your terminal, run:
   ```bash
   git clone https://github.com/your-username/github-issue-tracker.git
   cd github-issue-tracker
   ```
```

## Task 2: Create Basic Issues
```
1. To create the first issue:
   - Go to the "Issues" tab in your repository
   - Click the green "New issue" button
   - Set the title: "Update README with project description"
   - In the description, add:
   
   ```
   The current README is very basic. We need to update it with:
   
   - A detailed description of the project's purpose
   - Installation instructions
   - Usage examples
   - Contribution guidelines link
   
   This will help new users understand the project better.
   ```
   
   - Click "Submit new issue"

2. To create the second issue:
   - Click "New issue" again
   - Set the title: "Add contributing guidelines"
   - In the description, add:
   
   ```
   We need to create a CONTRIBUTING.md file with guidelines on:
   
   - How to report bugs
   - How to suggest features
   - Code style requirements
   - Pull request process
   
   This will help standardize contributions to the project.
   ```
   
   - Click "Submit new issue"

3. To create the third issue:
   - Click "New issue" again
   - Set the title: "Fix typo in documentation"
   - In the description, add:
   
   ```
   There's a typo in the README.md file:
   
   "Insallation instructions" should be "Installation instructions"
   
   This needs to be fixed to maintain professionalism.
   ```
   
   - Click "Submit new issue"
```

## Task 3: Use Issue Metadata
```
1. To add labels to issues:
   - Open the first issue ("Update README")
   - On the right sidebar, click the gear icon next to "Labels"
   - Select "documentation" and "enhancement"
   - Click outside the dropdown to save
   
   - Open the second issue ("Add contributing guidelines")
   - Add "documentation" label
   
   - Open the third issue ("Fix typo")
   - Add "documentation" and "bug" labels

2. To create a new custom label:
   - Go to the "Issues" tab
   - Click "Labels" button
   - Click "New label"
   - Enter "good first issue" as the name
   - Choose a green color (e.g., #7057ff)
   - Add a description: "Good issues for newcomers to the project"
   - Click "Create label"

3. To apply the new label:
   - Open the "Fix typo in documentation" issue
   - Add the "good first issue" label from the sidebar

4. To assign issues:
   - Open each issue
   - On the right sidebar, click the gear icon next to "Assignees"
   - Select your username
   - Click outside the dropdown to save

5. To create a milestone:
   - Go to the "Issues" tab
   - Click "Milestones"
   - Click "New milestone"
   - Enter "Initial Documentation" as the title
   - Add a description: "First set of documentation improvements for the project"
   - Set a due date two weeks from today
   - Click "Create milestone"

6. To add issues to the milestone:
   - Open each of the documentation-related issues
   - On the right sidebar, click the gear icon next to "Milestone"
   - Select "Initial Documentation"
   - Click outside the dropdown to save
```

## Task 4: Link Issues to Code
```bash
# First make sure you're in your repository directory
cd github-issue-tracker

# Edit the README.md file to fix the typo
# For example, with sed:
sed -i 's/Insallation instructions/Installation instructions/g' README.md
# Or manually edit the file with your preferred editor

# Add, commit with reference to issue number (replace '3' with your actual issue number)
git add README.md
git commit -m "Fix typo in documentation. Closes #3"
git push origin main
```

After pushing, visit the issue on GitHub. You should see that:
- The issue has been automatically closed
- There's a reference to the commit that closed it
- The issue is linked to the commit in the repository history

## Task 5: Create a Project Board
```
1. To create a project board:
   - Go to your repository on GitHub
   - Click the "Projects" tab
   - Click "Create project"
   - Select "New project" (use the beta project if available)
   - Choose "Basic Kanban" template
   - Enter "Documentation Improvements" as the project name
   - Optionally add a description
   - Click "Create project"

2. To configure columns (if not already set up by the template):
   - The Kanban template should already have "To do", "In progress", and "Done" columns
   - If not, or if you want to customize:
     - Click "+ Add column" to create any missing columns
     - Or click the column menu (three dots) and select "Edit" to rename columns

3. To add a note:
   - Click the "+" at the top of the "To Do" column
   - Select "Add note"
   - Enter text like: "Note: All documentation tasks should be reviewed by at least one team member before moving to Done"
   - Click "Add"
```

## Task 6: Link Issues to the Project Board
```
1. To add issues to the board:
   - Click the "+" at the top of the "To Do" column
   - Select "Add cards"
   - Drag your existing issues from the sidebar into the "To Do" column
   - Close the "Add cards" sidebar

2. To move an issue to "In Progress":
   - Drag the "Update README with project description" issue card from "To Do" to "In Progress"

3. To move a fixed issue to "Done":
   - If you completed Task 4, the fixed typo issue may have automatically moved to "Done" (if automation is enabled)
   - If not, drag the "Fix typo in documentation" issue card to "Done"
```

## Task 7: Use Project Board Automations
```
1. To enable automation:
   - Click the column menu (three dots) on the "To Do" column
   - Select "Manage automation"
   - Check the option for "Newly added issues"
   - Click "Update automation"

   - Click the column menu on the "Done" column
   - Select "Manage automation"
   - Check the option for "Newly closed issues"
   - Click "Update automation"

2. To test the automation:
   - Create a new issue from the "Issues" tab:
     - Title: "Add license file"
     - Description: "We need to add an appropriate license to the project."
     - Submit the issue
   - Go back to your project board and verify that the new issue appears in "To Do"

   - Close an existing issue:
     - Open an issue that isn't already in "Done"
     - Scroll to the bottom and click "Close issue"
   - Go back to your project board and verify that the issue moved to "Done"
```

## Task 8: Create and Manage Issue Templates
```bash
# Create the ISSUE_TEMPLATE directory (from local repository)
mkdir -p .github/ISSUE_TEMPLATE

# Create a bug report template
cat > .github/ISSUE_TEMPLATE/bug_report.md << 'EOF'
---
name: Bug Report
about: Report a bug to help us improve
title: "[BUG] "
labels: bug
assignees: ''
---

## Description
A clear and concise description of the bug.

## Steps To Reproduce
1. Go to '...'
2. Click on '....'
3. Scroll down to '....'
4. See error

## Expected Behavior
A description of what you expected to happen.

## Actual Behavior
A description of what actually happened.

## Screenshots
If applicable, add screenshots to help explain your problem.

## Environment
 - OS: [e.g. Windows, macOS, Linux]
 - Browser: [e.g. Chrome, Firefox, Safari]
 - Version: [e.g. 22]

## Additional Context
Add any other context about the problem here.
EOF

# Create a feature request template
cat > .github/ISSUE_TEMPLATE/feature_request.md << 'EOF'
---
name: Feature Request
about: Suggest an idea for this project
title: "[FEATURE] "
labels: enhancement
assignees: ''
---

## Problem Statement
A clear and concise description of the problem this feature would solve.
E.g., I'm always frustrated when [...]

## Proposed Solution
A description of what you want to happen.

## Alternative Solutions
A description of any alternative solutions or features you've considered.

## Additional Context
Add any other context, screenshots, or mockups about the feature request here.

## Benefits
Explain how this feature would benefit the project and its users.
EOF

# Commit and push the templates
git add .github/
git commit -m "Add issue templates for bug reports and feature requests"
git push origin main
```

To test the template:
```
1. Go to the "Issues" tab on GitHub
2. Click "New issue"
3. You should now see your templates listed
4. Click "Get started" on one of the templates
5. Fill out the details as prompted
6. Submit the issue
```

## Bonus Task
```
To set up issue assignment automation:
1. Create a GitHub Actions workflow file:
```bash
mkdir -p .github/workflows
cat > .github/workflows/issue-assignment.yml << 'EOF'
name: Issue Assignment

on:
  issues:
    types: [opened]

jobs:
  auto-assign:
    runs-on: ubuntu-latest
    steps:
      - name: Auto-assign issue
        uses: pozil/auto-assign-issue@v1
        with:
          repo-token: ${{ secrets.GITHUB_TOKEN }}
          assignees: your-username
EOF

git add .github/workflows/
git commit -m "Add GitHub Action for automatic issue assignment"
git push origin main
```

To create a repository-level project:
```
1. Go to GitHub profile page
2. Click the "Projects" tab 
3. Click "New project"
4. Choose the table or board view
5. Name it "Multi-Repository Task Tracker"
6. Configure the columns/fields as desired
7. Click "Add item" and select issues from multiple repositories
```

To experiment with different project views:
```
1. In your project board, look for the "Views" dropdown
2. Try switching between:
   - Board (Kanban-style)
   - Table (spreadsheet-like)
   - Calendar (timeline)
   - Roadmap (Gantt-chart style)
3. Create a custom view by clicking "New view"
4. Configure grouping, sorting, and filtering options
``` 