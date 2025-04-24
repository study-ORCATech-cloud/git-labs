# LAB05 - Stashing & Tagging

In this lab, you'll learn how to temporarily save your uncommitted changes using `git stash`, and how to mark specific commits using tags. These tools help with task switching and version management.

---

## 🎯 Objectives

By the end of this lab, you will:
- Use `git stash` to temporarily shelve changes
- Apply or drop stashed changes
- Create lightweight and annotated tags
- List and checkout tags

---

## 🧰 Prerequisites

- Git installed
- Previous labs completed up to LAB04 recommended

---

## 📁 Lab Structure

```
LAB05-Stashing-And-Tagging/
├── feature.py
└── README.md
```

---

## 🚀 Getting Started

1. **Setup a new repo and commit base file:**
```bash
mkdir stash-tag-lab
cd stash-tag-lab
git init
echo "print('base version')" > feature.py
git add feature.py
git commit -m "Initial commit"
```

2. **Make changes but don’t commit yet:**
```bash
echo "print('in-progress feature')" >> feature.py
```

3. **Stash the changes:**
```bash
git stash
```
This removes your working changes and saves them in a temporary stack.

4. **Apply the stash back:**
```bash
git stash apply
```

5. **Drop the stash:**
```bash
git stash drop
```

---

## 🏷️ Tagging Commits

1. **Create a versioned tag on current commit:**
```bash
git tag v1.0.0
```

2. **Create an annotated tag:**
```bash
git tag -a v1.0.1 -m "Stable version with hotfix"
```

3. **List and show tags:**
```bash
git tag
git show v1.0.1
```

4. **Checkout a tag (detached HEAD):**
```bash
git checkout v1.0.0
```

---

## 🧪 Validation Checklist

✅ Changes successfully stashed and reapplied  
✅ Tags created, listed, and shown with `git tag`/`git show`  
✅ Able to switch to tag using `git checkout`

---

## 🧹 Cleanup
```bash
cd ..
rm -rf stash-tag-lab
```

---

## 🧠 Concepts to Remember
- `git stash` helps when switching branches mid-work
- Tags are used for release versions and milestones
- Annotated tags include metadata (author, message)

---

## 💬 What’s Next?
Move on to [LAB06 - Clone and Push](../LAB06-Clone-And-Push/) to interact with remote repositories.

Save it. Tag it. Move fast. 🧳🏷️🔁