This is about git the vcs.

- [Viewing history](#viewing-history)
  - [Viewing history for branches and remotes](#viewing-history-for-branches-and-remotes)
  - [Filter by time and frequency](#filter-by-time-and-frequency)
  - [Filter by text](#filter-by-text)
  - [Formatting](#formatting)
- [Keys, Signing and Authentication](#keys-signing-and-authentication)
  - [Creating SSH key for github](#creating-ssh-key-for-github)
  - [Signing commits with GPG key](#signing-commits-with-gpg-key)

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