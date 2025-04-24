# LAB12 - GitHub CLI (gh)

The GitHub CLI (`gh`) is a powerful tool for managing your GitHub repositories, issues, PRs, and workflows directly from your terminal. In this lab, you’ll get started using `gh` to automate and simplify everyday GitHub operations.

---

## 🎯 Objectives

By the end of this lab, you will:
- Install and authenticate the GitHub CLI
- Create repositories, issues, and PRs using `gh`
- View notifications and manage projects from the CLI

---

## 🧰 Prerequisites

- GitHub account
- GitHub CLI installed ([Install Guide](https://cli.github.com/manual/installation))

---

## 📁 Lab Structure

```
LAB12-GitHub-CLI/
└── README.md
```

---

## 🚀 Getting Started

1. **Login to GitHub via CLI:**
```bash
gh auth login
```
Choose GitHub.com, HTTPS, and authenticate via browser.

2. **Create a new GitHub repo:**
```bash
gh repo create cli-lab --public --clone
cd cli-lab
echo "# CLI Lab" > README.md
git add README.md
git commit -m "Initial commit"
git push origin main
```

3. **Create an issue:**
```bash
gh issue create --title "Add contribution guide" --body "Write and add CONTRIBUTING.md"
```

4. **Create a pull request (PR):**
```bash
git checkout -b feature/contribution-doc
echo "Guidelines here." > CONTRIBUTING.md
git add .
git commit -m "Add CONTRIBUTING.md"
git push origin feature/contribution-doc
gh pr create --fill
```

5. **View and manage with `gh`**
```bash
gh issue list
gh pr list
gh repo view --web
```

---

## 🧪 Validation Checklist

✅ Authenticated with GitHub CLI  
✅ Created repo, issue, and PR using `gh`  
✅ Viewed issues and PRs from terminal

---

## 🧹 Cleanup
```bash
cd ..
rm -rf cli-lab
```
Optionally delete the repo on GitHub.

---

## 🧠 Concepts to Remember
- `gh` helps reduce context switching between browser and terminal
- You can script issue tracking, PR reviews, and repo management

---

## 💬 What’s Next?
Proceed to [LAB13 - Workflow Templates](../LAB13-Workflow-Templates/) to reuse GitHub Actions across projects.

Type less. Automate more. 🚀📟🐙

