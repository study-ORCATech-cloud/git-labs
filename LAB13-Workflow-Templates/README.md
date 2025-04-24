# LAB13 - GitHub Actions Workflow Templates

This lab introduces reusable **GitHub Actions workflow templates** — a powerful way to share common CI/CD patterns across multiple repositories.

---

## 🎯 Objectives

By the end of this lab, you will:
- Understand how reusable workflows work in GitHub Actions
- Create a `workflow_call` template
- Reference the template in another workflow file
- Trigger builds using shared logic

---

## 🧰 Prerequisites

- GitHub account and basic GitHub Actions knowledge
- At least two repositories (one for template, one to reuse it)

---

## 📁 Lab Structure

```
LAB13-Workflow-Templates/
├── template-repo/.github/workflows/ci-template.yml
├── project-repo/.github/workflows/main.yml
└── README.md
```

---

## 🚀 Getting Started

1. **Create a new repo named `template-repo` and add this file:**
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

2. **Push this to your `template-repo` on `main` branch.**

3. **In a second repo (`project-repo`), reference the template:**
```yaml
# .github/workflows/main.yml
name: Use Template
on: [push]

jobs:
  use-template:
    uses: your-username/template-repo/.github/workflows/ci-template.yml@main
```

4. **Push to `project-repo` and watch the action run via Actions tab.**

---

## 🧪 Validation Checklist

✅ Template defined in `template-repo` using `workflow_call`  
✅ Referenced correctly in `project-repo`  
✅ Triggered on push and completed successfully  
✅ Output shown from shared job

---

## 🧹 Cleanup
- Optionally delete both repos if no longer needed.

---

## 🧠 Concepts to Remember
- Reusable workflows save time and enforce consistency
- Use `workflow_call:` to define a callable template
- Ideal for CI/CD, testing, linting logic reused across repos

---

## 💬 What’s Next?
Advance to [LAB14 - Tokens and Secrets](../LAB14-Tokens-And-Secrets/) to secure workflows and automation with GitHub secrets.

Build once. Reuse everywhere. 🧩⚙️🌍