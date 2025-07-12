# GIT

## Structure and Workflow
[Git Flow Video](https://www.youtube.com/watch?v=mZzmaC0pn1c)

- **Main Branch** for Finished Releases (tagged)
  - Occasional **Hotfix Branch** for urgent fixes to Main without going through QA/dev
- **Dev Branch** for working on the next Finished Release
  - Occasional **Release Branch** to QA/test a tentative release  
    (merges into Main and Dev if changes were made)
  - Short-lived **Feature Branches** that merge into Dev when feature is complete

### Notes
- Always disable fast-forward merges (`--no-ff`) to preserve merge history

```bash
git checkout dev
git merge --no-ff -m "Merge A into Dev" A
```

---

## Guidelines

### Before Any Commit

```bash
# Pull the latest changes from remote
git pull

# See what files were changed
git status

# Stage all changed files
git add .

# Or stage specific files
git add <file_path>

# Confirm staged files
git status

# Commit with a clear message
git commit -m "This is the commit message"

# Push changes to remote
git push
```

---

### Before Developing Any Features

```bash
# Create and switch to a new feature branch
git checkout -b <branch_name>
```

---

### Before Any Merge

```bash
# Switch to the branch you are merging into (e.g. dev)
git checkout dev

# Merge your branch (e.g. A) into dev with no fast forward
git merge --no-ff -m "Merge A into Dev" A
```

---

## Links
[Git Cheat Sheet (GitHub Education)](https://education.github.com/git-cheat-sheet-education.pdf)  
[Git Flow Video](https://www.youtube.com/watch?v=mZzmaC0pn1c)
