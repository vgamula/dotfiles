set -x SHELL "fish"

# Path
set -x PATH $PATH /opt/homebrew/bin
set -x PATH $PATH $HOME/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.cargo/bin
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH /usr/local/sbin
set -x PATH $PATH /opt/homebrew/opt/libpq/bin

# Fly.io
set -x FLYCTL_INSTALL "/Users/vgamula/.fly"
set -x PATH "$FLYCTL_INSTALL/bin" $PATH

# set -x SDKMAN_DIR "$HOME/.sdkman"
# if test -s "$HOME/.sdkman/bin/sdkman-init.sh"
#     source "$HOME/.sdkman/bin/sdkman-init.sh"
# end

alias tmux 'tmux -2'

# if test -f ~/.fzf.zsh
#     source ~/.fzf.zsh
# end

# source ~/.functions

# Signed commits
set -x GPG_TTY (tty)

# pyenv
set -x PYENV_VIRTUALENV_DISABLE_PROMPT 1
set -Ux PYENV_ROOT $HOME/.pyenv
fish_add_path $PYENV_ROOT/bin
pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

# Starship
starship init fish | source

# opam configuration
source /Users/vgamula/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
