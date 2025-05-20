# LAB09 - Exercise: Issues & Project Boards

Follow these steps to complete the lab:

## Task 1: Create and Configure a GitHub Repository
* Use an existing GitHub repository or create a new one called `github-issue-tracker`.
* Make sure the repository has the Issues feature enabled (check in the repository settings).
* Clone the repository locally if you'll be adding any code files.

## Task 2: Create Basic Issues
* Create a new issue titled "Update README with project description".
* Add a detailed description explaining what needs to be updated.
* Create a second issue titled "Add contributing guidelines".
* Create a third issue titled "Fix typo in documentation" (you can invent the typo).

## Task 3: Use Issue Metadata
* Add appropriate labels to each issue (e.g., "documentation", "enhancement", "bug").
* Create a new custom label called "good first issue" with a green color.
* Apply the "good first issue" label to one of your issues.
* Assign the issues to yourself or a teammate.
* Create a milestone called "Initial Documentation" with a due date two weeks from now.
* Add the documentation-related issues to this milestone.

## Task 4: Link Issues to Code
* If you're using an existing repository with code, make a small change that fixes one issue.
* Commit the change with a message that includes the phrase "Fixes #X" or "Closes #X" (where X is the issue number).
* Push the change and observe what happens to the issue on GitHub.

## Task 5: Create a Project Board
* Go to the "Projects" tab in your repository and create a new project.
* Choose the Basic Kanban template or a template of your choice.
* Rename the project to "Documentation Improvements" or a name of your choice.
* Configure at least three columns: "To Do", "In Progress", and "Done".
* Add a note to one of the columns with additional information.

## Task 6: Link Issues to the Project Board
* Add your existing issues to the project board in the "To Do" column.
* Move one issue to the "In Progress" column.
* If you completed Task 4, move the fixed issue to the "Done" column.

## Task 7: Use Project Board Automations
* Enable automation for your project board columns.
* Configure the "To Do" column to automatically add newly created issues.
* Configure the "Done" column to automatically add closed issues.
* Test the automation by creating a new issue and closing an existing one.

## Task 8: Create and Manage Issue Templates
* Create a `.github/ISSUE_TEMPLATE/` directory in your repository.
* Create a bug report template with appropriate sections (description, steps to reproduce, expected behavior, etc.).
* Create a feature request template with appropriate sections.
* Test creating a new issue using one of your templates.

## Bonus Task
* Set up issue assignment automation using GitHub Actions.
* Create a repository-level project that could track issues across multiple repositories.
* Experiment with different project board views (table, board, etc.). 