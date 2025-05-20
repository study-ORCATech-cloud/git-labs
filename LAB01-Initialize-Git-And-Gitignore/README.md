# LAB01 - Initialize Git & Setup .gitignore

This first lab introduces you to the very beginning of a Git-powered project. You'll learn how to create a Git repository, check its status, and configure `.gitignore` to manage untracked files.

---

## 🎯 Objectives

By the end of this lab, you will:
- Initialize a new Git repository locally
- Understand the role of the `.git` directory
- Create and apply a `.gitignore` file
- Track and commit your first files

---

## 🧰 Prerequisites

- Git installed on your system
- Basic terminal knowledge

---

## 📁 Lab Structure

```
LAB01-Initialize-Git-And-Gitignore/
├── .gitignore
├── example.txt
├── LAB.md
├── solutions.md
└── README.md
```

---

## 🚀 Getting Started

1. Review the `LAB.md` file, which contains a series of TODOs that will help you learn Git initialization and .gitignore setup.

2. Complete each task in the exercise at your own pace.

3. If you get stuck, refer to the examples below or check the `solutions.md` file for guidance.

### Example: Initialize Git repository

```bash
mkdir my-git-lab
cd my-git-lab
git init
```
You will now see a `.git/` directory created. This is your local repository.

### Example: Create a sample file

```bash
echo "Hello, Git!" > example.txt
```

### Example: Create a `.gitignore` file

```bash
echo "*.temp" >> .gitignore
echo "*.log" >> .gitignore
```
This ensures ignored files won't be tracked by Git.

### Example: Check status and add files

```bash
git status
git add .
```

### Example: Commit your changes

```bash
git commit -m "Initial commit with example.txt and .gitignore"
```

---

## 🧪 Validation Checklist

✅ `.git` directory created  
✅ `.gitignore` file includes proper patterns  
✅ Files added and committed  
✅ `git status` shows clean working directory

---

## 🧹 Cleanup
Delete the repo directory when done:
```bash
cd ..
rm -rf my-git-lab
```

---

## 🧠 Concepts to Remember
- Git only tracks files *after* you `git add` them
- `.gitignore` helps avoid committing temp/log files
- The `.git` folder contains your repository history

---

## 💬 What's Next?
Move on to [LAB02 - Commit and History](../LAB02-Commit-And-History/) to explore Git logs, diffs, and history navigation.

Happy tracking! 🧠📁🧾

