# LAB02 - Commit & History

In this lab, you'll deepen your understanding of Git by learning how to commit frequently, inspect commit history, and navigate your repository timeline.

---

## 🎯 Objectives

By the end of this lab, you will:
- Make multiple commits to track project changes
- Use `git log` to view commit history
- Understand commit hashes and messages
- View changes between versions using `git diff`

---

## 🧰 Prerequisites

- Completion of LAB01
- Basic Git knowledge: `init`, `add`, `commit`

---

## 📁 Lab Structure

```
LAB02-Commit-And-History/
├── main.py
├── LAB.md
├── solutions.md
└── README.md
```

---

## 🚀 Getting Started

1. Review the `LAB.md` file, which contains a series of TODOs that will help you learn about commit history and comparing versions.

2. Complete each task in the exercise at your own pace.

3. If you get stuck, refer to the examples below or check the `solutions.md` file for guidance.

### Example: Create a Git project and first commit

```bash
mkdir lab-commit-history
cd lab-commit-history
git init
echo "print('Version 1')" > main.py
git add main.py
git commit -m "Initial commit with Version 1"
```

### Example: Make a second change and commit

```bash
echo "print('Version 2')" > main.py
git add main.py
git commit -m "Update to Version 2"
```

### Example: View the commit history

```bash
git log --oneline
```

### Example: Inspect differences between versions

```bash
git diff HEAD~1 HEAD
```
This shows changes between the last two commits.

---

## 🧪 Validation Checklist

✅ Two or more commits created  
✅ `git log` shows readable commit history  
✅ `git diff` shows differences between versions  
✅ Meaningful commit messages used

---

## 🧹 Cleanup
```bash
cd ..
rm -rf lab-commit-history
```

---

## 🧠 Concepts to Remember
- Commits are **snapshots** of your project over time
- `git log` is your timeline
- Use `--oneline`, `--graph`, and `--decorate` for readable logs
- `git diff` compares versions before committing or between commits

---

## 💬 What's Next?
Move on to [LAB03 - Branching Basics](../LAB03-Branching-Basics/) to create and manage multiple development lines.

Track changes like a pro! 📝🔍⏳