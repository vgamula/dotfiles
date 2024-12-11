#!/usr/bin/env bash

set -e


# TODO: review this
setup_python() {
    PYTHON_VERSION=3.10.0
    yes n | pyenv install $PYTHON_VERSION || true
    # OLD_PYTHON_VERSION=2.7.18
    # yes n | pyenv install $OLD_PYTHON_VERSION || true
    pyenv global $PYTHON_VERSION
}

install_packages() {
    echo "Install packages..."
    brew update
    brew upgrade

    brew install git

    # Shell
    brew install fish fisher
    brew install starship
    brew install zellij

    # brew install reattach-to-user-namespace
    #if [[ ! $SHELL == *"fish"* ]];
    #then
    #    chsh -s $(which fish)
    #fi
    brew install fzf
    yes | $(brew --prefix)/opt/fzf/install

    # Editor
    brew install neovim

    # Tools
    brew install dust              # du
    brew install ripgrep           # grep
    brew install bat               # cat
    brew install eza               # ls
    brew install fd                # find
    brew install procs             # top
    brew install tokei             # lines of code
    brew install hyperfine         # benchmarking
    brew install oha               # http benchmarking
    brew install pyenv             # python versions local and global
    brew install pyenv-virtualenv  # python virtualenvs
    brew install inetutils         # telnet/ftp
    brew install gnupg             # signed stuff
    brew install pinentry-mac      # signed stuff
    brew install lazygit           # git tui
    brew install zellij            # terminal multiplexer

    # TODO: extra into setup_shell?
    # fisher install reitzig/sdkman-for-fis
    # fisher install catppuccin/fish

    echo "Install packages... Done"
}

install_extra_packages() {
    # brew install --cask discord
    # brew install --cask iina
    # brew install --cask qbittorrent
    brew install --cask raycast
    brew install --cask spotify
    brew install --cask visual-studio-code
    brew install --cask zed
    # brew install --cask telegram
    # brew install --cask vlc
    # brew install --cask zoomus
}

install_fonts() {
    brew install --cask font-iosevka
    brew install --cask font-iosevka-slab
}

setup_links() {
    echo "Setup links..."
    rm -f $HOME/.functions
    ln -sf $HOME/dotfiles/.functions $HOME/.functions

    rm -rf $HOME/.config/alacritty
    ln -sf $HOME/dotfiles/.config/alacritty $HOME/.config/alacritty

    rm -f $HOME/.config/fish/config.fish
    ln -sf $HOME/dotfiles/.config/fish/config.fish $HOME/.config/fish/config.fish

    rm -f $HOME/.gitconfig
    ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig

    mkdir -p $HOME/.lein
    ln -sf $HOME/dotfiles/.lein/profiles.clj $HOME/.lein/profiles.clj

    mkdir -p $HOME/.gnupg
    ln -sf $HOME/dotfiles/.gnupg/gpg-agent.conf $HOME/.gnupg/gpg-agent.conf

    mkdir -p $HOME/config/zellij
    rm -rf rm -f $HOME/.config/zellij/config.kdl
    ln -sf $HOME/dotfiles/.config/zellij/config.kdl $HOME/.config/zellij/config.kdl
    echo "Setup links... Done"
}

main() {
    export HOMEBREW_NO_AUTO_UPDATE=1

    install_packages
    install_extra_packages
    install_fonts
    setup_links
    export HOMEBREW_NO_AUTO_UPDATE=

    echo "Yay, all good!"
}
main
