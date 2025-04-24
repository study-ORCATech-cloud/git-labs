# LAB06 - Clone & Push

This lab teaches you how to work with remote repositories by cloning them and pushing changes back to GitHub or other Git servers. It’s your first hands-on step into remote collaboration.

---

## 🎯 Objectives

By the end of this lab, you will:
- Clone a repository from GitHub
- Make local changes and push to remote
- Understand the purpose of `origin` and remote URLs
- Use Git credentials or SSH to authenticate

---

## 🧰 Prerequisites

- Git installed and GitHub account
- GitHub CLI (`gh`) or ability to create repos via web

---

## 📁 Lab Structure

```
LAB06-Clone-And-Push/
├── hello.md
└── README.md
```

---

## 🚀 Getting Started

1. **Create a new GitHub repository (manually or using GitHub CLI):**
```bash
gh repo create my-remote-lab --public --clone
cd my-remote-lab
```

2. **Create a file and commit it:**
```bash
echo "# Hello GitHub" > hello.md
git add hello.md
git commit -m "Initial commit"
```

3. **Push your commit to GitHub:**
```bash
git push origin main
```

4. **View remote URL and remotes:**
```bash
git remote -v
```

5. **Clone the repo to a second location (optional):**
```bash
cd ..
git clone https://github.com/your-username/my-remote-lab.git cloned-lab
```

---

## 🧪 Validation Checklist

✅ Repository cloned or created successfully  
✅ File committed and pushed to GitHub  
✅ Remote `origin` configured and verified with `git remote -v`

---

## 🧹 Cleanup
```bash
rm -rf my-remote-lab cloned-lab
```
And optionally delete the GitHub repo.

---

## 🧠 Concepts to Remember
- `git remote` connects local Git to a hosted repository
- `origin` is the default name for a remote repo
- Push sends changes; pull fetches and merges them

---

## 💬 What’s Next?
Continue to [LAB07 - Branches and Pull Requests](../LAB07-Branches-And-Pull-Requests/) to collaborate with others via GitHub PRs.

Clone it. Push it. Share it. 🌍📤💻