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


install_packages() {
    echo "Install packages..."
    brew update
    brew upgrade

    export HOMEBREW_NO_AUTO_UPDATE=1
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
    export HOMEBREW_NO_AUTO_UPDATE=
    echo "Install packages... Done"
}

install_extra_packages() {
    export HOMEBREW_NO_AUTO_UPDATE=1
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
    export HOMEBREW_NO_AUTO_UPDATE=
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
    # SDK man
    sdk install java
}


main() {
    install_packages
    install_extra_packages
    setup_links
}
main
