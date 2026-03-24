#!/bin/bash
# Verify that all Nix-defined packages can be built/fetched individually.
# This script instantiates each package from nixpkgs to confirm it exists and resolves.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
. "$SCRIPT_DIR/nix-env.sh"

FAILED=0
PASSED=0
SKIPPED=0

check_nix_package() {
  local pkg="$1"
  local attr="${2:-$1}"
  if nix build "nixpkgs#${attr}" --no-link --dry-run 2>/dev/null; then
    echo "  [PASS] ${pkg} (nixpkgs#${attr})"
    PASSED=$((PASSED + 1))
  else
    echo "  [FAIL] ${pkg} (nixpkgs#${attr})"
    FAILED=$((FAILED + 1))
  fi
}

check_nix_package_darwin() {
  local pkg="$1"
  local attr="${2:-$1}"
  # Some packages are not available on darwin; skip gracefully
  if nix eval "nixpkgs#${attr}.meta.platforms" --json 2>/dev/null | grep -q "darwin"; then
    check_nix_package "$pkg" "$attr"
  else
    echo "  [SKIP] ${pkg} (not available on darwin)"
    SKIPPED=$((SKIPPED + 1))
  fi
}

echo "============================================"
echo " Verifying Nix packages (packages.nix)"
echo "============================================"

# packages.nix - CLI tools
check_nix_package "awscli2" "awscli2"
check_nix_package "opentofu" "opentofu"
check_nix_package "jq" "jq"
check_nix_package "yq" "yq"
check_nix_package "reattach-to-user-namespace" "reattach-to-user-namespace"
check_nix_package "peco" "peco"
check_nix_package "ghq" "ghq"
check_nix_package "wget" "wget"
check_nix_package "coreutils" "coreutils"
check_nix_package "tree" "tree"
check_nix_package "htop" "htop"
check_nix_package "lsd" "lsd"
check_nix_package "figlet" "figlet"
check_nix_package "nmap" "nmap"
check_nix_package "mtr" "mtr"
check_nix_package "tcptraceroute" "tcptraceroute"
check_nix_package "automake" "automake"
check_nix_package "autoconf" "autoconf"
check_nix_package "libtool" "libtool"
check_nix_package "libyaml" "libyaml"
check_nix_package "readline" "readline"
check_nix_package "libxslt" "libxslt"
check_nix_package "unixodbc" "unixodbc"
check_nix_package "dbmate" "dbmate"
check_nix_package "pgformatter" "pgformatter"
check_nix_package "silver-searcher" "silver-searcher"
check_nix_package "shellcheck" "shellcheck"
check_nix_package "pre-commit" "pre-commit"
check_nix_package "editorconfig-core-c" "editorconfig-core-c"
check_nix_package "hub" "hub"
check_nix_package "git-secrets" "git-secrets"
check_nix_package "jsonnet" "jsonnet"
check_nix_package "nasm" "nasm"
check_nix_package "ffmpeg" "ffmpeg"
check_nix_package "mas" "mas"
check_nix_package_darwin "gimp" "gimp"

echo ""
echo "============================================"
echo " Verifying Nix packages (languages.nix)"
echo "============================================"

check_nix_package "asdf-vm" "asdf-vm"
check_nix_package "go" "go"
check_nix_package "rustup" "rustup"
check_nix_package "deno" "deno"
check_nix_package "nim" "nim"
check_nix_package "lua5_2" "lua5_2"
check_nix_package "luarocks" "luarocks"
check_nix_package "gradle" "gradle"

echo ""
echo "============================================"
echo " Verifying Nix packages (git.nix)"
echo "============================================"

check_nix_package "git" "git"
check_nix_package "gh" "gh"

echo ""
echo "============================================"
echo " Verifying Nix packages (editors.nix)"
echo "============================================"

check_nix_package "neovim" "neovim"

echo ""
echo "============================================"
echo " Verifying Nix packages (shell.nix)"
echo "============================================"

check_nix_package "tmux" "tmux"
check_nix_package "direnv" "direnv"
check_nix_package "nix-direnv" "nix-direnv"

echo ""
echo "============================================"
echo " Verifying Nix packages (darwin.nix)"
echo "============================================"

check_nix_package "vim" "vim"
check_nix_package_darwin "ricty" "ricty"

echo ""
echo "============================================"
echo " Results"
echo "============================================"
echo "  Passed:  ${PASSED}"
echo "  Failed:  ${FAILED}"
echo "  Skipped: ${SKIPPED}"
echo ""

if [ "$FAILED" -gt 0 ]; then
  echo "ERROR: ${FAILED} package(s) failed verification!"
  exit 1
else
  echo "All packages verified successfully!"
  exit 0
fi
