{ ... }:

{
  # Homebrew integration via nix-darwin
  # Used for GUI apps (casks) and Mac App Store apps that can't be managed by Nix
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = true;
      upgrade = true;
      # Set to "zap" to remove unlisted casks/formulae, or "none" to keep them
      cleanup = "none";
    };

    taps = [
      "sanemat/font"
      "git-chglog/git-chglog"
    ];

    brews = [
      "git-chglog"
      "ricty"
      "cocoapods"
    ];

    casks = [
      # Browsers
      "google-chrome"

      # Terminals
      "iterm2"
      "wezterm"

      # Editors & IDEs
      "visual-studio-code"
      "coteditor"
      "intellij-idea"

      # Development tools
      "docker"
      "postman"
      "dbeaver-community"

      # Cloud & Infrastructure
      "google-cloud-sdk"
      "aws-vault"

      # Virtualization
      "virtualbox"
      "vagrant"

      # Communication
      "slack"

      # Utilities
      "google-japanese-ime"
      "the-unarchiver"
      "appcleaner"
      "alfred"
      "clipy"
      "tunnelblick"

      # Languages & Runtimes
      "oracle-jdk"
    ];

    # Mac App Store apps (requires `mas` CLI and Apple ID sign-in)
    masApps = {
      "Microsoft Remote Desktop" = 1295203466;
      "Skitch" = 425955336;
      "WinArchiver Lite" = 414855915;
      "Bandwidth+" = 490461369;
      "SafeInCloud" = 883070818;
      "RunCat" = 1429033973;
    };
  };
}
