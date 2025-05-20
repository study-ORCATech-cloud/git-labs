# LAB03 - Branching Basics

This lab introduces you to Git branching — a powerful way to develop features in isolation, experiment safely, and manage code changes independently before merging.

---

## 🎯 Objectives

By the end of this lab, you will:
- Create and switch between branches
- Understand branching for isolated feature development
- Merge branches using Git
- Resolve simple merge conflicts

---

## 🧰 Prerequisites

- Completion of LAB02 (Commit & History)
- Familiarity with `git add`, `commit`, `log`, and `diff`

---

## 📁 Lab Structure

```
LAB03-Branching-Basics/
├── main.txt
├── LAB.md
├── solutions.md
└── README.md
```

---

## 🚀 Getting Started

1. Review the `LAB.md` file, which contains a series of TODOs that will help you learn about Git branching and merging.

2. Complete each task in the exercise at your own pace.

3. If you get stuck, refer to the examples below or check the `solutions.md` file for guidance.

### Example: Initialize the repo and commit your base file

```bash
mkdir branching-lab
cd branching-lab
git init
echo "MAIN BRANCH" > main.txt
git add main.txt
git commit -m "Initial commit on main"
```

### Example: Create a new branch

```bash
git checkout -b feature-1
echo "MAIN BRANCH with FEATURE 1" > main.txt
git commit -am "Update from feature-1"
```

### Example: Switch back to `main` and make another change

```bash
git checkout main
echo "MAIN BRANCH updated" > main.txt
git commit -am "Main branch change"
```

### Example: Merge the feature branch

```bash
git merge feature-1
```
If a conflict occurs, Git will notify you to resolve it manually.

---

## 🧪 Validation Checklist

✅ Branch `feature-1` created and modified  
✅ `main` branch updated separately  
✅ Merge operation performed successfully  
✅ Conflicts (if any) resolved and committed

---

## 🧹 Cleanup
```bash
cd ..
rm -rf branching-lab
```

---

## 🧠 Concepts to Remember
- Use `git branch` to list and manage branches
- `checkout -b` creates and switches to a new branch
- Merging combines commit histories
- Conflicts require manual resolution

---

## 💬 What's Next?
Continue to [LAB04 - Reset vs Revert](../LAB04-Reset-Vs-Revert/) to learn how to undo changes safely.

Stay in your lane — branch it out! 🌿🔁🛠️