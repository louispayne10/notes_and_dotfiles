This is about git the vcs.

- [Staging and commiting files](#staging-and-commiting-files)
- [Branches](#branches)
- [Remotes](#remotes)
- [Stash](#stash)
- [Viewing history](#viewing-history)
  - [Viewing history for branches and remotes](#viewing-history-for-branches-and-remotes)
  - [Filter by time and frequency](#filter-by-time-and-frequency)
  - [Filter by text](#filter-by-text)
  - [Formatting](#formatting)
- [Config](#config)
- [Keys, Signing and Authentication](#keys-signing-and-authentication)
  - [Creating SSH key for github](#creating-ssh-key-for-github)
  - [Signing commits with GPG key](#signing-commits-with-gpg-key)

## Staging and commiting files

Viewing staged/unstaged changes

        git status
        git diff
        git diff myfile.txt
        git diff --staged

Adding changes
        git add .
        git add -p      # open a prompt and asks if you want to stage changes or not
        git add -i      # interactively add changes

Removing changes, `git reset` will unstage changes and remove commits but not delete work. `git reset --hard` will discard changes and remove and discard commits:

        git reset HEAD # reset all staged changes
        git reset HEAD filename
        git reset HEAD -p # interactively pick changes to reset
        git checkout filename # discard local changes in a specific file
        git reset --hard HEAD  # discard all local changes in working directory

Commiting:

        git commit -m "commit message"
        git commit --amend

Reverting commits, this creates a new commit that is the opposite of a given commit:

        git revert HEAD      # revert latest commit
        git revert commit_id # revert specific commit

## Branches

        git branch             # list branches
        git branch branch_name # create new branch
        git checkout branch_name
        git branch -d branch_name # delete branch

To combine branches

        git merge branch_name   # merge history of branch currently in with the branch_name
        git rebase branch_name  # rebase history of branch currently in with the branch_name
        git rebase -i  branch_name # interactive rebase
        git mergetool # use configured merge tool to resolve conflicts

Abort a merge/rebase after conflicts

        git merge --abort
        git rebase --abort
        git rebase --continue # continue rebase after resolving conflicts

## Remotes

        git remote show origin             # see information about a remote
        git push remote_name branch_name   # push changes to a remote
        git fetch remote_name              # download data from remote
        git pull remote_name               # does a fetch and then tries to merge/rebase it
        git merge origin/main              # merge remote repo with a local one

## Stash

        git stash list
        git stash clear
        git stash
        git stash pop
        git stash drop stash_id
        git stash apply --index 2

## Viewing history

### Viewing history for branches and remotes

        git log
        git log branch_name
        git log remote_name/branch_name

### Filter by time and frequency

        git log -n 4           # last 4 commits
        git log --max-count=4  # last 4 commits
        git log --skip=2       # skip the first 2 commits
        git log --since="1 week ago"
        git log --until="yesterday"
        git log --author="Louis"
        git log --committer="Louis"

### Filter by text

        git log --grep="Fix stuttering"    # grep commit message
        git log -S"std::cout"              # grep code
        git log -G"std::*"                 # grep code (regex)
        git log -- file_name.txt           # filter by file

### Formatting

        git log --oneline
        git log --abbrev-commit
        git log --graph

## Config

Git has a configuration that can be controlled on a system, global or per repository basis (local). They override eachother with `local > global > system`. Local is for a specific repository. Global is for a user on a system. System is for all users on a system. The local config is in `.git/config`, the global config is in `~/.gitconfig` and the system config is at `/etc/gitconfig`.

        git config --global --list                   # list all global config
        git config --list --show-origin
        git config --local --list
        git config --system --list
        git config --global user.name "Louis Payne"  # Set global name
        git config --global user.email "a@example.com"
        git config --global core.editor vim
        git config --global commit.gpgsign true
        git config --global pull.rebase true

The `git-config` man page lists all the possible options for the configuration.

## Keys, Signing and Authentication

### Creating SSH key for github

This is not entirely about git. This is about generating and using a ssh key to authenticate with github rather than using a password. Most of this information was found [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/about-ssh).

1) Check for existing keys - could use them (if using them skip steps 2 and maybe 3/4)

        ls -al ~/.ssh

2) Generate new key

        ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

3) Start ssh-agent if not already running

        eval "$(ssh-agent -s)"

4) Add the SSH private key to the ssh agent

        ssh-add ~/.ssh/id_rsa

5) Add the SSH public key (`~/.ssh/id_rsa.pub`) to Github through the settings

6) Test the connection to Github!

        ssh -T git@github.com

### Signing commits with GPG key

Signing commits allows other people to be confident that the commit came from the person that it said it did. Most of this information was found [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification).

1) List current GPG keys (Could use one)

        gpg --list-secret-keys --keyid-format=long

2) Generate a new GPG key (**Must be 4096 bits!**). Use the same e-mail that is being used for any hosting services (like Github)

        gpg --full-generate-key

3) Get the GPG key ID in ASCII format

        gpg --list-secret-keys --keyid-format=long
        sec   4096R/3AA5C34371567BD2 2016-03-10 [expires: 2017-03-10]
        uid                          Hubot 
        ssb   4096R/42B317FD4BA89E7A 2016-03-10

in this output take the `3AA5C34371567BD2` and substitue it in the following

        gpg --armor --export 3AA5C34371567BD2

4) Copy this output into any third party services that need it

5) Tell git to use the signing key

        git config --global user.signingkey 3AA5C34371567BD2

6) Can sign by default by configuring

        git config --global commit.gpgsign true

Alternatively the `-S` flag for `git commit` will sign the commit. 

> When pull requests are merged/rebased on third party platforms they may not always keep the commit as signed. See [this](https://github.com/github/hub/issues/1241) issue on github about this.
