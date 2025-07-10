# GIT

## Structure and Workflow
[Git Flow Video](https://www.youtube.com/watch?v=mZzmaC0pn1c)
- Main Branch for Finished Releases (tagged)
- - Occasional Hotfix Branch for Main Branch fixes without needing to QA Dev branch
- Dev branch for woking on the next Finished Release
- - Occasional Release Branch to test tentative Finished Release, successful release branches merge into Main and Dev (if fixes were made during this phase)
- - Short lived Feature Branches that merge into Dev Branch when Feature is "done"

### Notes 
- when merging remember to disable fast forward (--no-ff)  
`git checkout dev`  
`git merge --no-ff -m "Merge A into Dev" A`

## Guidelines
### Before any commit

**Pull latest changes from remote:**  
`git pull`

**Check changed files:**  
`git status`

**Add changed files you want to stage:**  
`git add .`  
`git add <file_path>`

**Check again to confirm staging:**  
`git status`

**Commit your changes with a short, affirmative message:**  
`git commit -m "This is the commit message"`

**Push to remote:**  
`git push`

### Before developing any features
`git checkout -b <branch_name>`  

### Before any merge
**Change to "merge into" branch**  
`git checkout dev`  
**Merge without fast forward and name it appropriately**  
`git merge --no-ff -m "Merge A into Dev" A`

## Links
[Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)  
[Git Flow Video](https://www.youtube.com/watch?v=mZzmaC0pn1c)