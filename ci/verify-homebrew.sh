#!/bin/bash
# Verify that all Homebrew formulas and casks defined in homebrew.nix are valid.
# This checks that each formula/cask exists in Homebrew's registry.
set -euo pipefail

FAILED=0
PASSED=0

check_brew_formula() {
  local formula="$1"
  if brew info "$formula" >/dev/null 2>&1; then
    echo "  [PASS] brew: ${formula}"
    PASSED=$((PASSED + 1))
  else
    echo "  [FAIL] brew: ${formula}"
    FAILED=$((FAILED + 1))
  fi
}

check_brew_cask() {
  local cask="$1"
  if brew info --cask "$cask" >/dev/null 2>&1; then
    echo "  [PASS] cask: ${cask}"
    PASSED=$((PASSED + 1))
  else
    echo "  [FAIL] cask: ${cask}"
    FAILED=$((FAILED + 1))
  fi
}

echo "============================================"
echo " Verifying Homebrew taps"
echo "============================================"

TAPS=(
  "sanemat/font"
  "git-chglog/git-chglog"
)

for tap in "${TAPS[@]}"; do
  echo "  Tapping: ${tap}"
  if brew tap "$tap" 2>/dev/null; then
    echo "  [PASS] tap: ${tap}"
    PASSED=$((PASSED + 1))
  else
    echo "  [FAIL] tap: ${tap}"
    FAILED=$((FAILED + 1))
  fi
done

echo ""
echo "============================================"
echo " Verifying Homebrew formulas"
echo "============================================"

FORMULAS=(
  "git-chglog"
  "ricty"
  "cocoapods"
)

for formula in "${FORMULAS[@]}"; do
  check_brew_formula "$formula"
done

echo ""
echo "============================================"
echo " Verifying Homebrew casks"
echo "============================================"

CASKS=(
  "google-chrome"
  "iterm2"
  "wezterm"
  "visual-studio-code"
  "coteditor"
  "intellij-idea"
  "docker"
  "postman"
  "dbeaver-community"
  "google-cloud-sdk"
  "aws-vault"
  "virtualbox"
  "vagrant"
  "slack"
  "google-japanese-ime"
  "the-unarchiver"
  "appcleaner"
  "alfred"
  "clipy"
  "tunnelblick"
  "oracle-jdk"
)

for cask in "${CASKS[@]}"; do
  check_brew_cask "$cask"
done

echo ""
echo "============================================"
echo " Results"
echo "============================================"
echo "  Passed: ${PASSED}"
echo "  Failed: ${FAILED}"
echo ""

if [ "$FAILED" -gt 0 ]; then
  echo "ERROR: ${FAILED} formula/cask(s) failed verification!"
  exit 1
else
  echo "All Homebrew formulas and casks verified successfully!"
  exit 0
fi
