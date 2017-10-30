PS1="\[\e[96m\]\[\e[1m\]\w\[\e[0m\]\n\[\e[95m\]>\[\e[0m\] "
ulimit -n 2048 # max open files

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
  PS1="\[\e[96m\]\[\e[1m\]\w\[\e[0m\]\$(__git_ps1 ' \[\e[92m\]%s\[\e[0m\]')\n\[\e[95m\]>\[\e[0m\] "
fi

# @chris exports
export EDITOR='atom'
export BROWSER='google-chrome'

# @chris aliases
alias b='cd -'            # back to last dir
alias c='pwd'             # current directory
alias D='d && d'          # go to ~/ then d $1
alias e='$EDITOR'         # open in editor
alias g='git'             # git shortcut
alias k='clear'           # clear bash
alias l='ls -GFh'         # pretty print ls
alias L='l -a'            # pretty list all
alias o='open'            # open in finder

alias md='mkdir -p'       # make directory
alias mf='touch'          # make file

alias rd='rmdir'          # remove directory
alias rf='rm'             # remove file
alias rr='rm -rf'         # remove all

alias ge='e ~/.gitconfig' # .gitconfig edit

alias be='e ~/.bashrc'    # .bashrc edit
alias br='. ~/.bashrc'    # .bashrc reload

alias ux='chmod u+x'      # make executable

alias caf='caffeinate'    # spelling is hard

alias hs='http-server'

# @chris nodejs/npm
alias Npm='npm --silent'
alias ni='npm install'
alias nis='npm install --save'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias ns='Npm start'
alias nt='Npm test'
alias np='e package.json'

# unalias 'nr' if `br` causes a syntax error
nr() {
  if [[ -z $1 ]] ; then
    npm run
  else
    npm --silent run $@
  fi
}

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

alias jc='find . -name "*.class" -delete'
jo() {
  find . -name '*.class' -delete
  javac $1.java
  java $1
}

export PATH="$HOME/.yarn/bin:$PATH" # This links yarn

# added by travis gem
[ -f /Users/chrisandrejewski/.travis/travis.sh ] && source /Users/chrisandrejewski/.travis/travis.sh
