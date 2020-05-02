#
# zplug configuration
#
source ~/.zplug/init.zsh

#plugins
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-completions", defer:2

zplug "zsh-users/zsh-autosuggestions", defer:2
bindkey '^ ' autosuggest-accept
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true

zplug "plugins/common-aliases", from:oh-my-zsh, defer:2

# theme
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

#
# zsh configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

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

source .zshrc.local
