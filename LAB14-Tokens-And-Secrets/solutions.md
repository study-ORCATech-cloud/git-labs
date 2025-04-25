# LAB14 - Solutions: GitHub Tokens & Secrets

Here are the solutions to the exercises:

## Task 1: Explore the GitHub Automatic Token

```yaml
# .github/workflows/github-token.yml
name: GitHub Token Demo

on:
  push:
    branches: [ main ]

jobs:
  repo-info:
    runs-on: ubuntu-latest
    steps:
      - name: Get Repository Info
        run: |
          echo "Repository: ${{ github.repository }}"
          echo "Owner: ${{ github.repository_owner }}"
          
          # Use GitHub API with GITHUB_TOKEN to get more info
          REPO_INFO=$(curl -s -H "Authorization: token ${{ secrets.GITHUB_TOKEN }}" \
            https://api.github.com/repos/${{ github.repository }})
          
          echo "Repository full name: $(echo $REPO_INFO | jq -r '.full_name')"
          echo "Stars: $(echo $REPO_INFO | jq -r '.stargazers_count')"
          echo "Forks: $(echo $REPO_INFO | jq -r '.forks_count')"
          echo "Created at: $(echo $REPO_INFO | jq -r '.created_at')"
```

**Steps explanation:**
1. Created a workflow file triggering on push to main branch
2. Added a job that uses the default `GITHUB_TOKEN`
3. Used `curl` with the token to make an authenticated GitHub API request
4. Retrieved and displayed repository information using `jq` to parse the JSON response
5. The token is automatically available as `secrets.GITHUB_TOKEN` without any setup

## Task 2: Understand Token Permissions

```yaml
# .github/workflows/github-token-permissions.yml
name: GitHub Token with Permissions

on:
  push:
    branches: [ main ]

# Define specific permissions for the GITHUB_TOKEN
permissions:
  contents: read    # Read access to repository contents
  issues: write     # Write access to issues

jobs:
  token-permissions:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: List Repository Files (read permission)
        run: ls -la
      
      - name: Create Issue (write permission)
        run: |
          # Create an issue using the GitHub API
          ISSUE_RESPONSE=$(curl -s -X POST \
            -H "Authorization: token ${{ secrets.GITHUB_TOKEN }}" \
            -H "Accept: application/vnd.github.v3+json" \
            https://api.github.com/repos/${{ github.repository }}/issues \
            -d '{
              "title": "Automated Issue from Workflow",
              "body": "This issue was created by a GitHub Actions workflow using GITHUB_TOKEN with issues:write permission.",
              "labels": ["automated"]
            }')
          
          ISSUE_NUMBER=$(echo $ISSUE_RESPONSE | jq -r '.number')
          ISSUE_URL=$(echo $ISSUE_RESPONSE | jq -r '.html_url')
          
          if [ "$ISSUE_NUMBER" != "null" ]; then
            echo "Issue #$ISSUE_NUMBER created successfully: $ISSUE_URL"
          else
            echo "Error creating issue: $(echo $ISSUE_RESPONSE | jq -r '.message')"
            exit 1
          fi
```

**Steps explanation:**
1. Added explicit `permissions` declaration for the workflow
2. Set `contents: read` for reading repository contents
3. Set `issues: write` for creating issues
4. Added a step that creates an issue using the GitHub API with the token
5. Validated the issue was created successfully

## Task 3: Create and Use Repository Secrets

```yaml
# .github/workflows/use-secrets.yml
name: Use Repository Secrets

on:
  push:
    branches: [ main ]

jobs:
  access-secrets:
    runs-on: ubuntu-latest
    steps:
      - name: Access Secret as Environment Variable
        run: |
          # The value is not printed, just the fact that it exists
          if [[ -n "$API_KEY" ]]; then
            echo "API_KEY is set and has length: ${#API_KEY}"
          else
            echo "API_KEY is not set"
            exit 1
          fi
        env:
          API_KEY: ${{ secrets.API_KEY }}
      
      - name: Use Secret with External API
        run: |
          # Example of how to use a secret with an external API
          # This doesn't actually call an API - it's just an example
          echo "Making secure API call..."
          # curl -s -H "Authorization: Bearer $API_KEY" https://api.example.com/data
          # Instead of actually making the call, we just simulate it
          echo "API call completed successfully"
        env:
          API_KEY: ${{ secrets.API_KEY }}
      
      - name: Pass Secret to an Action
        uses: actions/github-script@v6
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          script: |
            // Log a message - note that we're NOT logging the secret
            core.info('Using secrets securely in JavaScript actions');
            
            // Example of accessing another secret in a JavaScript action
            // Note: This doesn't actually log the secret - just checks it exists
            const apiKey = process.env.API_KEY;
            core.info(`API_KEY exists: ${apiKey.length > 0}`);
        env:
          API_KEY: ${{ secrets.API_KEY }}
```

**Steps explanation:**
1. Created a workflow to access and use repository secrets
2. Accessed the secret as an environment variable
3. Demonstrated how to use the secret with an external API (simulated)
4. Showed how to pass secrets to actions safely
5. Used best practices to never log the actual secret values

## Task 4: Work with Organization Secrets

```yaml
# .github/workflows/org-secrets.yml
name: Organization Secrets Demo

on:
  push:
    branches: [ main ]

jobs:
  use-org-secrets:
    runs-on: ubuntu-latest
    steps:
      - name: Access Organization Secret
        run: |
          # This assumes ORG_API_KEY is set at the organization level
          if [[ -n "$ORG_API_KEY" ]]; then
            echo "ORG_API_KEY is available"
            
            # Example of using an organization secret safely
            # curl -s -H "Authorization: Bearer $ORG_API_KEY" https://api.example.org/data
          else
            echo "ORG_API_KEY is not set - this is expected if not using an organization"
          fi
        env:
          ORG_API_KEY: ${{ secrets.ORG_API_KEY }}
      
      - name: Explain Secret Precedence
        run: |
          echo "Secret Precedence Rules:"
          echo "1. Repository secrets override organization secrets with the same name"
          echo "2. Environment secrets override repository and organization secrets"
          echo "3. Job-level secrets override step-level environment variables"
```

**Steps explanation:**
1. Created a workflow file for accessing organization secrets
2. Demonstrated how to access an organization-level secret
3. Provided information on secret precedence rules
4. Showed proper error handling when a secret might not be available

## Task 5: Create Environment-Specific Secrets

```yaml
# .github/workflows/environment-secrets.yml
name: Environment Secrets Demo

on:
  push:
    branches: [ main ]

jobs:
  use-env-secrets:
    runs-on: ubuntu-latest
    environment: production
    steps:
      - name: Use Production Environment Secret
        run: |
          # This assumes PRODUCTION_API_KEY is set in the "production" environment
          if [[ -n "$PRODUCTION_API_KEY" ]]; then
            echo "PRODUCTION_API_KEY is available for the production environment"
            echo "Key length: ${#PRODUCTION_API_KEY}"
            
            # Simulate using the key for deployment
            echo "Deploying to production environment..."
          else
            echo "PRODUCTION_API_KEY is not set - did you configure the environment?"
            exit 1
          fi
        env:
          PRODUCTION_API_KEY: ${{ secrets.PRODUCTION_API_KEY }}
```

**Steps explanation:**
1. Created a workflow that uses a specific environment ("production")
2. Configured the job to use that environment with `environment: production`
3. Accessed environment-specific secrets
4. Provided error handling for missing environment configuration
5. Demonstrated how to use environment secrets for deployment

## Task 6: Implement Secret Rotation Example

```yaml
# .github/workflows/secret-rotation.yml
name: Secret Rotation Demo

on:
  schedule:
    # Run weekly on Sunday at midnight
    - cron: '0 0 * * 0'
  workflow_dispatch:  # Allow manual trigger

jobs:
  rotate-secrets:
    runs-on: ubuntu-latest
    permissions:
      # Need admin:repo_hook to update repository secrets
      # This is a high-level permission, use with caution
      actions: write
    steps:
      - name: Generate New API Key
        id: generate-key
        run: |
          # This is a simulation - in a real scenario, you'd call your API
          # or service to generate a new key
          NEW_API_KEY=$(openssl rand -hex 20)
          echo "::add-mask::$NEW_API_KEY"  # Mask the key in logs
          echo "api_key=$NEW_API_KEY" >> $GITHUB_OUTPUT
      
      - name: Update Repository Secret
        uses: actions/github-script@v6
        with:
          github-token: ${{ secrets.TOKEN_WITH_ADMIN }}  # Would need a PAT with admin rights
          script: |
            core.info('Updating API_KEY secret...');
            
            // In a real scenario, you would use the GitHub API to update the secret
            // This requires a Personal Access Token with appropriate permissions
            // Example code (not functional without proper token):
            /*
            const sodium = require('tweetsodium');
            const { data } = await github.repos.getPublicKey({
              owner: context.repo.owner,
              repo: context.repo.repo,
            });
            
            const messageBytes = Buffer.from(process.env.NEW_API_KEY);
            const keyBytes = Buffer.from(data.key, 'base64');
            const encBytes = sodium.seal(messageBytes, keyBytes);
            const encrypted = Buffer.from(encBytes).toString('base64');
            
            await github.actions.createOrUpdateRepoSecret({
              owner: context.repo.owner,
              repo: context.repo.repo,
              secret_name: 'API_KEY',
              encrypted_value: encrypted,
              key_id: data.key_id,
            });
            */
            
            core.info('Secret rotation complete');
        env:
          NEW_API_KEY: ${{ steps.generate-key.outputs.api_key }}
```

**Steps explanation:**
1. Created a workflow that runs on a schedule (weekly) or can be triggered manually
2. Added a step to generate a new API key (simulated)
3. Used `::add-mask::` to prevent the key from being logged
4. Showed how you would update a repository secret (requires admin token)
5. Included commented code that demonstrates the actual encryption and API call needed
6. Explained that a PAT with admin rights would be needed for real implementation

## Task 7: Secure Secrets in Fork and Pull Request Workflows

```yaml
# .github/workflows/secure-pr-workflow.yml
name: Secure PR Workflow

on:
  pull_request:
    branches: [ main ]

jobs:
  secure-pr-job:
    runs-on: ubuntu-latest
    # Only run certain steps if the PR is from the same repository (not a fork)
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Run tests (safe for forks)
        run: |
          echo "Running tests that don't require secrets..."
          # Run tests that don't need authentication
      
      - name: Check if PR is from fork
        id: check-fork
        run: |
          if [[ "${{ github.event.pull_request.head.repo.full_name }}" != "${{ github.repository }}" ]]; then
            echo "is_fork=true" >> $GITHUB_OUTPUT
            echo "This PR is from a fork. Will skip steps that require secrets."
          else
            echo "is_fork=false" >> $GITHUB_OUTPUT
            echo "This PR is from the same repository. Can use secrets safely."
          fi
      
      - name: Steps requiring secrets (not accessible to forks)
        if: steps.check-fork.outputs.is_fork == 'false'
        run: |
          echo "Performing actions that require secrets..."
          # These steps only run for PRs from the same repository
          # API_KEY is accessible here
        env:
          API_KEY: ${{ secrets.API_KEY }}
      
      - name: Explain security measures
        run: |
          echo "Security measures for PRs:"
          echo "1. GitHub automatically withholds secrets from workflows triggered by forks"
          echo "2. Secrets are only available if the PR is from the same repository"
          echo "3. GITHUB_TOKEN for fork PRs has read-only permissions by default"
          echo "4. Use conditional steps to prevent exposure in fork contexts"
```

**Steps explanation:**
1. Created a workflow specific for pull requests
2. Added a step to identify if the PR is from a fork
3. Used conditional execution to only run secret-dependent steps for PRs from the same repo
4. Explained the security measures GitHub takes for PR workflows
5. Demonstrated best practices to prevent secret exposure in forks

## Bonus Task: Secret Masking and Validation

```yaml
# .github/workflows/secure-secret-handling.yml
name: Advanced Secret Handling

on:
  workflow_dispatch:

jobs:
  validate-and-mask:
    runs-on: ubuntu-latest
    steps:
      - name: Validate secret format
        id: validate
        run: |
          # Example: Validate that API_KEY has the expected format (starts with "sk_")
          if [[ "$API_KEY" != sk_* ]]; then
            echo "API_KEY does not have the expected format"
            exit 1
          fi
          
          # Validate API_KEY length
          if [[ ${#API_KEY} -lt 20 ]]; then
            echo "API_KEY is too short to be valid"
            exit 1
          fi
          
          echo "API_KEY validated successfully"
          
          # Create a masked version for safe display
          # GitHub automatically masks secrets, but this is an example of custom masking
          MASKED_KEY="${API_KEY:0:4}...${API_KEY: -4}"
          echo "masked_key=$MASKED_KEY" >> $GITHUB_OUTPUT
        env:
          API_KEY: ${{ secrets.API_KEY }}
      
      - name: Use validated secret
        run: |
          echo "Using validated API_KEY with prefix: ${API_KEY:0:4}..."
          echo "Masked version: ${{ steps.validate.outputs.masked_key }}"
          
          # Safely use the validated secret
        env:
          API_KEY: ${{ secrets.API_KEY }}
      
      - name: Demo additional masking
        run: |
          # Additional sensitive information generated during workflow
          # Use add-mask to ensure it doesn't appear in logs
          TEMP_TOKEN=$(openssl rand -hex 16)
          echo "::add-mask::$TEMP_TOKEN"
          
          echo "Generated token (should be masked): $TEMP_TOKEN"
          echo "Only the masked version is visible in logs"
```

**Steps explanation:**
1. Created an advanced workflow for secure secret handling
2. Added validation steps to ensure secrets match expected formats
3. Used `::add-mask::` to dynamically mask sensitive data generated during the workflow
4. Demonstrated how to create safely masked versions of keys for logs
5. Showed best practices for working with sensitive data in workflows 