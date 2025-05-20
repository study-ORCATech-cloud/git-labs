# LAB06 - Exercise: Clone & Push

Follow these steps to complete the lab:

## Task 1: Setup a GitHub Repository
* Sign in to your GitHub account (create one if you don't have it yet).
* Create a new public repository named `git-remote-lab` via the GitHub web interface.
* Note the repository URL that GitHub provides after creation.

## Task 2: Clone the Repository
* Open your terminal/command prompt.
* Navigate to your desired directory where you want to store the project.
* Clone your newly created repository using `git clone` and the URL you noted.
* Navigate into the cloned repository directory.

## Task 3: Create Local Content
* Create a README.md file with a project title and brief description.
* Create a text file called `hello.txt` with a simple "Hello, GitHub!" message.
* Add and commit both files with an appropriate message.

## Task 4: Push to GitHub
* Push your commits to the remote repository using `git push`.
* Visit your GitHub repository in a web browser to verify your files appear online.
* View the commit history on GitHub.

## Task 5: Modify Files and Push Again
* Make a change to the README.md file by adding a new section about project features.
* Modify `hello.txt` to include an additional greeting message.
* Commit these changes with a descriptive message.
* Push your new commits to GitHub.
* Verify the changes appear in the GitHub repository.

## Task 6: Explore Remote Configuration
* Use `git remote -v` to display the configured remote repositories.
* Create a new file locally and commit it without pushing.
* Use `git status` to verify your local repository is ahead of the remote.
* Push the changes to synchronize the repositories.

## Task 7: Working with Multiple Remotes (Simulation)
* Create a new directory to simulate a second remote.
* Initialize a new Git repository in this directory.
* Add your GitHub repository as a remote called `origin`.
* Create a file called `contribution.txt` with some content.
* Commit and push this file to your GitHub repository.
* Return to your original repository and pull the new changes.

## Bonus Task
* Research GitHub authentication options (Personal Access Token, SSH keys).
* Document the steps to set up SSH authentication with GitHub in a file called `AUTHENTICATION.md`.
* Configure your local repository to use SSH instead of HTTPS (if you're using HTTPS). 