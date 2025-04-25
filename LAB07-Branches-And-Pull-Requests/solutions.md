# LAB07 - Solutions: Branches & Pull Requests

Here are the solutions to the exercises:

## Task 1: Create a Feature Branch Repository
```bash
# Create a new repository on GitHub via web interface
# Then clone it locally
git clone https://github.com/your-username/github-collaboration-lab.git
cd github-collaboration-lab

# Create README.md file
cat > README.md << EOF
# GitHub Collaboration Lab

A repository for practicing branch-based workflows and pull requests on GitHub.

## Purpose

This project demonstrates how to use feature branches and pull requests for collaborative development.
EOF

# Create a simple Python file
cat > app.py << EOF
def say_hello():
    """
    A simple function that returns a greeting
    """
    return "Hello, World!"

if __name__ == "__main__":
    message = say_hello()
    print(message)
EOF

# Commit and push to main branch
git add README.md app.py
git commit -m "Initial commit with README and basic app"
git push origin main
```

## Task 2: Create and Work on a Feature Branch
```bash
# Create and switch to a new feature branch
git checkout -b feature-user-greeting

# Modify the Python file to add a new function
cat > app.py << EOF
def say_hello():
    """
    A simple function that returns a greeting
    """
    return "Hello, World!"

def greet_user(username):
    """
    Returns a personalized greeting for a specific user
    
    Args:
        username (str): The name of the user to greet
        
    Returns:
        str: A personalized greeting message
    """
    return f"Hello, {username}! Welcome to our application."

if __name__ == "__main__":
    message = say_hello()
    print(message)
    
    # Test the user greeting
    user_message = greet_user("GitHub User")
    print(user_message)
EOF

# Create CONTRIBUTORS.md file
cat > CONTRIBUTORS.md << EOF
# Contributors

The following people have contributed to this project:

- Your Name (@your-username)
EOF

# Commit the changes
git add app.py CONTRIBUTORS.md
git commit -m "Add user greeting function and contributors list"

# Push the feature branch to GitHub
git push origin feature-user-greeting
```

## Task 3: Create a Pull Request
```
1. Go to your GitHub repository in a web browser
2. You should see a notification about your recently pushed branch, click "Compare & pull request"
   (Or click on "Pull requests" tab and then "New pull request")
3. Select base: main and compare: feature-user-greeting
4. Add a title: "Add user greeting functionality"
5. Add a description: 
   "This pull request adds a new function to greet users by name.
   
   - Adds greet_user() function to app.py
   - Includes proper docstrings
   - Adds CONTRIBUTORS.md file
   
   Fixes #1" (if there's an issue #1 to reference)
6. Click "Create pull request"
```

## Task 4: Review and Comment
```
1. In the pull request view, scroll down to see the "Files changed" tab
2. Review the changes in the diff view
3. Click the "+" icon next to line 11 of app.py (where the function docstring is)
4. Add a comment: "I've added comprehensive docstrings to make the function easy to understand for new contributors."
5. Click "Add single comment"

For reviewing a partner's pull request:
1. Go to the "Pull requests" tab
2. Click on their pull request
3. Review the changes and add constructive comments
4. Consider suggesting specific improvements to the code
```

## Task 5: Modify Based on Feedback
```bash
# Make sure you're on the feature branch
git checkout feature-user-greeting

# Make additional changes based on feedback
cat > app.py << EOF
def say_hello():
    """
    A simple function that returns a greeting
    """
    return "Hello, World!"

def greet_user(username):
    """
    Returns a personalized greeting for a specific user
    
    Args:
        username (str): The name of the user to greet
        
    Returns:
        str: A personalized greeting message
    """
    if not username:
        return "Hello, Guest! Welcome to our application."
    return f"Hello, {username}! Welcome to our application."

if __name__ == "__main__":
    message = say_hello()
    print(message)
    
    # Test the user greeting
    user_message = greet_user("GitHub User")
    print(user_message)
    
    # Test with empty username
    guest_message = greet_user("")
    print(guest_message)
EOF

# Commit and push the changes
git commit -am "Add handling for empty usernames based on review feedback"
git push origin feature-user-greeting
```

## Task 6: Merge the Pull Request
```
1. On GitHub, navigate to your pull request
2. Click the "Merge pull request" button
3. Choose the merge strategy (for this example, use standard merge)
4. Click "Confirm merge"
5. Click "Delete branch" to remove the remote feature branch

In your local repository:
```bash
# Switch back to main branch
git checkout main

# Pull the merged changes
git pull origin main

# Delete the local feature branch
git branch -d feature-user-greeting
```

## Task 7: Create a Conflicting Branch
```bash
# Create a new branch from main
git checkout -b feature-formatting

# Modify the same file and line
cat > app.py << EOF
def say_hello():
    """
    A simple function that returns a greeting
    """
    return "Hello, World! Welcome to our application."

def greet_user(username):
    """
    Returns a personalized greeting for a specific user
    
    Args:
        username (str): The name of the user to greet
        
    Returns:
        str: A personalized greeting message
    """
    if not username:
        return "Hello, Guest! Welcome to our application."
    return f"Hello, {username}! Welcome to our application."

if __name__ == "__main__":
    message = say_hello()
    print(message)
    
    # Test the user greeting
    user_message = greet_user("GitHub User")
    print(user_message)
    
    # Test with empty username
    guest_message = greet_user("")
    print(guest_message)
EOF

# Commit and push
git commit -am "Update say_hello function to include welcome message"
git push origin feature-formatting
```

Create a pull request on GitHub and you'll see a conflict because both branches modified the same function.

To resolve conflicts using GitHub interface:
```
1. In the pull request, click "Resolve conflicts" button
2. Edit the file to fix the conflicts (remove the conflict markers and keep the desired code)
3. Click "Mark as resolved"
4. Click "Commit merge"
5. Complete the pull request merge
```

To resolve conflicts locally:
```bash
git checkout main
git pull origin main
git checkout feature-formatting
git merge main

# Resolve conflicts in your editor, then:
git add app.py
git commit -m "Resolve merge conflicts in say_hello function"
git push origin feature-formatting

# Return to GitHub to complete the merge
```

## Bonus Task
```
Create branch protection:
1. Go to repository Settings → Branches
2. Under "Branch protection rules", click "Add rule"
3. In "Branch name pattern" enter "main"
4. Check "Require pull request reviews before merging"
5. Set "Required number of approvals" to 1
6. Click "Create" or "Save changes"

Testing protected branch:
```bash
git checkout main
# Make a change to any file
echo "# Additional notes" >> README.md
git commit -am "Try to commit directly to main"
git push origin main
# This will be rejected due to branch protection
```

Creating a draft pull request:
```
1. Create a new branch for experimental feature
git checkout -b experimental-feature
# Make changes...
git commit -am "Add experimental feature"
git push origin experimental-feature

2. On GitHub, create a new pull request
3. Open the dropdown menu on the "Create pull request" button
4. Select "Create draft pull request"
5. Click "Draft pull request"
``` 