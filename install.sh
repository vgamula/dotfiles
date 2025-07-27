#!/usr/bin/env bash

echo "🚧"

set -e

brew update
brew upgrade

packages=(
  git          # vcs
  fish         # shell
  zellij       # terminal multiplexer
  starship     # shell prompt
  fzf          # fuzzy file search
  neovim       # one more text editor
  dust         # du
  ripgrep      # grep
  bat          # cat
  eza          # ls
  fd           # find
  procs        # top
  tokei        # lines of code
  hyperfine    # benchmarking
  oha          # http benchmarking
  uv           # python versions and envs
  inetutils    # telnet/ftp and others
  gnupg        # signed stuff
  pinentry-mac # signed stuff
  lazygit      # git tui
  zellij       # terminal multiplexer
  stow         # symlinks
)
brew install "${packages[@]}"

casks=(
  ghostty
  discord
  raycast
  spotify
  zed
  font-iosevka
  font-iosevka-slab
  font-iosevka-nerd-font
)
brew install --cask "${casks[@]}"

mkdir -p ~/.config
stow configs

echo "✅"
