# LAB10 - Exercise: GitHub Actions Basics

Follow these steps to complete the lab:

## Task 1: Create Workflow Directory and Basic Workflow File
* Create the `.github/workflows` directory in your repository.
* Create a file named `main.yml` inside the workflows directory.
* Add a basic workflow structure that triggers on push events.
* Configure the workflow to run on the `ubuntu-latest` runner.

## Task 2: Add Basic Workflow Steps
* Add a step that checks out the repository code using `actions/checkout@v3`.
* Add a step that displays a welcome message using the `echo` command.
* Add a step that lists the files in the current directory using the `ls -la` command.
* Commit and push your workflow file to GitHub.

## Task 3: Create a Simple Text File
* Create a file named `main.txt` in the root of your repository.
* Write a simple text file that contains information about your project.
* Modify your workflow file to add a step that displays the contents of this text file using the `cat` command.
* Commit and push your changes to GitHub.

## Task 4: Work with Environment Variables
* Modify your workflow file to define an environment variable called `GREETING` with a value of your choice.
* Add a step that prints this environment variable using `echo $GREETING`.
* Add a step that displays the environment variable and writes it to a new file.
* Add a step that combines your text file with additional information into a processed output file.

## Task 5: Using Actions from the Marketplace
* Explore the GitHub Actions Marketplace and find an action that interests you.
* Add a step to your workflow that uses this action (for example, actions for notifications, formatting, etc.).
* Configure the action according to its documentation.
* Push your changes and observe the action's effect in your workflow run.

## Task 6: Work with Conditional Steps
* Add a step to your workflow that only runs when the branch is `main` (or your default branch).
* Add another step that only runs when the branch is not `main`.
* Test these conditions by pushing changes to different branches.

## Task 7: Review Workflow Runs
* Go to the "Actions" tab in your GitHub repository.
* Examine the workflow runs that have been triggered by your pushes.
* Click on a specific run to see detailed logs.
* Identify any failed steps and understand why they failed.

## Task 8: Create a Matrix Build
* Modify your workflow to include a matrix strategy that tests your workflow on multiple operating systems (e.g., ubuntu-latest, windows-latest, macos-latest).
* Configure any OS-specific commands with appropriate conditionals.
* Push your changes and observe the matrix builds in the Actions tab.

## Bonus Task
* Create a new workflow file (e.g., `scheduled.yml`) that runs on a schedule instead of a push event.
* Configure the workflow to run daily at a specific time.
* Add steps similar to your push workflow, but with a message indicating it's a scheduled run.
* Push your changes and verify the workflow appears in the Actions tab (note that it won't run immediately). 