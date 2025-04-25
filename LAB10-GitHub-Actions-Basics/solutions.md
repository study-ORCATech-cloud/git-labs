# LAB10 - Solutions: GitHub Actions Basics

Here are the solutions to the exercises:

## Task 1: Create Workflow Directory and Basic Workflow File
```bash
# Create the workflows directory
mkdir -p .github/workflows

# Create the workflow file
touch .github/workflows/main.yml

# Edit the file and add basic workflow structure
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Workflow

on:
  push:
    branches: [ "**" ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      # Empty for now, we'll add steps in the next task
      - name: Placeholder
        run: echo "This is a placeholder"
EOF

# Commit and push
git add .github/workflows/main.yml
git commit -m "Add basic GitHub Actions workflow"
git push
```

## Task 2: Add Basic Workflow Steps
```bash
# Edit the workflow file to add steps
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Workflow

on:
  push:
    branches: [ "**" ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: echo "Hello from GitHub Actions! This workflow was triggered by a ${{ github.event_name }} event."
        
      - name: List files in the repository
        run: |
          ls -la
          echo "================================"
          echo "Repository contents:"
          ls -la ${{ github.workspace }}
EOF

# Commit and push
git add .github/workflows/main.yml
git commit -m "Add checkout and basic steps to workflow"
git push
```

## Task 3: Create a Simple Python Application
```bash
# Create the Python script
cat > main.py << 'EOF'
import datetime

def main():
    print("Hello from Python script!")
    print(f"Current date and time: {datetime.datetime.now()}")
    print("This script is running as part of a GitHub Actions workflow")

if __name__ == "__main__":
    main()
EOF

# Update the workflow file to run the Python script
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Workflow

on:
  push:
    branches: [ "**" ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: echo "Hello from GitHub Actions! This workflow was triggered by a ${{ github.event_name }} event."
        
      - name: List files in the repository
        run: |
          ls -la
          echo "================================"
          echo "Repository contents:"
          ls -la ${{ github.workspace }}
          
      - name: Run Python script
        run: python main.py
EOF

# Commit and push
git add main.py .github/workflows/main.yml
git commit -m "Add Python script and update workflow to run it"
git push
```

## Task 4: Work with Environment Variables
```bash
# Update the Python script to read an environment variable
cat > main.py << 'EOF'
import datetime
import os

def main():
    print("Hello from Python script!")
    print(f"Current date and time: {datetime.datetime.now()}")
    print("This script is running as part of a GitHub Actions workflow")
    
    # Read the environment variable
    greeting = os.environ.get('GREETING', 'No greeting set')
    print(f"Greeting from environment: {greeting}")

if __name__ == "__main__":
    main()
EOF

# Update the workflow file to set environment variables
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Workflow

on:
  push:
    branches: [ "**" ]

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from the GitHub Actions workflow!"
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: echo "Hello from GitHub Actions! This workflow was triggered by a ${{ github.event_name }} event."
        
      - name: Display environment variable
        run: echo $GREETING
        
      - name: List files in the repository
        run: |
          ls -la
          echo "================================"
          echo "Repository contents:"
          ls -la ${{ github.workspace }}
          
      - name: Run Python script
        run: python main.py
        env:
          GREETING: "Hello from the Python step!"
EOF

# Commit and push
git add main.py .github/workflows/main.yml
git commit -m "Add environment variable support"
git push
```

## Task 5: Using Actions from the Marketplace
```bash
# Update the workflow file to use the setup-python action
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Workflow

on:
  push:
    branches: [ "**" ]

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from the GitHub Actions workflow!"
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'
          
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install requests pytest
          pip list
        
      - name: Welcome message
        run: echo "Hello from GitHub Actions! This workflow was triggered by a ${{ github.event_name }} event."
        
      - name: Display environment variable
        run: echo $GREETING
        
      - name: List files in the repository
        run: |
          ls -la
          echo "================================"
          echo "Repository contents:"
          ls -la ${{ github.workspace }}
          
      - name: Run Python script
        run: python main.py
        env:
          GREETING: "Hello from the Python step!"
          
      - name: Run Python with installed package
        run: |
          python -c "import requests; print('Requests package imported successfully.'); r = requests.get('https://api.github.com'); print(f'GitHub API Status Code: {r.status_code}')"
EOF

# Commit and push
git add .github/workflows/main.yml
git commit -m "Add Python setup action and dependencies"
git push
```

## Task 6: Work with Conditional Steps
```bash
# Update the workflow file to add conditional steps
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Workflow

on:
  push:
    branches: [ "**" ]

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from the GitHub Actions workflow!"
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'
          
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install requests pytest
          pip list
        
      - name: Welcome message
        run: echo "Hello from GitHub Actions! This workflow was triggered by a ${{ github.event_name }} event."
        
      - name: Display environment variable
        run: echo $GREETING
        
      - name: List files in the repository
        run: |
          ls -la
          echo "================================"
          echo "Repository contents:"
          ls -la ${{ github.workspace }}
          
      - name: Run Python script
        run: python main.py
        env:
          GREETING: "Hello from the Python step!"
          
      - name: Run Python with installed package
        run: |
          python -c "import requests; print('Requests package imported successfully.'); r = requests.get('https://api.github.com'); print(f'GitHub API Status Code: {r.status_code}')"
      
      - name: Run only on main branch
        if: github.ref == 'refs/heads/main'
        run: echo "This step only runs on the main branch"
        
      - name: Run only on other branches
        if: github.ref != 'refs/heads/main'
        run: echo "This step only runs on branches other than main"
EOF

# Commit and push to main
git add .github/workflows/main.yml
git commit -m "Add conditional steps based on branch"
git push

# Create a new branch and push to test the conditions
git checkout -b test-branch
git push -u origin test-branch
```

## Task 7: Review Workflow Runs
```
1. Go to your GitHub repository in the browser
2. Click on the "Actions" tab
3. You should see a list of all workflow runs
4. Click on the most recent run to view details
5. Expand the job to see individual steps
6. Click on a specific step to see its logs
7. Look at the outputs of your conditional steps
8. Verify that all steps completed successfully
9. If any steps failed, examine the logs to understand why
```

## Task 8: Create a Matrix Build
```bash
# Update the workflow file to use a matrix strategy
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Workflow

on:
  push:
    branches: [ "**" ]

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from the GitHub Actions workflow!"
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'
          
      - name: Install dependencies
        run: |
          python -m pip install --upgrade pip
          pip install requests pytest
          pip list
        
      - name: Welcome message
        run: echo "Hello from GitHub Actions! This workflow was triggered by a ${{ github.event_name }} event."
        
      # ...other steps from previous tasks...
  
  # Add a new job with matrix strategy
  test-matrix:
    runs-on: ubuntu-latest
    strategy:
      matrix:
        python-version: ['3.8', '3.9', '3.10']
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Set up Python ${{ matrix.python-version }}
        uses: actions/setup-python@v4
        with:
          python-version: ${{ matrix.python-version }}
          
      - name: Display Python version
        run: |
          python --version
          echo "Running tests with Python ${{ matrix.python-version }}"
          
      - name: Run Python script
        run: python main.py
EOF

# Commit and push
git checkout main  # Switch back to main first
git add .github/workflows/main.yml
git commit -m "Add matrix testing with multiple Python versions"
git push
```

## Bonus Task
```bash
# Create a scheduled workflow file
cat > .github/workflows/scheduled.yml << 'EOF'
name: Scheduled Workflow

on:
  schedule:
    # Run at 00:00 UTC every day
    - cron: '0 0 * * *'

jobs:
  scheduled-job:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Display scheduled run information
        run: |
          echo "This is a scheduled run that executes daily at midnight UTC"
          echo "Current date: $(date)"
          
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.9'
          
      - name: Run Python script
        run: python main.py
        env:
          GREETING: "Hello from the scheduled workflow!"
EOF

# Commit and push
git add .github/workflows/scheduled.yml
git commit -m "Add scheduled workflow that runs daily"
git push
```

To verify the scheduled workflow:
```
1. Go to the "Actions" tab in your GitHub repository
2. Look for the "Scheduled Workflow" in the list of workflows
3. Note that it won't run immediately, but will be triggered at the scheduled time
``` 