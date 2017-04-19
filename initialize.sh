
# Initial setup script

echo 'macOS fixes'
bash mac-os-fixes.sh

alias i='echo Installing'

i 'Xcode'
xcode-select --install

i 'Brew/Cask'

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

i 'Brew tools'

brew_list=(
  bash-completion
  coreutils

  git
  git-extras
  ag
  curl
  node
  yarn
  watchman

  postgres
  mongodb
  redis
  nginx
)

brew install ${brew_list[@]}

i 'Cask tools'

cask_list=(
  atom
  firefox
  github-desktop
  google-chrome
  google-chrome-canary
  hyper
  sketch
)

brew cask install --appdir="/Applications" ${cask_list[@]}

i 'Node tools'

node_list=(
  n
  http-server
)

npm install --global ${node_list[@]}

echo Cleaning up
brew cleanup
brew cask cleanup

unalias i
