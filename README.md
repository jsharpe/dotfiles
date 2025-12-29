# Dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/).

## Quick Install

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/jsharpe/dotfiles/main/install.sh)"
```

Or manually:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply jsharpe
```

## What's Included

- `.bashrc` - Bash configuration
- `.zshrc` - Zsh configuration with Oh My Zsh
- `.gitconfig` - Git configuration (work-specific settings filtered)
- `.tmux.conf` - Tmux configuration with SSH auth sock handling
- `.bazelrc` - Bazel configuration
- Various `.config` files

## Managing Dotfiles

```bash
# Add a new dotfile
chezmoi add ~/.myfile

# Edit a dotfile
chezmoi edit ~/.bashrc

# See what would change
chezmoi diff

# Apply changes
chezmoi apply

# Update from repository
chezmoi update
```

## Configuration

On first install, you'll be prompted to enter your name and email for git configuration.
These are stored in `~/.config/chezmoi/chezmoi.toml`.

Example:

```toml
[data.user]
    name = "Your Name"
    email = "your.email@example.com"
```
