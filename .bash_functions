
# -----------------
# --- FUNCTIONS ---
# -----------------

# hard reset git repo
function rr() {
    git branch | grep -q "main"

    if [ $? -eq 0 ]; then
        GitSource="main"
    else
        GitSource="master"
    fi

    COL1='\e[38;5;215m'
    COL2='\e[38;5;223m'
    CLEARCOL='\e[38;5;240m'

    echo -e "${COL1}# - - - - - - - - - - - - - - - -${CLEARCOL}"
    echo -e "${COL1}# - GIT CLEANUP : FETCH & RESET -${CLEARCOL}"
    echo -e "${COL1}# - - - - - - - - - - - - - - - -${CLEARCOL}"
    echo

    echo -e "${COL1}# fetch data from origin${CLEARCOL}"
    echo -e "${COL2}$ git fetch origin${CLEARCOL}"
    git fetch origin
    echo

    echo -e "${COL1}# do a hard reset${CLEARCOL}"
    echo -e "${COL2}$ git reset --hard origin/$GitSource${CLEARCOL}"
    git reset --hard origin/$GitSource
    echo

    echo -e "${COL1}# pull current data${CLEARCOL}"
    echo -e "${COL2}$ git pull${CLEARCOL}"
    git pull
}

# Change directory & list files
function cl {
  DIR="$*";
	# if no DIR given, go home
	if [ $# -lt 1 ]; then 
		DIR=$HOME;
    fi;
    cd "${DIR}" && \
    # use your preferred ls command
	ls
}

# Make directory & enter it
function mkcd {
  mkdir -p $1
  cd $1
}

# Make directory, move files & enter it
function mvd {
  mkdir -p ${@[$#]}
  mv $*
  cd ${@[$#]}
}

# Make directory, copy files & enter it
function cpd {
  mkdir -p ${@[$#]}
  cp -r $*
  cd ${@[$#]}
}

# Move up folders
# e.g:
#   up   -> cd ../
#   up 2 -> cd ../../
#   up 3 -> cd ../../../
function up {
  local count=$1
  if [ -z "${count}" ]; then
    count=1
  fi
  local path=""
  for i in $(seq 1 ${count}); do
    path="${path}../"
  done
  path=$(echo $path | sed 's/^\///')
  cd $path
}

# Decompress just about any compressed file format
function extract {
  if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
    echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
    return 1
  else
    for n in $@
    do
      if [ -f "$n" ] ; then
        case "${n%,}" in
          *.tar.bz2|*.tar.gz|*.tar.xz|*.tbz2|*.tgz|*.txz|*.tar) 
                      tar xvf "$n"       ;;
          *.lzma)     unlzma ./"$n"      ;;
          *.bz2)      bunzip2 ./"$n"     ;;
          *.rar)      unrar x -ad ./"$n" ;;
          *.gz)       gunzip ./"$n"      ;;
          *.zip)      unzip ./"$n"       ;;
          *.z)        uncompress ./"$n"  ;;
          *.7z|*.arj|*.cab|*.chm|*.deb|*.dmg|*.iso|*.lzh|*.msi|*.rpm|*.udf|*.wim|*.xar)
                      7z x ./"$n"        ;;
          *.xz)       unxz ./"$n"        ;;
          *.exe)      cabextract ./"$n"  ;;
          *)
          echo "extract: '$n' - unknown archive method"
          return 1
          ;;
        esac
      else
        echo "'$n' - file does not exist"
        return 1
      fi
    done
  fi
}
