#!/bin/bash
# Source this script to add Nix to the current shell's PATH.
# Usage: . ci/nix-env.sh

# Add Nix binary paths directly
export PATH="/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:$PATH"

# Source nix-daemon.sh if available (sets NIX_SSL_CERT_FILE, NIX_PROFILES, etc.)
for f in /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
         /etc/profile.d/nix.sh \
         "$HOME/.nix-profile/etc/profile.d/nix.sh"; do
  if [ -f "$f" ]; then
    . "$f"
    break
  fi
done
