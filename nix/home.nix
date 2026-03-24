{ pkgs, username, ... }:

{
  imports = [
    ./packages.nix
    ./languages.nix
    ./git.nix
    ./shell.nix
    ./editors.nix
  ];

  home = {
    username = username;
    homeDirectory = "/Users/${username}";
    stateVersion = "24.11";
  };

  # Let home-manager manage itself
  programs.home-manager.enable = true;
}
