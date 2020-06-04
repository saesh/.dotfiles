#!/usr/bin/fish

function base16-shell-theme --argument-names 'theme' -d 'set shell/fish/fzf base16 theme'
    if test -z $theme
        echo "No base16 theme name given. Exiting."
        return 1
    end

    # sets the theme variable for base16-shell
    #set -Ux BASE16_THEME $theme

    # scripts to set various themes
    set -l base16_shell base16-$theme
    set -l base16_fish fish-base16-$theme
    set -l base16_fzf ~/.config/base16-fzf/base16-$theme.fish

    # attempt to execute base16-shell theme script
    if type -q $base16_shell
        echo "setting base16-shell theme"
        $base16_shell
    end

    # attempt to set fish-base16-themes theme script
    if type -q $base16_fish
        echo "setting fish-base16-themes theme"
        $base16_fish
    end

    # attempt to source base16-fzf theme script
    if test -e $base16_fzf
        echo "setting base16-fzf theme"
        source $base16_fzf
    end
end
