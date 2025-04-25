# LAB10 - Exercise: GitHub Actions Basics

Follow these steps to complete the lab:

## Task 1: Create Workflow Directory and Basic Workflow File
TODO: Create the `.github/workflows` directory in your repository.
TODO: Create a file named `main.yml` inside the workflows directory.
TODO: Add a basic workflow structure that triggers on push events.
TODO: Configure the workflow to run on the `ubuntu-latest` runner.

## Task 2: Add Basic Workflow Steps
TODO: Add a step that checks out the repository code using `actions/checkout@v3`.
TODO: Add a step that displays a welcome message using the `echo` command.
TODO: Add a step that lists the files in the current directory using the `ls -la` command.
TODO: Commit and push your workflow file to GitHub.

## Task 3: Create a Simple Python Application
TODO: Create a file named `main.py` in the root of your repository.
TODO: Write a simple Python script that prints a message and the current date/time.
TODO: Modify your workflow file to add a step that runs this Python script.
TODO: Commit and push your changes to GitHub.

## Task 4: Work with Environment Variables
TODO: Modify your workflow file to define an environment variable called `GREETING` with a value of your choice.
TODO: Add a step that prints this environment variable using `echo $GREETING`.
TODO: Add a step in your Python script to read and print an environment variable.
TODO: Update your workflow to pass the environment variable to the Python script.

## Task 5: Using Actions from the Marketplace
TODO: Add a step to your workflow that uses the `actions/setup-python@v4` action to set up Python.
TODO: Configure the action to use a specific Python version (e.g., 3.9).
TODO: Add a step that installs dependencies using `pip install` (you can use simple packages like `requests` or `pytest`).
TODO: Add a step that runs a Python command using the installed packages.

## Task 6: Work with Conditional Steps
TODO: Add a step to your workflow that only runs when the branch is `main` (or your default branch).
TODO: Add another step that only runs when the branch is not `main`.
TODO: Test these conditions by pushing changes to different branches.

## Task 7: Review Workflow Runs
TODO: Go to the "Actions" tab in your GitHub repository.
TODO: Examine the workflow runs that have been triggered by your pushes.
TODO: Click on a specific run to see detailed logs.
TODO: Identify any failed steps and understand why they failed.

## Task 8: Create a Matrix Build
TODO: Modify your workflow to include a matrix strategy that tests your code on multiple Python versions (e.g., 3.8, 3.9, 3.10).
TODO: Configure the `actions/setup-python@v4` action to use the version from the matrix.
TODO: Push your changes and observe the matrix builds in the Actions tab.

## Bonus Task
TODO: Create a new workflow file (e.g., `scheduled.yml`) that runs on a schedule instead of a push event.
TODO: Configure the workflow to run daily at a specific time.
TODO: Add steps similar to your push workflow, but with a message indicating it's a scheduled run.
TODO: Push your changes and verify the workflow appears in the Actions tab (note that it won't run immediately). 