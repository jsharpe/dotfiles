#!/bin/bash

set -e

# Dotfiles installation script using chezmoi

CHEZMOI_BIN="${CHEZMOI_BIN:-chezmoi}"
DOTFILES_REPO="https://github.com/jsharpe/dotfiles.git"

echo "==> Installing dotfiles..."

# Check if chezmoi is installed
if ! command -v "$CHEZMOI_BIN" &>/dev/null; then
  echo "==> chezmoi not found. Installing chezmoi..."

  # Detect OS
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew &>/dev/null; then
      brew install chezmoi
    else
      echo "Error: Homebrew not found. Please install Homebrew first."
      exit 1
    fi
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    sh -c "$(curl -fsLS get.chezmoi.io)" -- -b "$HOME/.local/bin"
    export PATH="$HOME/.local/bin:$PATH"
    CHEZMOI_BIN="$HOME/.local/bin/chezmoi"
  else
    echo "Error: Unsupported operating system: $OSTYPE"
    exit 1
  fi

  echo "==> chezmoi installed successfully"
fi

# Initialize chezmoi with dotfiles repository
echo "==> Initializing chezmoi with dotfiles repository..."
"$CHEZMOI_BIN" init --apply "$DOTFILES_REPO"

# Prompt for user information if not set
if [ ! -f "$HOME/.config/chezmoi/chezmoi.toml" ]; then
  mkdir -p "$HOME/.config/chezmoi"
  cat >"$HOME/.config/chezmoi/chezmoi.toml" <<EOF
[data.user]
    name = "James Sharpe"
    email = "james.sharpe@datadoghq.com"
EOF

  echo "==> User configuration saved to ~/.config/chezmoi/chezmoi.toml"
  echo "==> Applying dotfiles again with user configuration..."
  "$CHEZMOI_BIN" apply
fi

echo ""
echo "==> Dotfiles installation complete!"
echo ""
echo "Usage:"
echo "  chezmoi add <file>     # Add a new dotfile"
echo "  chezmoi edit <file>    # Edit a dotfile"
echo "  chezmoi diff           # Show changes"
echo "  chezmoi apply          # Apply changes"
echo "  chezmoi update         # Pull and apply latest changes"
echo ""
