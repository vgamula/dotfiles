export ZSH=$HOME/.oh-my-zsh
export TERM="xterm-256color"

ZSH_THEME="pygmalion"
plugins=(git, pip)
setopt RM_STAR_WAIT
setopt interactivecomments

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:$HOME/bin

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

func p() {
    pyenv activate deployer || true
    cd ~/projects/$1
}

func iv() {
    python ~/bin/iv.py ./project.clj | tee /dev/tty | tr -d  '\n' | pbcopy
}

func gpr() {
    TARGET=$1 python ~/bin/gpr.py
}

func pc() {
    python -c "$1"
}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin
