#!/bin/bash
# Source this script to add Nix to the current shell's PATH.
# Usage: . ci/nix-env.sh
#
# Supports both:
#   - Official Nix installer (--no-daemon): ~/.nix-profile/etc/profile.d/nix.sh
#   - Determinate Systems installer (daemon): /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh

# Add Nix binary paths directly
export PATH="$HOME/.nix-profile/bin:/nix/var/nix/profiles/default/bin:$PATH"

# Source the appropriate profile script (sets NIX_SSL_CERT_FILE, NIX_PROFILES, etc.)
for f in "$HOME/.nix-profile/etc/profile.d/nix.sh" \
         /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh \
         /etc/profile.d/nix.sh; do
  if [ -f "$f" ]; then
    . "$f"
    break
  fi
done
