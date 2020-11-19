---
title: "Git"
description: "Some quick reference to Git."
date: 2020-09-29
draft: false
weight: 1
---
Git can be useful when you build a version-control system to track changes in source code.

+ Commit all modification and added files: `git commit -am "informative message"`
+ To show all the history of a file: `git log -p -- file`
+ To retrieve a specific version of a file: `git show COMMIT:file`
+ Revert repo to a specific commit: `git checkout COMMIT`
+ Undo a commit: `git reset HEAD~` and then for the real commit `git commit -c ORIG_HEAD`.
+ Update sub-modules: `git submodule update --init --recursive`
+ Add all untracked files: `git st -s | grep '??' | cut -f2 -d ' ' | xargs git add`
+ Add remote e.g. after a fork: `git remote add mine git@github.com:jmonlong/REPO.git`

### Aliases

~~~sh
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch
git config --global user.email '<EMAIL>'
git config --global user.name 'Yujuan Wang'
~~~

#### Branches

+ List branches: `git branch`
+ List all branches: `git branch -a`
+ Update remote branch list: `git remote prune origin`
+ Create branch: `git checkout -b hotfix`
+ Link it to a remote branch: `git branch -u origin/hotflix`
+ Creat a new local branch from remote: `git co -t origin/hotfix`
+ Merge the current branch with another branch: `git merge hotfix`
+ Delete a branch: `git branch -d hotfix`
+ Delete remote branch: `git push origin :hotfix`


### Check status of all repos

I have an alias calling the following commands:

~~~sh
WD=`pwd`
for ff in `find . -maxdepth 5 -name .git`
do
    GDIR=`dirname $ff`
    echo $GDIR
    cd $WD/$GDIR
    git st -s
    git st | grep ahead
done
cd $WD
~~~
