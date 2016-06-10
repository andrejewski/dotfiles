
PS1="λ:\W "
ulimit -n 1024 # max open files

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Load bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
  __git_complete g __git_main
  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWSTASHSTATE=true
  GIT_PS1_SHOWUNTRACKEDFILES=true
  GIT_PS1_STATESEPARATOR=''
  PS1="λ\$(__git_ps1 '(%s)'):\W "
fi

# @chris exports
export EDITOR='mvim'
export BROWSER='google-chrome'

# @chris aliases
alias c='pwd'             # current directory
alias b='cd -'            # back to last dir
alias D='d && d'          # go to ~/ then d $1
alias l='ls -GFh'         # pretty print ls
alias L='l -a'            # pretty list all
alias o='open'            # open in finder
alias e='$EDITOR'         # open in editor
alias g='git'             # git shortcut
alias q='clear'           # clear bash

alias md='mkdir -p'       # make directory
alias mf='touch'          # make file

alias rd='rmdir'          # remove directory
alias rf='rm'             # remove file
alias rr='rm -rf'         # remove all

alias ve='e ~/.vimrc'     # .vimrc edit
alias ee='e ~/.emacs'     # .emacs edit
alias ge='e ~/.gitconfig' # .gitconfig edit

alias be='e ~/.bashrc'    # .bashrc edit
alias br='. ~/.bashrc'    # .bashrc reload

alias ux='chmod u+x'      # make executable

alias caf='caffeinate'    # spelling is hard

alias mg='mongod'
alias rs='redis-server'
alias hs='http-server'

# emacs
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'
# vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# @chris nodejs/npm
alias Npm='npm --silent'
alias ni='npm install'
alias nis='ni -S'
alias nid='ni -D'
alias nu='npm update'
alias ns='Npm start'
alias nt='Npm test'
alias nr='Npm run'
alias np='e package.json'

# @chris osx/finder
alias dotfiles='defaults write com.apple.finder AppleShowAllFiles YES && killall Finder'
alias notfiles='defaults write com.apple.finder AppleShowAllFiles NO && killall Finder'

# @chris jekyll
alias jks='o http://localhost:4000 && jekyll serve --watch'
alias jkb='jekyll build'

# @chris functions

# Down (d)
# @doc: breadth-search-first change directory
# @usage:
#   d               => cd
#   d dir_name      => cd dir_name
#   d deep_dir_name => cd .. ls .. (cd .. ls ..) cd deep_dir_name
d() {
  if [[ -z $1 ]] ; then
    cd
  else
    local p=$1
    local i=*/
    while [ ! -d $p ] ; do
      if [[ $i == "*/*/*/*/*/*/" ]] ; then
        break
      fi
      i=$i*/
      for dir in $i ; do
        local name=${dir%/}
        if [[ ${name##*/} == $1 ]] ; then
          p=$dir
          break
        fi
      done
    done
    cd $p
  fi
}

# Up (u)
# @doc: upward directory traversal
# @usage:
#   u             => go up one directory
#   u N           => go up N directories
#   u dir_name    => go up to directory dir_name
u() {
  re="[0-9]+$"
  if [[ -z $1 ]] ; then
    cd ..
  elif [[ $1 =~ $re ]] ; then
    local d=..
    local limit=$1
    for ((i=1 ; i < limit ; i++)) ; do
      d=$d/..
    done
    cd $d
  else
    cd "${PWD/\/$1\/*//$1}"
  fi
}

# Pasteboard (pb)
# @doc: get/set for system clipboard
# @usage:
#   pb        => paste from clipboard
#   pb text   => copy text to clipboard
pb() {
  if [[ -z $1 ]] ; then
    pbpaste
  else
    printf $1 | pbcopy
  fi
}

mc() {
  mkdir -p $1
  cd $1
}

co() {
  make --always-make $@
  ./$1
}

bo() {
  c++ $1.cpp -o $1 $(pkg-config --libs tesseract lept opencv3)
  ./$1
}

aq() {
  ag -Q "$@"
}

