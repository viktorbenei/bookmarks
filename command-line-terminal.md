# Command Line / Terminal (Unix) commands

## Git

- nice looking git log graph in Terminal/Command Line: `git log --graph --decorate --all`
    - for more ideas see: http://stackoverflow.com/questions/1057564/pretty-git-branch-graphs
- git push a new branch, with automatic tracking (to avoid "fatal: The current branch feature/pr-test has no upstream branch"): `git config --global push.default current`
    - source: https://stackoverflow.com/a/22933955/974381
- "release notes" / commit summaries since last git tag: `git log $(git describe --tags --abbrev=0)..HEAD --oneline`


## Find (with grep) in files with extension

```
grep -r --include="*.rb" 'something' .
```

Finds .rb files which contain the text 'something' recursively starting in the current directory.

## Find large files

Find the top 5 largest files in the current directory and under:

```
du -a | sort -n -r | head -n 5
```

## GPG

Encrypt a message in an armored / text based format (easy to copy paste):

```
echo 'Some Secret Message' | gpg --armor --recipient 'RecipientNameID' -e
# or the short form:
echo 'Some Secret Message' | gpg -a -r 'RecipientNameID' -e
```

Decrypt:

```
gpg -d
# or
echo 'TheEncryptedSecretMessage' | gpg -d
```

Single line encrypt & decrypt test:

```
echo 'Some Secret Message' | gpg --armor --recipient 'RecipientNameID' -e | gpg -d
```

## Ubuntu

### In case some sites stop loading (but loads from another device on the same network)

A solution can be to do a restart of course, but better to just restart the `network-manager`:

```
sudo service network-manager restart
```
