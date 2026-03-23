{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # AWS tools
    awscli2

    # Infrastructure tools
    packer
    terraform

    # JSON/YAML tools
    jq
    yq

    # Terminal utilities
    reattach-to-user-namespace
    peco
    ghq
    wget
    coreutils
    tree
    htop
    lsd
    figlet

    # Network tools
    nmap
    mtr
    tcptraceroute

    # Build tools
    automake
    autoconf
    libtool

    # Libraries
    openssl_1_1
    libyaml
    readline
    libxslt
    unixodbc

    # Database tools
    mycli
    dbmate
    pgformatter

    # Search tools
    silver-searcher

    # Code quality
    shellcheck
    pre-commit
    editorconfig-core-c

    # Source control
    hub
    git-secrets

    # Other tools
    jsonnet
    nasm
    ffmpeg
    mas

    # Multimedia
    gimp
  ];
}
