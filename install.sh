#!/usr/bin/env bash

set -e

setup_tpm() {
    echo "Setup tpm..."
    if [[ -d "$HOME/.tmux/plugins/tpm" ]];
    then
        echo "tpm already exists, updating..."
        (cd ~/.tmux/plugins/tpm && git pull origin master)
    else
        echo "tpm does not exist, clonning..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    fi
    echo "Setup tpm... Done"
}

setup_python() {
    PYTHON_VERSION=3.9.0
    OLD_PYTHON_VERSION=2.7.18
    yes n | pyenv install $PYTHON_VERSION || true
    yes n | pyenv install $OLD_PYTHON_VERSION || true
    pyenv global $PYTHON_VERSION
}

install_packages() {
    echo "Install packages..."
    brew update
    brew upgrade

    brew install git

    # Shell
    brew install zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/upgrade.sh)"
    brew install tmux
    brew install reattach-to-user-namespace
    setup_tpm
    if [[ ! $SHELL == *"zsh"* ]];
    then
        chsh -s $(which zsh)
    fi
    brew install fzf
    yes | $(brew --prefix)/opt/fzf/install

    # Editor
    brew install neovim

    # Tools
    brew install dust              # du
    brew install ripgrep           # grep
    brew install bat               # cat
    brew install exa               # ls
    brew install fd                # find
    brew install procs             # top
    brew install tokei             # lines of code
    brew install pyenv             # python versions local and global
    brew install pyenv-virtualenv  # python virtualenvs
    echo "Install packages... Done"
}

install_extra_packages() {
    brew cask install discord
    brew cask install iina
    brew cask install qbittorrent
    brew cask install spectacle
    brew cask install spotify
    brew cask install sublime-text
    brew cask install telegram
    brew cask install viber
    brew cask install vlc
    brew cask install zoomus
}

install_fonts() {
    brew tap homebrew/cask-fonts
    brew cask install font-iosevka
    brew cask install font-iosevka-slab
}

setup_links() {
    echo "Setup links..."
    rm -f $HOME/.functions
    ln -s $HOME/dotfiles/.functions $HOME/.functions

    rm -f $HOME/.zshrc
    ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc

    rm -f $HOME/.gitconfig
    ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig

    rm -f $HOME/.tmux.conf
    ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
    echo "Setup links... Done"
}


setup_java() {
    sdk install java
}


main() {
    export HOMEBREW_NO_AUTO_UPDATE=1

    install_packages
    install_extra_packages
    install_fonts
    setup_links
    # next functions require some programs to be already installed -
    # .zshrc must be sourced here, but i'm not kinda sure if it is possible
    # as this script will be run by bash and some commands like setopt are not defined here
    # :thinking_face:
    # most probably script will fail and restarting it with reloaded shell should work :shrug:
    # setup_java
    setup_python

    export HOMEBREW_NO_AUTO_UPDATE=

    echo "Yay, all good!"
}
main
