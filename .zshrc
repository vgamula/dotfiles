export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="pygmalion"
plugins=(git, pip)
setopt RM_STAR_WAIT
setopt interactivecomments

source $ZSH/oh-my-zsh.sh
export PATH=$PATH:$HOME/bin
fpath=(${HOME}/.zfunc $fpath)

# ZSH
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C
# END

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

func restart-bluetooth-audio() {
    rm ~/Library/Preferences/com.apple.preference.general.plist
    blueutil -p 0
    sleep 1
    sudo kill -9 `ps ax | grep 'coreaudio[a-z]' | awk '{print $1}'`
    sudo kill -9 `ps ax | grep 'bluetooth[a-z]' | awk '{print $1}'`
    sudo kill -9 `ps ax | grep 'bluetoothaudio[a-z]' | awk '{print $1}'`
    sleep 10
    blueutil -p 1
}

func clj-kondo() {
  docker run -v $PWD/src:/src --rm borkdude/clj-kondo clj-kondo --lint src
}

export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export PATH=$PATH:$HOME/.cargo/bin

export PATH=$PATH:$HOME/go/bin

export PATH="$HOME/Library/Haskell/bin:$PATH"

export PATH="$HOME/.jenv/bin:$PATH"

export PATH="$HOME/.local/bin:$HOME/.stack/programs/x86_64-osx/ghc-8.8.2/bin:$PATH"

export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH="/usr/local/sbin:$PATH"

nvm() {
  echo "🚨 NVM not loaded! Loading now..."
  unset -f nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  nvm "$@"
}

source $HOME/.sdkman/bin/sdkman-init.sh
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


alias tmux='tmux -2'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
