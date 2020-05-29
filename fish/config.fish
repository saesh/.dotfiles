set -Ux EDITOR vim

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Set shell theme
if type -q base16-gruvbox-dark-soft
    base16-gruvbox-dark-soft
end

# Set shell theme
if type -q fish-base16-gruvbox-dark-soft
    fish-base16-gruvbox-dark-soft
end

# FZF key bindings
if type -q fzf_key_bindings
    fzf_key_bindings
end

# load local fish config
if test -e ~/.config/fish/local.config.fish
    source ~/.config/fish/local.config.fish
end
