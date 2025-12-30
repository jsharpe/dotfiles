# ~/.config/fish/config.fish

if test (uname) = Darwin
    eval (/opt/homebrew/bin/brew shellenv)
end

# Add local bin directories to PATH
fish_add_path -m $HOME/.local/bin
fish_add_path -m $HOME/.fzf/bin

# Set up fzf key bindings
fzf --fish | source

zoxide init fish | source

starship init fish | source

set -gx PATH $PATH $HOME/.krew/bin

# Aliases
alias cat="bat"
alias ls="eza"
