# Path
set fish_greeting
set -x PATH $PATH /opt/homebrew/bin
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH /opt/homebrew/opt/libpq/bin
set -x PATH $PATH /opt/homebrew/opt/openjdk/bin
set -x JAVA_HOME /opt/homebrew/opt/openjdk
# Fly.io
set -x FLYCTL_INSTALL "/Users/$USER/.fly"
set -x PATH "$FLYCTL_INSTALL/bin" $PATH
# Signed commits
set -x GPG_TTY (tty)
# opam configuration
source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true

alias code zed
alias python 'uv run python'

# Starship
starship init fish | source
