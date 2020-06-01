set -Ux EDITOR vim

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# FZF key bindings
if type -q fzf_key_bindings
    fzf_key_bindings
end

# load local fish config
if test -e ~/.config/fish/local.config.fish
    source ~/.config/fish/local.config.fish
end

# use bat for colored man pages
if type -sq bat
    set -x MANPAGER "fish -c 'col -bx | bat -l man -p'"
end
