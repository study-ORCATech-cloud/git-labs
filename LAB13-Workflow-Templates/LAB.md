# LAB13 - Exercise: GitHub Actions Workflow Templates

Follow these steps to complete the lab:

## Task 1: Create a Template Repository
* Create a new GitHub repository named "workflow-templates" (or similar).
* Create the directory structure `.github/workflows/` in the repository.
* Create a file named `ci-template.yml` in the workflows directory.
* Define a reusable workflow using the `workflow_call` trigger.
* Add a basic job that runs on ubuntu-latest.
* Add a step that outputs a welcome message.

## Task 2: Add Parameters to Your Template
* Define input parameters for your reusable workflow using the `inputs` keyword.
* Add a parameter for specifying which branch to check out.
* Add a parameter for customizing the welcome message.
* Use these parameters in your workflow steps.
* Add default values for parameters where appropriate.

## Task 3: Add Outputs to Your Template
* Define outputs for your reusable workflow using the `outputs` keyword.
* Set up a job output that can be consumed by the calling workflow.
* Use the `steps.step-id.outputs` context to set the output value.
* Add a step that generates content to be used as output.

## Task 4: Create a Project Repository
* Create another GitHub repository that will use your template.
* Create the directory structure `.github/workflows/` in this repository.
* Create a file named `main.yml` in the workflows directory.
* Configure the workflow to trigger on push events.

## Task 5: Call the Reusable Workflow
* Add a job to `main.yml` that calls your template workflow.
* Use the `uses` keyword with the correct repository and file path.
* Pass values to the input parameters you defined in the template.
* Push your changes to trigger the workflow.
* Check the Actions tab to verify the workflow ran correctly.

## Task 6: Advanced - Secret Passing
* Update your template workflow to accept a secret parameter.
* Configure the template to use the secret in a secure way.
* Update the calling workflow to pass a GitHub secret to the template.
* Ensure the secret is handled securely throughout the workflow.

## Task 7: Advanced - Conditional Logic
* Add conditional logic to your template workflow using `if` expressions.
* Create a parameter that determines whether a specific step should run.
* Use the `github.event_name` context to conditionally execute steps.
* Test the conditional logic with different trigger events.

## Bonus Task
* Create a composite reusable workflow that calls multiple other reusable workflows.
* Implement a matrix strategy in a reusable workflow to test across multiple environments.
* Create a self-documenting reusable workflow that outputs its own usage information. 