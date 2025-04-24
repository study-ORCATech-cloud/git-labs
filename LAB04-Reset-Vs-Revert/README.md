# LAB04 - Reset vs Revert

In this lab, you’ll explore two essential Git commands for undoing changes: `reset` and `revert`. Knowing when and how to use each helps you recover cleanly from mistakes without damaging your project history.

---

## 🎯 Objectives

By the end of this lab, you will:
- Understand the difference between `git reset` and `git revert`
- Use `reset` to move the HEAD and staging area
- Use `revert` to safely undo a commit in public history
- Practice both techniques in a controlled project

---

## 🧰 Prerequisites

- Completion of LAB03 (Branching Basics)
- Comfort using `git log`, `commit`, `diff`, and `branch`

---

## 📁 Lab Structure

```
LAB04-Reset-Vs-Revert/
├── app.py
└── README.md
```

---

## 🚀 Getting Started

1. **Setup your project folder:**
```bash
mkdir reset-vs-revert-lab
cd reset-vs-revert-lab
git init
echo "print('v1')" > app.py
git add app.py
git commit -m "v1: initial commit"
```

2. **Make and commit a second version:**
```bash
echo "print('v2')" > app.py
git commit -am "v2: second version"
```

3. **Make and commit a third version:**
```bash
echo "print('v3')" > app.py
git commit -am "v3: third version"
```

4. **Use `git log` to see history:**
```bash
git log --oneline
```
Take note of the commit hashes for the next steps.

---

## 🔁 Option A: Use `reset` to go back in time (rewrites history)
```bash
git reset --hard HEAD~1
```
You’ve erased the latest commit (`v3`). **Use this only on local/private branches.**

---

## 🔁 Option B: Use `revert` to undo a commit (preserves history)
```bash
git revert HEAD
```
This creates a new commit that undoes the last one — useful for shared/public branches.

---

## 🧪 Validation Checklist

✅ Created multiple commits for a file  
✅ Practiced `git reset` and verified effect with `log`  
✅ Practiced `git revert` and verified new commit added  
✅ Verified file contents reflect undo actions

---

## 🧹 Cleanup
```bash
cd ..
rm -rf reset-vs-revert-lab
```

---

## 🧠 Concepts to Remember
- `git reset` = erase commit(s) and possibly files (destructive)
- `git revert` = create new commit that undoes another (safe)
- Never use `reset` on branches others depend on!

---

## 💬 What’s Next?
Move on to [LAB05 - Stashing and Tagging](../LAB05-Stashing-And-Tagging/) to manage temporary changes and mark versions.

Undo without fear — Git’s got your back! ⏪🧼🔁

