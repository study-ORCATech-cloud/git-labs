# LAB13 - Solutions: GitHub Actions Workflow Templates

Here are the solutions to the exercises:

## Task 1: Create a Template Repository

```yaml
# .github/workflows/ci-template.yml
name: CI Template

on:
  workflow_call:

jobs:
  echo:
    runs-on: ubuntu-latest
    steps:
      - run: echo "👋 Reusable GitHub Action Workflow"
```

**Steps explanation:**
1. Create a new GitHub repository named "workflow-templates"
2. Create the directory structure `.github/workflows/`
3. Create the file `ci-template.yml` with:
   - `on: workflow_call:` - This makes the workflow reusable
   - A simple job that runs on ubuntu-latest
   - A step that outputs a welcome message

## Task 2: Add Parameters to Your Template

```yaml
# .github/workflows/ci-template.yml
name: CI Template with Parameters

on:
  workflow_call:
    inputs:
      branch:
        description: 'Branch to checkout'
        default: 'main'
        required: false
        type: string
      welcome_message:
        description: 'Custom welcome message'
        default: '👋 Hello from the reusable workflow!'
        required: false
        type: string

jobs:
  echo:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ inputs.branch }}
      
      - name: Display welcome message
        run: echo "${{ inputs.welcome_message }}"
      
      - name: Show which branch was checked out
        run: |
          echo "Repository checked out on branch: ${{ inputs.branch }}"
          git branch --show-current
```

**Steps explanation:**
1. Define input parameters using the `inputs` keyword:
   - `branch` - For specifying which branch to check out
   - `welcome_message` - For customizing the welcome message
2. Set default values for both parameters
3. Use the parameters in your workflow steps with `${{ inputs.parameter_name }}`
4. The checkout action uses the branch parameter
5. A step displays the custom welcome message

## Task 3: Add Outputs to Your Template

```yaml
# .github/workflows/ci-template.yml
name: CI Template with Outputs

on:
  workflow_call:
    inputs:
      branch:
        description: 'Branch to checkout'
        default: 'main'
        required: false
        type: string
      welcome_message:
        description: 'Custom welcome message'
        default: '👋 Hello from the reusable workflow!'
        required: false
        type: string
    outputs:
      result:
        description: 'The result of the workflow run'
        value: ${{ jobs.echo.outputs.job_result }}
      timestamp:
        description: 'The time when the workflow ran'
        value: ${{ jobs.echo.outputs.run_time }}

jobs:
  echo:
    runs-on: ubuntu-latest
    outputs:
      job_result: ${{ steps.generate-result.outputs.result }}
      run_time: ${{ steps.get-time.outputs.time }}
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ inputs.branch }}
      
      - name: Display welcome message
        run: echo "${{ inputs.welcome_message }}"
      
      - name: Generate result
        id: generate-result
        run: |
          echo "result=Success! The workflow template ran on branch ${{ inputs.branch }}" >> $GITHUB_OUTPUT
      
      - name: Get current time
        id: get-time
        run: |
          echo "time=$(date -u +'%Y-%m-%dT%H:%M:%SZ')" >> $GITHUB_OUTPUT
```

**Steps explanation:**
1. Define outputs in the `workflow_call` section:
   - `result` - Information about the workflow execution
   - `timestamp` - The time when the workflow ran 
2. Set up job outputs that can be consumed by the calling workflow
3. Use the `${{ steps.step-id.outputs.output_name }}` syntax to reference step outputs
4. Create steps that generate content to be used as outputs:
   - A step to generate the result text
   - A step to get the current time

## Task 4 & 5: Create a Project Repository and Call the Reusable Workflow

```yaml
# .github/workflows/main.yml
name: Use Template

on: [push]

jobs:
  use-template:
    uses: your-username/workflow-templates/.github/workflows/ci-template.yml@main
    with:
      branch: main
      welcome_message: '🚀 Successfully called from project repo!'
  
  use-outputs:
    needs: use-template
    runs-on: ubuntu-latest
    steps:
      - name: Display template result
        run: echo "Template result: ${{ needs.use-template.outputs.result }}"
      
      - name: Show timestamp
        run: echo "Workflow ran at: ${{ needs.use-template.outputs.timestamp }}"
```

**Steps explanation:**
1. Create a new repository to use the template
2. Create a workflow file in `.github/workflows/main.yml`
3. Configure the workflow to trigger on push events
4. Add a job that calls your template workflow:
   - Use the `uses` keyword with the correct repository and file path
   - Pass values to the input parameters
5. Add a second job that uses the outputs from the template:
   - Depends on the first job with `needs: use-template`
   - Access outputs with `${{ needs.use-template.outputs.output_name }}`

## Task 6: Advanced - Secret Passing

**Template repository**:
```yaml
# .github/workflows/ci-template.yml
name: CI Template with Secrets

on:
  workflow_call:
    inputs:
      branch:
        description: 'Branch to checkout'
        default: 'main'
        required: false
        type: string
    secrets:
      API_TOKEN:
        description: 'API token for external service'
        required: true
    outputs:
      result:
        description: 'The result of the workflow run'
        value: ${{ jobs.main.outputs.job_result }}

jobs:
  main:
    runs-on: ubuntu-latest
    outputs:
      job_result: ${{ steps.api-call.outputs.result }}
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ inputs.branch }}
      
      - name: Make secure API call
        id: api-call
        run: |
          # Securely use the token - notice we don't echo it directly
          # This is a demonstration and would be replaced with a real API call
          if [[ -n "$API_TOKEN" ]]; then
            echo "API call successful (token length: ${#API_TOKEN})"
            echo "result=API call completed successfully" >> $GITHUB_OUTPUT
          else
            echo "No API token provided"
            echo "result=Failed - no API token" >> $GITHUB_OUTPUT
          fi
        env:
          API_TOKEN: ${{ secrets.API_TOKEN }}
```

**Project repository**:
```yaml
# .github/workflows/main.yml
name: Use Template with Secrets

on: [push]

jobs:
  use-template:
    uses: your-username/workflow-templates/.github/workflows/ci-template.yml@main
    with:
      branch: main
    secrets:
      API_TOKEN: ${{ secrets.API_TOKEN }}
  
  show-result:
    needs: use-template
    runs-on: ubuntu-latest
    steps:
      - name: Display result
        run: echo "API call result: ${{ needs.use-template.outputs.result }}"
```

**Steps explanation:**
1. Update the template to accept a secret parameter:
   - Use the `secrets` keyword in `workflow_call`
   - Mark the secret as required
2. Configure the template to use the secret securely:
   - Pass the secret to a step using environment variables
   - Never directly echo or log the secret value
3. Update the calling workflow to pass a GitHub secret:
   - Use the `secrets` keyword to pass secrets
   - Reference repository secrets with `${{ secrets.SECRET_NAME }}`
4. Ensure secrets are handled securely:
   - Only indicate success/failure, not the secret value itself
   - Set up outputs without including the secret content

## Task 7: Advanced - Conditional Logic

```yaml
# .github/workflows/ci-template.yml
name: CI Template with Conditionals

on:
  workflow_call:
    inputs:
      branch:
        description: 'Branch to checkout'
        default: 'main'
        required: false
        type: string
      run_tests:
        description: 'Whether to run tests'
        required: false
        default: true
        type: boolean

jobs:
  conditional:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          ref: ${{ inputs.branch }}
      
      - name: Always run step
        run: echo "This step always runs"
      
      - name: Conditional tests
        if: ${{ inputs.run_tests == true }}
        run: |
          echo "Running tests because run_tests=true"
          # Replace with actual test commands
          echo "Tests passed!"
      
      - name: Only on push events
        if: ${{ github.event_name == 'push' }}
        run: echo "This step only runs on push events"
      
      - name: Only on pull requests
        if: ${{ github.event_name == 'pull_request' }}
        run: echo "This step only runs on pull request events"
      
      - name: Only on main branch
        if: ${{ github.ref == 'refs/heads/main' }}
        run: echo "This step only runs on the main branch"
```

**Steps explanation:**
1. Add a boolean input parameter `run_tests` to control whether tests should run
2. Use `if: ${{ inputs.run_tests == true }}` to conditionally execute the test step
3. Use the `github.event_name` context to run steps only for specific events
4. Use the `github.ref` context to run steps only on specific branches

## Bonus Task: Composite Reusable Workflow

```yaml
# .github/workflows/composite-template.yml
name: Composite Workflow

on:
  workflow_call:
    inputs:
      environment:
        required: false
        default: 'production'
        type: string

jobs:
  lint:
    uses: your-username/workflow-templates/.github/workflows/lint-template.yml@main
  
  test:
    needs: lint
    uses: your-username/workflow-templates/.github/workflows/test-template.yml@main
    with:
      run_coverage: true
  
  build:
    needs: test
    uses: your-username/workflow-templates/.github/workflows/build-template.yml@main
  
  deploy:
    needs: build
    uses: your-username/workflow-templates/.github/workflows/deploy-template.yml@main
    with:
      environment: ${{ inputs.environment }}
    secrets:
      DEPLOY_TOKEN: ${{ secrets.DEPLOY_TOKEN }}
```

**Steps explanation:**
1. Create a composite workflow that calls multiple other reusable workflows
2. Set up dependencies between jobs with `needs`
3. Pass inputs and secrets to the individual workflows as needed
4. Build a complete CI/CD pipeline using modular, reusable components

## Matrix Strategy Example

```yaml
# .github/workflows/matrix-template.yml
name: Matrix Test Workflow

on:
  workflow_call:
    inputs:
      node-versions:
        description: 'Node.js versions to test'
        required: false
        default: '["14", "16", "18"]'
        type: string
      operating-systems:
        description: 'Operating systems to test'
        required: false
        default: '["ubuntu-latest", "windows-latest", "macos-latest"]'
        type: string

jobs:
  test:
    runs-on: ${{ matrix.os }}
    strategy:
      matrix:
        os: ${{ fromJSON(inputs.operating-systems) }}
        node: ${{ fromJSON(inputs.node-versions) }}
      fail-fast: false
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: ${{ matrix.node }}
      
      - name: Install dependencies
        run: npm ci
      
      - name: Run tests
        run: npm test
      
      - name: Report environment
        run: |
          echo "Tests completed on Node.js ${{ matrix.node }} and ${{ matrix.os }}"
```

**Steps explanation:**
1. Define matrix inputs as JSON strings
2. Parse the JSON strings using `fromJSON()` function
3. Set up a matrix strategy that tests across multiple:
   - Operating systems
   - Node.js versions
4. Configure `fail-fast: false` to continue runs even if one combination fails
5. Use matrix values with `${{ matrix.value }}` syntax in steps 