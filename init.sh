#!/usr/bin/env zsh

# initialize submodules
git submodule update --init --recursive 

# symlink
ln -s ".dotfiles/.vimrc" "$HOME/.vimrc"
ln -s ".dotfiles/.zshrc" "$HOME/.zshrc"
ln -s ".dotfiles/.editorconfig" "$HOME/.editorconfig"
