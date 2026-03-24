{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      # asdf - universal version manager (Node.js, Python, Ruby, Erlang, Elixir, etc.)
      . "$(asdf where 2>/dev/null || echo /dev/null)" 2>/dev/null
      [ -f "$HOME/.asdf/asdf.sh" ] && . "$HOME/.asdf/asdf.sh"

      # Rust/Cargo
      [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

      # direnv
      eval "$(direnv hook zsh)"

      # Flutter
      export PATH="$HOME/flutter/bin:$PATH"

      # Go
      export GOPATH="$HOME/go"
      export PATH="$GOPATH/bin:$PATH"
    '';

    shellAliases = {
      ls = "lsd";
      ll = "lsd -la";
      tree = "lsd --tree";
    };
  };

  programs.tmux = {
    enable = true;
    terminal = "screen-256color";
    keyMode = "vi";
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
