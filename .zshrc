#!/usr/bin/env zsh

export PATH=/opt/homebrew/bin:$PATH

[ -f ~/.localenv.sh ] && source ~/.localenv.sh

export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion-virtualenv2"
plugins=(
  git
  pip
)
setopt RM_STAR_WAIT
setopt interactivecomments
source $ZSH/oh-my-zsh.sh
fpath=(${HOME}/.zfunc $fpath)

# ZSH
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
# END

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export SDKMAN_DIR="$HOME/.sdkman"

export PATH=$PATH:$HOME/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/.stack/programs/x86_64-osx/ghc-8.8.2/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/Applications/Racket v7.8/bin/:$PATH"
export PATH="/usr/local/sbin:$PATH"

[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
alias tmux='tmux -2'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.functions

alias subl='code'
export GPG_TTY=$(tty)

eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
