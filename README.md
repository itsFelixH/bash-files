# Bash Files

.bashrc, bash aliases, bash functions, ...

## Basics

The script `configure-bash.sh` creates some bash aliases and functions that might be helpful. The various files are sourced into your `~/.bashrc`:

```bash
source ~/bash-files/.bash_aliases
source ~/bash-files/.bah_functions
source ~/bash-files/.bash_config
```

Additional aliases or functions can be added to these files. Feel free to ask me questions via Discord or make suggestions on what I need to add here.

## Usage

Clone repo:
```
git clone https://github.com/itsFelixH/bash-files
```

Run in bash shell:
```
./bash-files/configure-bash.sh
```

## Functions

### rr-function

In the file `.bash_functions` you'll find the rr function. This function allows you to reset the current repository and revert to the Main/Master using the alias "rr" (reset repo).

*Example Output:*

```shell
$ rr
# - - - - - - - - - - - - - - - -
# - GIT CLEANUP: FETCH & RESET -
# - - - - - - - - - - - - - - - -

# fetch data from origin
$ git fetch origin

# do a hard reset
$ git reset --hard origin/master
HEAD is now at 6a1a642 fixing typos

# pull current data
$ git pull
Already up to date.
```

## Thanks

If you wish to say thanks, you can [buy me a coffee](https://ko-fi.com/cptneptun) or text me on Discord (`CptNeptun#9041`).
