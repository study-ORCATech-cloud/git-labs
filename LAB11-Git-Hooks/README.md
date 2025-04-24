# LAB11 - Git Hooks (Local Automation)

Git hooks allow you to automate tasks when specific Git events occur — like before a commit, after a merge, or before pushing. In this lab, you'll create a pre-commit hook that checks your code.

---

## 🎯 Objectives

By the end of this lab, you will:
- Understand what Git hooks are and how they work
- Create a `pre-commit` hook that runs checks before committing
- Use shell scripting to enforce rules

---

## 🧰 Prerequisites

- Git installed
- Bash or shell scripting environment
- Optional: `flake8` or `black` for linting checks

---

## 📁 Lab Structure

```
LAB11-Git-Hooks/
├── .git/hooks/pre-commit (created manually)
├── sample.py
└── README.md
```

---

## 🚀 Getting Started

1. **Initialize a repo and add a Python file:**
```bash
mkdir hooks-lab
cd hooks-lab
git init
echo "print('hello')" > sample.py
git add sample.py
git commit -m "Initial commit"
```

2. **Create a pre-commit hook:**
```bash
echo "#!/bin/bash" > .git/hooks/pre-commit
echo "echo Running pre-commit checks..." >> .git/hooks/pre-commit
echo "flake8 sample.py || exit 1" >> .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```
(You can replace `flake8` with `black --check` or any other command.)

3. **Make a change and try to commit again:**
```bash
echo "print('oops')" >> sample.py
git add sample.py
git commit -m "Bad commit"
```

4. **Fix lint issues and commit again:**
```bash
flake8 sample.py  # Check output
# Fix the issues manually, then:
git commit -m "Fixed and committed"
```

---

## 🧪 Validation Checklist

✅ Hook prevents bad commit  
✅ Message from hook is printed  
✅ File becomes committed only after passing the hook

---

## 🧹 Cleanup
```bash
cd ..
rm -rf hooks-lab
```

---

## 🧠 Concepts to Remember
- Git hooks are local to the repository (not synced to remotes)
- Useful for testing, formatting, signing, or validating commits
- Pre-commit, post-commit, post-merge are most common

---

## 💬 What’s Next?
Head to [LAB12 - GitHub CLI](../LAB12-GitHub-CLI/) to script and automate GitHub from your terminal.

Hook it. Check it. Automate locally. 🪝💡🧪