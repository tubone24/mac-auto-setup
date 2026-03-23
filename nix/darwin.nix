{ pkgs, username, hostname, ... }:

{
  imports = [
    ./macos.nix
    ./homebrew.nix
  ];

  # Nix settings
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      interval = { Weekday = 0; Hour = 0; Minute = 0; };
      options = "--delete-older-than 30d";
    };
  };

  # System packages available to all users
  environment.systemPackages = with pkgs; [
    vim
    git
  ];

  # Enable zsh as default shell
  programs.zsh.enable = true;

  # Set hostname
  networking.hostName = hostname;

  # Used for backwards compatibility
  system.stateVersion = 6;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # User configuration
  users.users.${username} = {
    name = username;
    home = "/Users/${username}";
  };

  # Fonts
  fonts.packages = with pkgs; [
    ricty
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
}
