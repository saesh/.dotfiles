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
brew install maven
brew install node
brew install pwgen
brew install pandoc
brew install sbt
brew install scala
brew install typesafe-activator
brew install tree

brew cask install slack
brew cask install sublime-text3
brew cask install sourcetree
brew cask install google-chrome
brew cask install firefox
brew cask install dropbox
brew cask install iterm2
brew cask install flux
brew cask install macid 
brew cask install virtualbox
brew cask install caffeine
brew cask install colloquy
brew cask install the-unarchiver
