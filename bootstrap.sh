#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master

# initialize submodules
git submodule update --init --recursive 

function doIt() {
	rsync \
		--exclude ".git" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "brew-install.sh" \
		--exclude "README.md" --exclude ".gitmodules" --exclude "fonts/" \
		--exclude "schemes/" \
		-avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
