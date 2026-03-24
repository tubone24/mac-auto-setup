{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # asdf-vm - universal version manager for Node.js, Python, Ruby, etc.
    asdf-vm

    # Go (managed directly via Nix; asdf plugin also available)
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
  ];

  # Shell integrations for asdf are configured in shell.nix
}
