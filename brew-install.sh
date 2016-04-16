#!/bin/sh

export HOMEBREW_CASK_OPTS="--appdir=/Applications"
sudo -v

brew update
brew upgrade --all

brew tap homebrew/dupes
brew tap homebrew/versions

brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts

brew install caskroom/cask/brew-cask
brew install ansible
brew install git
brew install gradle
brew install groovysdk
brew install htop-osx
brew install irssi
brew install maven
brew install node
brew install nvm
brew install pwgen
brew install pandoc
brew install rsync
brew install sbt
brew install scala
brew install typesafe-activator
brew install tree
brew install tmux

brew cask install atom
brew cask install caffeine
brew cask install calibre
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install iterm2
brew cask install libreoffice
brew cask install macid
brew cask install owncloud
brew cask install qlmarkdown
brew cask install slack
brew cask install sequel-pro
brew cask install the-unarchiver
brew cask install virtualbox
brew cask install ynab

