# LAB15 - GitHub API with Python

In this final GitHub lab, you'll use Python to interact with GitHub's REST API. This allows you to automate tasks like creating issues, listing repositories, and managing collaborators — all from code.

---

## 🎯 Objectives

By the end of this lab, you will:
- Authenticate with GitHub using a personal access token
- Send HTTP requests to GitHub’s REST API
- Automate common GitHub tasks using Python scripts

---

## 🧰 Prerequisites

- GitHub account
- Personal access token with `repo` scope ([Create Token](https://github.com/settings/tokens))
- Python 3.8+

---

## 📁 Lab Structure

```
LAB15-GitHub-API-With-Python/
├── github_api_script.py
├── requirements.txt
└── README.md
```

---

## 🚀 Getting Started

1. **Export your GitHub token as an environment variable:**
```bash
export GITHUB_TOKEN="your-token-here"
```

2. **Install dependencies:**
```bash
pip install requests
```

3. **Create the script:**
```python
# github_api_script.py
import os
import requests

GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
headers = {"Authorization": f"Bearer {GITHUB_TOKEN}"}

# Example: List your repositories
response = requests.get("https://api.github.com/user/repos", headers=headers)

for repo in response.json():
    print(f"{repo['name']} - {repo['html_url']}")
```

4. **Run the script:**
```bash
python github_api_script.py
```

---

## 🧪 Validation Checklist

✅ Token securely stored as environment variable  
✅ Script retrieves and lists GitHub repos  
✅ Able to modify script to create issues or more

---

## 🧹 Cleanup
- Delete your PAT if it was only for this test
- Remove temporary scripts if needed

---

## 🧠 Concepts to Remember
- GitHub’s REST API is accessible via HTTP with tokens
- Use Python and `requests` for quick automation
- Secure tokens using environment variables, not in code

---

## 🎉 Congratulations!
You've completed all Git & GitHub automation labs. You now have the skills to manage repositories, collaborate efficiently, and automate GitHub using the CLI, Actions, and API.

Code it. Automate it. Own your GitHub workflow! 🐙🚀🐍

