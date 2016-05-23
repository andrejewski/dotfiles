
PS1='λ:\W '
ulimit -n 1024 # max open files

 # Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# emacs
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs'

# @chris exports
export EDITOR='mvim'
export BROWSER='google-chrome'

# @chris aliases
alias c='pwd'           # current directory
alias b='cd -'          # back to last dir
alias D='d && d'        # go to ~/ then d $1
alias l='ls -GFh'       # pretty print ls
alias o='open'          # open in finder
alias e='$EDITOR'       # open in editor
alias q='clear'         # clear bash

alias md='mkdir'        # make directory
alias mf='touch'        # make file

alias rd='rmdir'        # remove directory
alias rf='rm'           # remove file
alias rr='rm -rf'       # remove all

alias ve='e ~/.vimrc'   # .vimrc edit
alias ee='e ~/.emacs'   # .emacs edit

alias be='e ~/.bashrc'  # .bashrc edit
alias br='. ~/.bashrc'  # .bashrc reload

alias ux='chmod u+x'    # make executable

alias cf='caffeinate'   # spelling is hard

alias Im='D Music && instantmusic'
alias im='instantmusic'

alias mg='mongod'
alias rs='redis-server'
alias hs='http-server'

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

export USER_NAME="chrisandrejewski" # "Pyrus" on iMac

## local oss
export LOCAL_OSS="/Users/$USER_NAME/Desktop/Work/github-repos"
export NODE_PATH="$LOCAL_OSS:$NODE_PATH"

## private npm
# export LOCAL_NPM="/Users/$USER_NAME/Desktop/Work/private-npm"
# export NODE_PATH="$LOCAL_NPM:$NODE_PATH"

# @chris jekyll
alias jks='o http://localhost:4000 && jekyll serve --watch'
alias jkb='jekyll build'

# @chris functions

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

pb() {
  if [[ -z $1 ]] ; then
    pbpaste
  else
    printf $1 | pbcopy
  fi
}

# @netbus
export NODE_PATH="/Users/Pyrus/Desktop/Work/taky/modules:$NODE_PATH"

alias cls='clocker start -t'
alias cle='clocker stop'
alias cll='clocker list'
alias cld='clocker data'



