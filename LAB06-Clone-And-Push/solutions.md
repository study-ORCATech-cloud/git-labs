# LAB06 - Solutions: Clone & Push

Here are the solutions to the exercises:

## Task 1: Setup a GitHub Repository
```
1. Go to GitHub.com and sign in to your account.
2. Click the "+" icon in the top right corner and select "New repository".
3. Fill in the repository name: git-remote-lab
4. Add a brief description (optional): "A lab for learning Git remotes"
5. Select "Public" for the repository visibility.
6. Check "Add a README file" if you want GitHub to create an initial README.
7. Click "Create repository".
8. Once created, GitHub will display the repository URL (e.g., https://github.com/your-username/git-remote-lab.git).
```

## Task 2: Clone the Repository
```bash
# Navigate to your desired directory
cd ~/Desktop/git-labs  # or any directory of your choice

# Clone the repository
git clone https://github.com/your-username/git-remote-lab.git

# Navigate into the cloned directory
cd git-remote-lab
```

## Task 3: Create Local Content
```bash
# Create README.md (if not already created by GitHub)
cat > README.md << EOF
# Git Remote Lab

A repository for learning how to work with remote Git repositories and GitHub.

## Description

This project demonstrates basic GitHub operations including cloning, pushing, and managing remote repositories.
EOF

# Create hello.txt
cat > hello.txt << EOF
Hello, GitHub!

This is a sample text file for demonstrating Git remote operations.
EOF

# Add and commit the files
git add README.md hello.txt
git commit -m "Initial commit: Add README and hello.txt"
```

## Task 4: Push to GitHub
```bash
# Push to the remote repository
git push origin main  # or git push origin master (depending on your default branch name)

# GitHub repository can be viewed at:
# https://github.com/your-username/git-remote-lab
```

To verify:
1. Open your web browser and navigate to `https://github.com/your-username/git-remote-lab`
2. You should see both README.md and hello.txt files
3. Click on "commits" to view the commit history

## Task 5: Modify Files and Push Again
```bash
# Update README.md
cat >> README.md << EOF

## Features

- Simple text file demonstration
- Git remote repository practice
- Basic GitHub workflow
EOF

# Modify hello.txt
cat > hello.txt << EOF
Hello, GitHub!

This is a sample text file for demonstrating Git remote operations.

Additional greeting: Hello, Git User! Welcome to the remote repository.
EOF

# Commit the changes
git add README.md hello.txt
git commit -m "Update README with features section and enhance hello.txt with additional greeting"

# Push changes
git push origin main
```

## Task 6: Explore Remote Configuration
```bash
# Display remote repositories
git remote -v
# Output should show:
# origin  https://github.com/your-username/git-remote-lab.git (fetch)
# origin  https://github.com/your-username/git-remote-lab.git (push)

# Create a new file
cat > config.txt << EOF
# Configuration for our application

DEBUG = TRUE
VERSION = 0.1.0
API_URL = https://api.example.com/v1
EOF

# Commit without pushing
git add config.txt
git commit -m "Add configuration file"

# Check status
git status
# Output should indicate your branch is ahead of 'origin/main' by 1 commit

# Push to synchronize
git push origin main
```

## Task 7: Working with Multiple Remotes (Simulation)
```bash
# Create a new directory for second remote simulation
cd ..
mkdir git-remote-lab-second
cd git-remote-lab-second

# Initialize a new Git repository
git init

# Add the GitHub repository as a remote
git remote add origin https://github.com/your-username/git-remote-lab.git

# Pull the current state from GitHub
git pull origin main

# Create a new contribution file
cat > contribution.txt << EOF
This is a contribution from a different local repository.

It simulates how multiple developers might work with the same remote repository.
EOF

# Commit and push
git add contribution.txt
git commit -m "Add contribution from second repository"
git push origin main

# Return to original repository and pull changes
cd ../git-remote-lab
git pull origin main
```

## Bonus Task
```bash
# Create SSH Authentication documentation
cat > AUTHENTICATION.md << EOF
# GitHub Authentication Options

## Personal Access Tokens (PAT)

1. **Generate a token**:
   - Go to GitHub → Settings → Developer settings → Personal access tokens → Generate new token
   - Select appropriate scopes (at minimum, 'repo')
   - Copy the generated token immediately (it won't be shown again)

2. **Use the token**:
   - When pushing to GitHub, use the token as your password
   - Many Git clients allow you to cache this credential

## SSH Authentication (Recommended)

1. **Check for existing SSH keys**:
   \`\`\`bash
   ls -la ~/.ssh
   \`\`\`

2. **Generate a new SSH key**:
   \`\`\`bash
   ssh-keygen -t ed25519 -C "your_email@example.com"
   \`\`\`

3. **Add the SSH key to ssh-agent**:
   \`\`\`bash
   eval "$(ssh-agent -s)"
   ssh-add ~/.ssh/id_ed25519
   \`\`\`

4. **Add the SSH key to your GitHub account**:
   - Copy the SSH public key to clipboard:
     \`\`\`bash
     cat ~/.ssh/id_ed25519.pub
     \`\`\`
   - Go to GitHub → Settings → SSH and GPG keys → New SSH key
   - Paste your key and give it a title
   - Click "Add SSH key"

5. **Test your connection**:
   \`\`\`bash
   ssh -T git@github.com
   \`\`\`

6. **Change remote URL to use SSH**:
   \`\`\`bash
   git remote set-url origin git@github.com:your-username/git-remote-lab.git
   \`\`\`
EOF

# Add and commit the file
git add AUTHENTICATION.md
git commit -m "Add documentation on GitHub authentication options"

# Push to GitHub
git push origin main
``` 