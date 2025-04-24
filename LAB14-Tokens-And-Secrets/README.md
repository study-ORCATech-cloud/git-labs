# LAB14 - GitHub Tokens & Secrets

In this lab, you'll learn how to securely manage credentials and sensitive data in GitHub workflows using encrypted secrets and GitHub-provided tokens.

---

## 🎯 Objectives

By the end of this lab, you will:
- Understand the use of GitHub’s `GITHUB_TOKEN`
- Store secrets in your repository settings
- Access secrets within GitHub Actions workflows
- Use secrets to authenticate securely in jobs

---

## 🧰 Prerequisites

- GitHub repository with Actions enabled
- Basic familiarity with GitHub Actions and YAML syntax

---

## 📁 Lab Structure

```
LAB14-Tokens-And-Secrets/
├── .github/workflows/use-secrets.yml
└── README.md
```

---

## 🚀 Getting Started

1. **Add a new secret to your repository:**
   - Go to: GitHub → Your Repo → Settings → Secrets → Actions → "New repository secret"
   - Name: `MY_SECRET_TOKEN`
   - Value: `super-secret-value`

2. **Create a workflow file to use the secret:**
```yaml
# .github/workflows/use-secrets.yml
name: Secure Workflow
on: [push]

jobs:
  show-secret:
    runs-on: ubuntu-latest
    steps:
      - name: Access Secret
        run: echo "Using secret token: ${{ secrets.MY_SECRET_TOKEN }}"
        env:
          SECRET_VAR: ${{ secrets.MY_SECRET_TOKEN }}
```
> Note: Never log secrets in real-world projects. This echo is for demonstration only.

3. **Push your changes to trigger the workflow.**

---

## 🧪 Validation Checklist

✅ Secret created under repo settings  
✅ Accessed via `secrets.*` in the workflow  
✅ Secret passed to a job and available via `env`

---

## 🧹 Cleanup
- Delete test secrets from your repository after testing
- Remove or comment out sensitive output from workflow logs

---

## 🧠 Concepts to Remember
- Secrets are encrypted and never visible in logs (unless printed manually)
- `GITHUB_TOKEN` is auto-generated for each workflow run
- Use secrets to securely pass API tokens, credentials, etc.

---

## 💬 What’s Next?
Finish the series with [LAB15 - GitHub API with Python](../LAB15-GitHub-API-With-Python/) to programmatically interact with GitHub using authenticated requests.

Secure your automation. Vault it right. 🔐💡📦

