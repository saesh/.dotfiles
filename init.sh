#!/usr/bin/env zsh

# initialize submodules
git submodule init

# symlink
ln -s ".vimrc" "$HOME"
ln -s ".zshrc" "$HOME"
