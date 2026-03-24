{ pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # Clone AstroNvim configuration
  home.activation.setupAstroNvim = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/.config/nvim" ]; then
      ${pkgs.git}/bin/git clone https://github.com/AstroNvim/AstroNvim.git "$HOME/.config/nvim"
    fi
  '';

  # Clone dotfiles and run install
  home.activation.setupDotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "$HOME/dotfiles" ]; then
      ${pkgs.git}/bin/git clone https://github.com/tubone24/dotfiles.git "$HOME/dotfiles"
      cd "$HOME/dotfiles" && ${pkgs.zsh}/bin/zsh install.sh
    fi
  '';
}
