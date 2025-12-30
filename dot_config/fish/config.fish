# ~/.config/fish/config.fish

if test (uname) = Darwin
    eval (/opt/homebrew/bin/brew shellenv)
end

# Set up fzf key bindings
fzf --fish | source

zoxide init fish | source

starship init fish | source

set -gx PATH $PATH $HOME/.krew/bin
