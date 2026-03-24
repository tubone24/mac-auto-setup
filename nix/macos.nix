{ ... }:

{
  # macOS system defaults
  # Converted from Ansible mac_default_write.yml
  system.defaults = {
    # Dock settings
    dock = {
      autohide = true;
      autohide-time-modifier = 0.0;
      show-recents = false;
      showAppExposeGestureEnabled = true;
      showDesktopGestureEnabled = true;
      showLaunchpadGestureEnabled = true;
      showMissionControlGestureEnabled = true;
    };

    # Finder settings
    finder = {
      ShowPathbar = true;
      ShowTabView = true;
      AppleShowAllExtensions = true;
      FXPreferredViewStyle = "Nlsv";
    };

    # Screenshot settings
    screencapture = {
      disable-shadow = true;
    };

    # Trackpad settings
    trackpad = {
      Clicking = true; # tap-to-click
    };

    # Menu bar clock
    menuExtraClock = {
      ShowSeconds = true;
      ShowDayOfWeek = true;
    };

    # Global macOS settings
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
      NSAutomaticCapitalizationEnabled = false;
      NSAutomaticSpellingCorrectionEnabled = false;
    };
  };
}
