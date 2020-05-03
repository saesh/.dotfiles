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
source ~/.shell/aliases.sh

#
# environment variables
#
source ~/.shell/env.sh

#
# local zsh configuration
#
if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local_after
fi

