# Git Homework

## Task 1: `git commit -a -m`

### 1. Creating a Git Repository

**Commands Executed:**

```bash
mkdir -p ~/git_homework
cd ~/git_homework
git init
git branch -M main
git status
```

**Output:**

<img width="945" height="442" alt="image" src="https://github.com/user-attachments/assets/1793adce-6bcf-4309-872a-211d6db3045c" />


**Explanation:**

A Git repository was initialized and the default branch was renamed to `main`.

---

### 2. Using `git commit -m`

**Commands Executed:**

```bash
echo "First Git practice" > file1.txt
git status
git add file1.txt
git commit -m "Add first practice file"
git status
git log --oneline -1
```

**Output:**

<img width="938" height="420" alt="image" src="https://github.com/user-attachments/assets/9c9aff96-8647-4943-9a02-a5042f42cf5c" />


**Explanation:**

`git commit -m` creates a commit using the changes that have already been staged with `git add`. Since `file1.txt` was a new file, it had to be added to the staging area before committing.

---

### 3. Using `git commit -a -m`

The file was modified after it had already been tracked by Git.

**Commands Executed:**

```bash
echo "Second line added" >> file1.txt
git status
git commit -a -m "Update first practice file"
git status
git log --oneline -2
```

**Output:**

<img width="948" height="384" alt="image" src="https://github.com/user-attachments/assets/2fd4dd9f-13a4-4d9c-b98e-c328d458a2a4" />


**Explanation:**

`git commit -a -m` automatically stages modifications and deletions of **already tracked files** and commits them. It does not automatically add new untracked files.

The command successfully created:

```text
497cb46 Update first practice file
```

---

## Difference Between `git commit -m` and `git commit -a -m`

| Command                            | Description                                                     |
| ---------------------------------- | --------------------------------------------------------------- |
| `git commit -m "message"`          | Commits changes that have already been staged using `git add`.  |
| `git commit -a -m "message"`       | Automatically stages changes to tracked files and commits them. |
| `git commit -a -m` with a new file | Does not include a new untracked file.                          |

---

## Task 2: Git Cherry-Pick

### 1. Creating Commits on Main

Two additional commits were created on the `main` branch.

**Commands Executed:**

```bash
echo "Main branch - commit 3" > main3.txt
git add main3.txt
git commit -m "Add main branch file"

echo "Main branch - commit 4" > main4.txt
git add main4.txt
git commit -m "Add another main file"

git log --oneline --decorate
```

**Output:**

<img width="954" height="339" alt="image" src="https://github.com/user-attachments/assets/548112a0-9457-49c1-a60f-ea1249993a84" />


**Explanation:**

Four commits were created on the `main` branch, satisfying the requirement of having 2–4 commits before creating the new branch.

---

### 2. Creating a Feature Branch

**Command Executed:**

```bash
git checkout -b feature
git branch
```

**Output:**

<img width="949" height="106" alt="image" src="https://github.com/user-attachments/assets/795e3825-54ed-4835-ae28-80cd540a4b00" />


**Explanation:**

A new branch named `feature` was created from the `main` branch. The `*` symbol showed that the current branch was `feature`.

---

### 3. Creating Commits on Feature Branch

**Commands Executed:**

```bash
echo "Feature branch - commit 1" > feature1.txt
git add feature1.txt
git commit -m "Add feature one"

echo "Feature branch - commit 2" > feature2.txt
git add feature2.txt
git commit -m "Add feature two"

git log --oneline --decorate
```

**Output:**

<img width="954" height="388" alt="image" src="https://github.com/user-attachments/assets/a02c54c9-3a7e-4ca1-8a93-00b151a1e829" />


**Explanation:**

Two commits were created on the `feature` branch:

```text
3f0ba1b Add feature one
37aab8e Add feature two
```

The commit `3f0ba1b` was selected for cherry-picking.

---

### 4. Cherry-Picking a Specific Commit

First, the `main` branch was selected:

```bash
git checkout main
```

Then the specific commit was cherry-picked:

```bash
git cherry-pick 3f0ba1b
```

**Output:**

<img width="936" height="143" alt="image" src="https://github.com/user-attachments/assets/00bf2a20-6491-46de-a423-84bbd8fabca3" />


**Explanation:**

`git cherry-pick` applies the changes from a specific commit to the current branch.

The commit `3f0ba1b` from the `feature` branch was selected and successfully applied to `main`.

Git created a new commit:

```text
33c747d Add feature one
```

---

### 5. Verifying the Cherry-Pick

**Commands Executed:**

```bash
git log --oneline --decorate --all
ls -l
```

**Output:**

<img width="942" height="310" alt="image" src="https://github.com/user-attachments/assets/776a314f-2bb9-4e9a-9084-60a2016026ce" />


The resulting log included:

```text
33c747d (HEAD -> main) Add feature one
37aab8e (feature) Add feature two
3f0ba1b Add feature one
5d772c2 Add another main file
99a8112 Add main branch file
497cb46 Update first practice file
e304801 Add first practice file
```

The `ls -l` output showed:

```text
feature1.txt
file1.txt
main3.txt
main4.txt
```

`feature1.txt` is available on `main` because its commit was cherry-picked. `feature2.txt` is not present on `main`, showing that only the selected commit was applied.

---
