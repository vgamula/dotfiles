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

func ivc() {
    VERSION_UPDATE=$(python ~/bin/iv.py ./project.clj | tr -d  '\n')
    git add project.clj
    git commit -m $VERSION_UPDATE
}

func gpr() {
    TARGET=$1 python ~/bin/gpr.py
}

func pc() {
    python -c "print($1)"
}

func fab-ssh() {
    ssh `fab profiles:short,${1:-staging01} | head -n 1 | cut -f 2 -d : `
}

func restart-bluetooth() {
    blueutil -p 0 && sleep 1 && blueutil -p 1
}

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.6/bin

export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:$HOME/go/bin

export PATH="$HOME/Library/Haskell/bin:$PATH"

export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
