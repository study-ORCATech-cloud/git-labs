# LAB08 - Forks & Upstream Syncing

This lab introduces GitHub forks and upstream syncing. You'll learn how to contribute to external repositories, keep your fork in sync, and manage changes like an open-source contributor.

---

## 🎯 Objectives

By the end of this lab, you will:
- Fork a public GitHub repository
- Clone the fork to your local machine
- Add a new remote for the original ("upstream") repo
- Sync your fork with the upstream repository

---

## 🧰 Prerequisites

- GitHub account
- Familiarity with `git remote`, `push`, `pull`

---

## 📁 Lab Structure

```
LAB08-Forks-And-Upstream/
├── CONTRIBUTING.md (sample file to edit)
├── LAB.md
├── solutions.md
└── README.md
```

---

## 🚀 Getting Started

1. Review the `LAB.md` file, which contains a series of TODOs that will help you learn about forks and upstream syncing.

2. Complete each task in the exercise at your own pace.

3. If you get stuck, refer to the examples below or check the `solutions.md` file for guidance.

### Example: Fork a public GitHub repository

Go to https://github.com/some-org/demo-project → Click **Fork**

### Example: Clone your fork locally

```bash
git clone https://github.com/your-username/demo-project.git
cd demo-project
```

### Example: Add the original repo as an upstream remote

```bash
git remote add upstream https://github.com/some-org/demo-project.git
git remote -v
```

### Example: Make changes to a file

```bash
echo "Contributor: @your-username" >> CONTRIBUTING.md
git commit -am "Add contributor info"
git push origin main
```

### Example: Sync your fork with upstream

```bash
git fetch upstream
git merge upstream/main
```
Or if you're using rebase:
```bash
git rebase upstream/main
```

---

## 🧪 Validation Checklist

✅ Forked and cloned a repository  
✅ `upstream` remote configured  
✅ Changes pushed to your fork  
✅ Upstream synced via merge or rebase

---

## 🧹 Cleanup
```bash
cd ..
rm -rf demo-project
```
Delete your fork from GitHub if no longer needed.

---

## 🧠 Concepts to Remember
- Forks are used to contribute to repositories you don't own
- `upstream` tracks the original project
- Keep your fork updated to avoid merge conflicts

---

## 💬 What's Next?
Move on to [LAB09 - Issues and Project Boards](../LAB09-Issues-And-Boards/) to manage issues and plan your work.

Fork it. Sync it. Contribute wisely. 🍴🔄🌐

