source ~/.dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES

git
brew
common-aliases
osx
sublime
docker

EOBUNDLES

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme wedisagree 

# Tell antigen that you're done.
antigen apply
