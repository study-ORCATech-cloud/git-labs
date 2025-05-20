# LAB07 - Branches & Pull Requests (PRs)

In this lab, you'll collaborate like a pro using **feature branches** and **pull requests** on GitHub. Learn how teams propose, review, and merge code changes in a clean and controlled way.

---

## 🎯 Objectives

By the end of this lab, you will:
- Create a branch and push it to GitHub
- Open a pull request (PR) on GitHub
- Review and merge a PR via the GitHub interface
- Delete stale branches after merge

---

## 🧰 Prerequisites

- Completion of LAB06 (Clone & Push)
- A GitHub repository and access to it

---

## 📁 Lab Structure

```
LAB07-Branches-And-Pull-Requests/
├── README.md
├── LAB.md
├── solutions.md
└── (cloned GitHub repo with multiple branches)
```

---

## 🚀 Getting Started

1. Review the `LAB.md` file, which contains a series of TODOs that will help you learn about branches and pull requests.

2. Complete each task in the exercise at your own pace.

3. If you get stuck, refer to the examples below or check the `solutions.md` file for guidance.

### Example: Clone or navigate to your GitHub repo

```bash
git clone https://github.com/your-username/feature-lab.git
cd feature-lab
```

### Example: Create and switch to a new feature branch

```bash
git checkout -b update-readme
echo "## More notes" >> README.md
git commit -am "Add section to README"
```

### Example: Push the branch to GitHub

```bash
git push origin update-readme
```

### Example: Open a pull request on GitHub
Go to the GitHub repo → "Compare & pull request" → Add message → Submit

### Example: Merge the PR using GitHub UI
- Approve and merge
- Optionally delete the `update-readme` branch after merge

---

## 🧪 Validation Checklist

✅ Branch pushed to GitHub  
✅ Pull request opened and merged  
✅ Changes reflected in `main` branch  
✅ Old branch deleted

---

## 🧹 Cleanup
```bash
cd ..
rm -rf feature-lab
```
And delete the repository on GitHub if desired.

---

## 🧠 Concepts to Remember
- Branches isolate work and support parallel development
- Pull Requests (PRs) are how changes are reviewed and approved
- GitHub UI simplifies merging and collaboration

---

## 💬 What's Next?
Advance to [LAB08 - Forks and Upstream](../LAB08-Forks-And-Upstream/) to contribute to external projects using forks and upstream remotes.

Push features. Merge cleanly. Collaborate confidently. 🌿🔃📦