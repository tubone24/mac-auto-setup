{ pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    userName = "tubone";
    userEmail = "tubo.yyyuuu@gmail.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
  };

  home.packages = with pkgs; [
    gh
  ];

  # Generate SSH key if not exists
  home.activation.generateSshKey = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
      mkdir -p "$HOME/.ssh"
      ${pkgs.openssh}/bin/ssh-keygen -t ed25519 -f "$HOME/.ssh/id_ed25519" -N "" -C "tubo.yyyuuu@gmail.com"
    fi
  '';
}
