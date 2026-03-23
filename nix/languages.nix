{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Node.js - use fnm (Fast Node Manager) instead of nodenv
    fnm
    yarn

    # Python - version manager
    pyenv

    # Ruby - version manager
    rbenv
    ruby-build

    # Go
    go

    # Rust
    rustup

    # Deno
    deno

    # Nim
    nim

    # Lua
    lua5_2
    luarocks

    # Java build tool
    gradle

    # Elixir/Erlang via asdf
    asdf-vm

    # Flutter (installed via Homebrew cask or manually - see shell.nix for PATH)
  ];

  # Shell integrations for version managers are configured in shell.nix
}
