#!/usr/bin/env bash

echo "🚧"

set -e

brew update
brew upgrade

packages=(
  git           # vcs
  fish          # shell
  starship      # shell prompt
  fzf           # fuzzy file search
  neovim        # one more text editor
  dust          # du
  ripgrep       # grep
  bat           # cat
  eza           # ls
  fd            # find
  procs         # top
  tokei         # lines of code
  hyperfine     # benchmarking
  oha           # http benchmarking
  uv            # python versions and envs
  inetutils     # telnet/ftp and others
  gnupg         # signed stuff
  pinentry-mac  # signed stuff
  lazygit       # git tui
  stow          # symlinks
  1password-cli # secrets
  node          # JavaScript runtime
)
brew install "${packages[@]}"

casks=(
  1password
  google-chrome
  telegram
  ghostty
  discord
  raycast
  spotify
  zed
  font-iosevka
  font-iosevka-nerd-font
  font-iosevka-term-nerd-font
)
brew install --cask "${casks[@]}"
brew cleanup --prune=all

mkdir -p ~/.config
stow --no-folding configs

echo "✅"
