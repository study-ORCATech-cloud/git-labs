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

## Task 3: Create a Simple Python Application
* Create a file named `main.py` in the root of your repository.
* Write a simple Python script that prints a message and the current date/time.
* Modify your workflow file to add a step that runs this Python script.
* Commit and push your changes to GitHub.

## Task 4: Work with Environment Variables
* Modify your workflow file to define an environment variable called `GREETING` with a value of your choice.
* Add a step that prints this environment variable using `echo $GREETING`.
* Add a step in your Python script to read and print an environment variable.
* Update your workflow to pass the environment variable to the Python script.

## Task 5: Using Actions from the Marketplace
* Add a step to your workflow that uses the `actions/setup-python@v4` action to set up Python.
* Configure the action to use a specific Python version (e.g., 3.9).
* Add a step that installs dependencies using `pip install` (you can use simple packages like `requests` or `pytest`).
* Add a step that runs a Python command using the installed packages.

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
* Modify your workflow to include a matrix strategy that tests your code on multiple Python versions (e.g., 3.8, 3.9, 3.10).
* Configure the `actions/setup-python@v4` action to use the version from the matrix.
* Push your changes and observe the matrix builds in the Actions tab.

## Bonus Task
* Create a new workflow file (e.g., `scheduled.yml`) that runs on a schedule instead of a push event.
* Configure the workflow to run daily at a specific time.
* Add steps similar to your push workflow, but with a message indicating it's a scheduled run.
* Push your changes and verify the workflow appears in the Actions tab (note that it won't run immediately). 