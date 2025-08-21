# ~/.config/fish/config.fish

eval (/opt/homebrew/bin/brew shellenv)

# Set up fzf key bindings
fzf --fish | source

zoxide init fish | source

starship init fish | source

set -gx PATH $PATH $HOME/.krew/bin
