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
├── feature.txt
├── LAB.md
├── solutions.md
└── README.md
```

---

## 🚀 Getting Started

1. Review the `LAB.md` file, which contains a series of TODOs that will help you learn about Git stashing and tagging.

2. Complete each task in the exercise at your own pace.

3. If you get stuck, refer to the examples below or check the `solutions.md` file for guidance.

### Example: Setup a new repo and commit base file

```bash
mkdir stash-tag-lab
cd stash-tag-lab
git init
echo "FEATURE: base version" > feature.txt
git add feature.txt
git commit -m "Initial commit"
```

### Example: Make changes but don't commit yet

```bash
echo "NEW FEATURE: in-progress feature" >> feature.txt
```

### Example: Stash the changes

```bash
git stash
```
This removes your working changes and saves them in a temporary stack.

### Example: Apply the stash back

```bash
git stash apply
```

### Example: Drop the stash

```bash
git stash drop
```

---

## 🏷️ Tagging Commits

### Example: Create a versioned tag on current commit

```bash
git tag v1.0.0
```

### Example: Create an annotated tag

```bash
git tag -a v1.0.1 -m "Stable version with hotfix"
```

### Example: List and show tags

```bash
git tag
git show v1.0.1
```

### Example: Checkout a tag (detached HEAD)

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

## 💬 What's Next?
Move on to [LAB06 - Clone and Push](../LAB06-Clone-And-Push/) to interact with remote repositories.

Save it. Tag it. Move fast. 🧳🏷️🔁