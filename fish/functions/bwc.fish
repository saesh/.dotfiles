function bwc -d "Copy bitwarden output to clipboard"
    bw $argv | xsel --clipboard
end
