# LAB10 - GitHub Actions Basics

In this lab, you'll explore GitHub Actions — GitHub’s built-in CI/CD automation platform. Learn how to create a basic workflow that runs automatically when code is pushed.

---

## 🎯 Objectives

By the end of this lab, you will:
- Understand the purpose of GitHub Actions
- Create a basic workflow that runs on `push`
- Run a job that echoes messages and tests code
- View workflow results in the Actions tab

---

## 🧰 Prerequisites

- GitHub repository (public or private)
- Basic YAML knowledge
- A file to work with (e.g., `main.py`)

---

## 📁 Lab Structure

```
LAB10-GitHub-Actions-Basics/
├── .github/workflows/main.yml
├── main.py
└── README.md
```

---

## 🚀 Getting Started

1. **Create the following folder structure in your repo:**
```bash
mkdir -p .github/workflows
```

2. **Create a file named `.github/workflows/main.yml` with this content:**
```yaml
name: Basic Workflow

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v3

      - name: Echo greeting
        run: echo "Hello from GitHub Actions!"

      - name: Run Python script
        run: python main.py
```

3. **Create a `main.py` file that prints something:**
```python
print("This is an automated test from GitHub Actions!")
```

4. **Push to GitHub and check the Actions tab.**

---

## 🧪 Validation Checklist

✅ Workflow file created under `.github/workflows/`  
✅ Workflow triggered on `git push`  
✅ All steps executed successfully  
✅ Output visible in GitHub Actions tab

---

## 🧹 Cleanup
- You can disable the workflow or delete the `.github/workflows` folder if needed.

---

## 🧠 Concepts to Remember
- GitHub Actions workflows are written in **YAML**
- Jobs run in parallel by default
- You can add matrix builds, secrets, and environment conditions later

---

## 💬 What’s Next?
Next: [LAB11 - Git Hooks](../LAB11-Git-Hooks/) to explore local Git automation for pre-commit, post-merge, and more.

Automate like a DevOps pro! 🤖🚀📦