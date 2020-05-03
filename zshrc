#
# zplug configuration
#
source ~/.zsh/plugins.zsh

#
# zsh configuration
#
source ~/.zsh/settings.zsh

# fix del key in urxvt
# bindkey '^[[3~' delete-char
# bindkey '^[3;5~' delete-char

# ctrl+arrow
# bindkey '^[[1;5D' backward-word

#
# aliases
#
#alias pw='pwgen 32 -1 | xsel -b -s'
#alias pwr=' pwgen-passphrase -s - -l 5 -w eff-short | xsel -b -s'

#
# environment variables
#
#export HOMEBREW_GITHUB_API_TOKEN=your_token_here

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#
# local zsh configuration
#
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

