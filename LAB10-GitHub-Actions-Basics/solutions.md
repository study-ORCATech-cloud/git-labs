# LAB10 - Solutions: GitHub Actions Basics

Here are the solutions to the exercises:

## Task 1: Create Workflow Directory and Basic Workflow File
```bash
# Create the workflows directory
mkdir -p .github/workflows

# Create main.yml workflow file
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Demo

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: |
          echo "===========================================" 
          echo "Starting GitHub Actions workflow execution"
          echo "This workflow was triggered by a ${{ github.event_name }} event"
          echo "===========================================" 
EOF

# Commit and push the workflow file
git add .github/workflows/main.yml
git commit -m "Add basic GitHub Actions workflow"
git push origin main
```

## Task 2: Add Basic Workflow Steps
```bash
# Update main.yml to add more steps
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Demo

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: |
          echo "===========================================" 
          echo "Starting GitHub Actions workflow execution"
          echo "This workflow was triggered by a ${{ github.event_name }} event"
          echo "===========================================" 
      
      - name: List repository files
        run: ls -la
EOF

# Commit and push the updated workflow file
git add .github/workflows/main.yml
git commit -m "Add steps to list repository files"
git push origin main
```

## Task 3: Create a Simple Text File
```bash
# Create a simple text file
cat > main.txt << 'EOF'
==================================================
            GitHub Actions Demo Text File            
==================================================
This is a simple text file that will be used with GitHub Actions.

When this file is processed by GitHub Actions, it will:
- Run on a GitHub Actions runner
- Display the date and time of execution
- Show environment variables that were set in the workflow
- Show system information

The GitHub Actions workflow will read this file and add additional 
information when it runs.

==================================================
EOF

# Update main.yml to add a step to display the text file
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Demo

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: |
          echo "===========================================" 
          echo "Starting GitHub Actions workflow execution"
          echo "This workflow was triggered by a ${{ github.event_name }} event"
          echo "===========================================" 
      
      - name: List repository files
        run: ls -la
      
      - name: Display text file content
        run: cat main.txt
EOF

# Commit and push the changes
git add main.txt .github/workflows/main.yml
git commit -m "Add main.txt and update workflow to display it"
git push origin main
```

## Task 4: Work with Environment Variables
```bash
# Update main.yml to work with environment variables
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Demo

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from GitHub Actions workflow!"

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: |
          echo "===========================================" 
          echo "Starting GitHub Actions workflow execution"
          echo "This workflow was triggered by a ${{ github.event_name }} event"
          echo "===========================================" 
      
      - name: List repository files
        run: ls -la
      
      - name: Display environment variable
        run: echo "Greeting: $GREETING"
      
      - name: Display text file content
        run: cat main.txt
        
      - name: Write environment variable to file
        run: echo "Greeting: $GREETING" > greeting.txt
        
      - name: Combine text files with additional information
        run: |
          echo "" > processed_output.txt
          echo "===== GITHUB ACTIONS PROCESSING RESULTS =====" >> processed_output.txt
          echo "Current date and time: $(date)" >> processed_output.txt
          echo "Greeting: $GREETING" >> processed_output.txt
          echo "System Information:" >> processed_output.txt
          echo "OS: $(uname -a)" >> processed_output.txt
          echo "" >> processed_output.txt
          cat main.txt >> processed_output.txt
          echo "" >> processed_output.txt
          echo "===== END OF PROCESSING =====" >> processed_output.txt
          cat processed_output.txt
EOF

# Commit and push the changes
git add .github/workflows/main.yml
git commit -m "Update workflow with environment variables"
git push origin main
```

## Task 5: Using Actions from the Marketplace
```bash
# Update main.yml to use an action from the marketplace
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Demo

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from GitHub Actions workflow!"

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: |
          echo "===========================================" 
          echo "Starting GitHub Actions workflow execution"
          echo "This workflow was triggered by a ${{ github.event_name }} event"
          echo "===========================================" 
      
      - name: List repository files
        run: ls -la
      
      - name: Display environment variable
        run: echo "Greeting: $GREETING"
      
      - name: Display text file content
        run: cat main.txt
        
      - name: Combine text files with additional information
        run: |
          echo "" > processed_output.txt
          echo "===== GITHUB ACTIONS PROCESSING RESULTS =====" >> processed_output.txt
          echo "Current date and time: $(date)" >> processed_output.txt
          echo "Greeting: $GREETING" >> processed_output.txt
          echo "System Information:" >> processed_output.txt
          echo "OS: $(uname -a)" >> processed_output.txt
          echo "" >> processed_output.txt
          cat main.txt >> processed_output.txt
          echo "" >> processed_output.txt
          echo "===== END OF PROCESSING =====" >> processed_output.txt
          cat processed_output.txt
          
      # Example: Using a Marketplace action for file/text processing
      - name: Create file size report
        uses: theowenyoung/markdown-action@main
        with:
          files: main.txt
          command: |
            echo "# File Analysis Report" > file_report.md
            echo "Generated on: $(date)" >> file_report.md
            echo "" >> file_report.md
            echo "## File Size" >> file_report.md
            echo "main.txt: $(wc -c < main.txt) bytes" >> file_report.md
            echo "" >> file_report.md
            echo "## Line Count" >> file_report.md
            echo "main.txt: $(wc -l < main.txt) lines" >> file_report.md
            
      - name: Display file report
        run: cat file_report.md
EOF

# Commit and push the changes
git add .github/workflows/main.yml
git commit -m "Update workflow to use an action from the marketplace"
git push origin main
```

## Task 6: Work with Conditional Steps
```bash
# Update main.yml to add conditional steps
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Demo

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from GitHub Actions workflow!"

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: |
          echo "===========================================" 
          echo "Starting GitHub Actions workflow execution"
          echo "This workflow was triggered by a ${{ github.event_name }} event"
          echo "===========================================" 
      
      - name: List repository files
        run: ls -la
      
      - name: Display environment variable
        run: echo "Greeting: $GREETING"
      
      - name: Display text file content
        run: cat main.txt
        
      # Step that only runs on the main branch
      - name: Main branch step
        if: github.ref == 'refs/heads/main'
        run: |
          echo "This step only runs on the main branch"
          echo "Main branch deployment steps would go here"
          echo "Running on main branch" > branch_info.txt
          
      # Step that only runs on other branches
      - name: Non-main branch step
        if: github.ref != 'refs/heads/main'
        run: |
          echo "This step only runs on branches other than main"
          echo "Feature branch tasks would go here"
          echo "Running on feature branch: ${{ github.ref }}" > branch_info.txt
          
      - name: Display branch info
        run: cat branch_info.txt
EOF

# Commit and push the changes
git add .github/workflows/main.yml
git commit -m "Add conditional steps to workflow"
git push origin main

# Create and push to a feature branch to test the conditions
git checkout -b feature/test-conditions
git push origin feature/test-conditions
```

## Task 7: Review Workflow Runs
```
After pushing changes to both main and feature branches:

1. Go to your GitHub repository
2. Click on the "Actions" tab
3. You should see workflow runs for both branches
4. Click on a workflow run to see details
5. Look at the logs for each step
6. Compare the output of the conditional steps between branches
7. Check if the conditional logic worked as expected
```

## Task 8: Create a Matrix Build
```bash
# Update main.yml to include a matrix strategy
cat > .github/workflows/main.yml << 'EOF'
name: Basic GitHub Actions Demo

on:
  push:
    branches: [ "**" ]
  pull_request:
    branches: [ main ]

jobs:
  matrix-build:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: [ubuntu-latest, windows-latest, macos-latest]
    env:
      GREETING: "Hello from GitHub Actions workflow on ${{ matrix.os }}!"

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Welcome message
        run: |
          echo "===========================================" 
          echo "Starting GitHub Actions workflow execution"
          echo "This workflow was triggered by a ${{ github.event_name }} event"
          echo "Running on ${{ matrix.os }}"
          echo "===========================================" 
      
      - name: List repository files
        run: ls -la
      
      - name: Display environment variable
        run: echo "Greeting: $GREETING"
      
      - name: Display text file content
        run: cat main.txt
        
      # OS-specific commands
      - name: Run Linux-specific commands
        if: matrix.os == 'ubuntu-latest'
        run: |
          echo "Running Linux-specific commands"
          uname -a
      
      - name: Run macOS-specific commands
        if: matrix.os == 'macos-latest'
        run: |
          echo "Running macOS-specific commands"
          system_profiler SPSoftwareDataType | grep "System Version"
      
      - name: Run Windows-specific commands
        if: matrix.os == 'windows-latest'
        run: |
          echo "Running Windows-specific commands"
          systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
EOF

# Commit and push the changes
git add .github/workflows/main.yml
git commit -m "Add matrix build to workflow"
git push origin main
```

## Bonus Task
```bash
# Create a scheduled workflow file
cat > .github/workflows/scheduled.yml << 'EOF'
name: Scheduled GitHub Actions Demo

on:
  schedule:
    # Run at 00:00 UTC every day
    - cron: '0 0 * * *'
  # Allow manual triggering for testing
  workflow_dispatch:

jobs:
  scheduled-job:
    runs-on: ubuntu-latest
    env:
      GREETING: "Hello from scheduled GitHub Actions workflow!"

    steps:
      - name: Checkout repository
        uses: actions/checkout@v3
        
      - name: Display scheduled run information
        run: |
          echo "===========================================" 
          echo "Running scheduled GitHub Actions workflow"
          echo "Current date: $(date)"
          echo "This job runs daily at midnight UTC"
          echo "===========================================" 
      
      - name: Display system information
        run: |
          echo "System Information:"
          echo "OS: $(uname -a)"
          echo "Current directory: $(pwd)"
          
      - name: Display environment variable
        run: echo "Greeting: $GREETING"
        
      - name: Read text file
        run: cat main.txt
          
      - name: Generate daily report
        run: |
          echo "Daily report generated on $(date)" > daily_report.txt
          echo "GitHub Actions scheduled workflow completed successfully" >> daily_report.txt
          echo "Greeting used: $GREETING" >> daily_report.txt
          echo "" >> daily_report.txt
          echo "Contents of main.txt:" >> daily_report.txt
          cat main.txt >> daily_report.txt
          cat daily_report.txt
EOF

# Commit and push the changes
git add .github/workflows/scheduled.yml
git commit -m "Add scheduled workflow"
git push origin main
```

To verify the scheduled workflow appears in GitHub Actions:
1. Go to your GitHub repository
2. Click on the "Actions" tab
3. In the left sidebar, you should see both workflows listed
4. Click on the "Scheduled GitHub Actions Demo" workflow
5. You'll see it hasn't run yet (since it's scheduled for future execution)
6. You can manually trigger it using the "Run workflow" button 