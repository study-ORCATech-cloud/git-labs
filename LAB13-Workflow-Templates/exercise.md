# LAB13 - Exercise: GitHub Actions Workflow Templates

Follow these steps to complete the lab:

## Task 1: Create a Template Repository
TODO: Create a new GitHub repository named "workflow-templates" (or similar).
TODO: Create the directory structure `.github/workflows/` in the repository.
TODO: Create a file named `ci-template.yml` in the workflows directory.
TODO: Define a reusable workflow using the `workflow_call` trigger.
TODO: Add a basic job that runs on ubuntu-latest.
TODO: Add a step that outputs a welcome message.

## Task 2: Add Parameters to Your Template
TODO: Define input parameters for your reusable workflow using the `inputs` keyword.
TODO: Add a parameter for specifying which branch to check out.
TODO: Add a parameter for customizing the welcome message.
TODO: Use these parameters in your workflow steps.
TODO: Add default values for parameters where appropriate.

## Task 3: Add Outputs to Your Template
TODO: Define outputs for your reusable workflow using the `outputs` keyword.
TODO: Set up a job output that can be consumed by the calling workflow.
TODO: Use the `steps.step-id.outputs` context to set the output value.
TODO: Add a step that generates content to be used as output.

## Task 4: Create a Project Repository
TODO: Create another GitHub repository that will use your template.
TODO: Create the directory structure `.github/workflows/` in this repository.
TODO: Create a file named `main.yml` in the workflows directory.
TODO: Configure the workflow to trigger on push events.

## Task 5: Call the Reusable Workflow
TODO: Add a job to `main.yml` that calls your template workflow.
TODO: Use the `uses` keyword with the correct repository and file path.
TODO: Pass values to the input parameters you defined in the template.
TODO: Push your changes to trigger the workflow.
TODO: Check the Actions tab to verify the workflow ran correctly.

## Task 6: Advanced - Secret Passing
TODO: Update your template workflow to accept a secret parameter.
TODO: Configure the template to use the secret in a secure way.
TODO: Update the calling workflow to pass a GitHub secret to the template.
TODO: Ensure the secret is handled securely throughout the workflow.

## Task 7: Advanced - Conditional Logic
TODO: Add conditional logic to your template workflow using `if` expressions.
TODO: Create a parameter that determines whether a specific step should run.
TODO: Use the `github.event_name` context to conditionally execute steps.
TODO: Test the conditional logic with different trigger events.

## Bonus Task
TODO: Create a composite reusable workflow that calls multiple other reusable workflows.
TODO: Implement a matrix strategy in a reusable workflow to test across multiple environments.
TODO: Create a self-documenting reusable workflow that outputs its own usage information. 