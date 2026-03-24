#!/bin/bash
# Source this script to add Nix to the current shell's PATH.
# Usage: . ci/nix-env.sh
#
# Supports:
#   - Multi-user (daemon) install: /nix/var/nix/profiles/default/...
#   - Single-user install: ~/.nix-profile/...

# Add Nix binary paths directly (both multi-user and single-user locations)
export PATH="/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:$PATH"

# Source the appropriate profile script (sets NIX_SSL_CERT_FILE, NIX_PROFILES, etc.)
for f in /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
         /etc/bashrc \
         "$HOME/.nix-profile/etc/profile.d/nix.sh"; do
  if [ -f "$f" ]; then
    . "$f" 2>/dev/null
    break
  fi
done
