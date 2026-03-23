{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initExtra = ''
      # fnm (Fast Node Manager) - replaces nodenv
      eval "$(fnm env --use-on-cd)"

      # pyenv
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init -)"
      eval "$(pyenv virtualenv-init -)" 2>/dev/null

      # rbenv
      eval "$(rbenv init -)"

      # Rust/Cargo
      [ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

      # direnv
      eval "$(direnv hook zsh)"

      # asdf (for Erlang/Elixir)
      [ -f "$(brew --prefix asdf 2>/dev/null)/libexec/asdf.sh" ] && . "$(brew --prefix asdf 2>/dev/null)/libexec/asdf.sh"

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
