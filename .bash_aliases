
# ---------------
# --- ALIASES ---
# ---------------

# ls and variants
alias ls='ls -vph --color=auto --group-directories-first --time-style="+%F, %T  "'
alias l="ls"
# Sort resources by file size
alias lt='ls --size -1 -S --classify'
# Gets an ordered list of files and folders by changes in time
alias lc='ls -t -1 -long'
# Gets a list of existing directories from current folder
alias ld='ls -d */'
# add dir for vertical listing
alias dir='ls -1'
# Use a long listing format
alias ll='ls -la'
# List by modification time
alias lst='ls -trw1'
# Show hidden files
alias l.='ls -d .*'

# Gets a total recursirve count of existing files, no folders
alias count='find . -type f | wc -l'

# A quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias 1d="cd .."
alias 2d="cd ..;cd .."
alias 3d="cd ..;cd ..;cd .."
alias 4d="cd ..;cd ..;cd ..;cd .."
alias 5d="cd ..;cd ..;cd ..;cd ..;cd .."

# Get rid of command not found
alias cd..='cd ..'
alias wcho='echo'
alias gerp='/bin/grep'
alias mroe='/bin/more'

# Some directories
alias home='cd ~'
alias root='cd /'
alias desk='cd ~/Desktop'
alias down='cd ~/Downloads'
alias remminafolder='cd ~/.local/share/remmina'

# history
alias h="history | sed 's/^[ ]*[0-9]\+[ ]*//'"
alias h10="history 10"
alias h20="history 20"
alias h30="history 30"
# search history
alias hg='history | grep $1'

# More shortcuts
alias c='clear'
alias t='time'
# shows the "real" path in bash, not the path via symlinks
alias p='pwd -P'  

# chown current dir
alias own="sudo chown -R $USER"

# Colorize the grep command output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# New commands for path & time
alias path='echo -e ${PATH//:/\\n}'
alias now='date +"%T"'

# Set defaults
alias vi='vim'
alias v='vim'
alias df='df -H'
alias du='du -ch'
alias top='htop'
alias mkdir='mkdir -pv'

# Find a file recursively
alias f='find . |grep '
# Find large files
alias largefiles="find . -xdev -type f -size +50M -printf '%s\t%k\t%p\n' | numfmt --field=1 --from=iec --to=si --padding=8 | sort -rh | head -20"
# diskspace info
alias diskspace="du -S | sort -n -r | more"
# Gives you what is using the most space. Both directories and files. Varies on current directory
alias most='du -hsx * | sort -rh | head -10'

# Show open ports
alias ports='netstat -tulanp'
# Free and Used
alias meminfo="free -m -l -t"
# Get top process eating memory
alias psmem="ps auxf | sort -nr -k 4 | head -10"
# Get top process eating cpu
alias pscpu="ps auxf | sort -nr -k 3 | head -10"
# Quickly search all running programs
alias paux='ps aux | grep'

# Get hostname
alias myhost=$(hostname -f 2>/dev/null || hostname)

# For git
alias g='git'
alias gs='git status'
alias gb='git branch'
alias gr='git remote -v'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
# Gets a log info view in a single line format
alias gl='git log --oneline'
# Show all the branches in the tree format history with pointers
alias gld='git log -oneline -decorate -graph -all'
# Get commits list by DESC order
alias glf='git for-each-ref --sort=-committerdate'
# longer aliases for git
alias commit='git commit -m'
alias status='git status'
alias clone='git clone'
# Delete all local branches which have been merged
alias removemerged='git for-each-ref --format "%(refname:short)" refs/heads | grep -v "master\|main" | xargs git branch -D'
# folders
alias gitfolder='cd ~/git'
alias gitprojects='cd ~/git'

# reload shell
alias reload="source ~/.bashrc && echo 'bashrc reloaded...'"
# edit bashrc
alias edbash='vim ~/.bashrc'
