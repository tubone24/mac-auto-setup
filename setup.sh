#!/bin/bash
set -euo pipefail

# Mac Auto Setup - Nix-based provisioning script
# This script bootstraps Nix, nix-darwin, and applies the configuration.

HOSTNAME="${1:-my-mac}"

echo "=== Mac Auto Setup (Nix) ==="
echo "Hostname: ${HOSTNAME}"
echo ""

# 1. Install Nix if not present
if ! command -v nix &>/dev/null; then
  echo ">>> Installing Nix (multi-user / daemon mode)..."
  curl -L https://nixos.org/nix/install | sh -s -- --daemon
  echo ">>> Nix installed. Please restart your shell and re-run this script."
  exit 0
fi

# 2. Install Homebrew if not present (needed for casks and MAS apps)
if ! command -v brew &>/dev/null; then
  echo ">>> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# 3. Build and apply nix-darwin configuration
echo ">>> Building and applying nix-darwin configuration..."
if ! command -v darwin-rebuild &>/dev/null; then
  echo ">>> First run: bootstrapping nix-darwin..."
  nix run nix-darwin -- switch --flake ".#${HOSTNAME}"
else
  darwin-rebuild switch --flake ".#${HOSTNAME}"
fi

# 4. Install Claude Code (requires Node.js via fnm)
echo ">>> Installing Claude Code..."
eval "$(fnm env)"
fnm install 22 --corepack-enabled 2>/dev/null || true
fnm use 22
npm install -g @anthropic-ai/claude-code
echo ">>> Claude Code installed: $(claude --version)"

echo ""
echo "=== Setup complete! ==="
echo ""
echo "Post-setup steps:"
echo "  1. Set default Node.js:       fnm default 22"
echo "  2. Install Python:            pyenv install 3.12 && pyenv global 3.12"
echo "  3. Install Ruby:              rbenv install 3.3.0 && rbenv global 3.3.0"
echo "  4. Initialize Rust:           rustup-init"
echo "  5. Restart your terminal to apply all changes."
