alias cemacs="open -n /Applications/Emacs.app"
alias ls='ls -G'
#alias python='/usr/local/bin/python'

#export PYENV_ROOT="$HOME/.pyenv"

#PATH=/usr/local/share/python:$PYENV_ROOT:$PATH

export PATH=$HOME/.pyenv/shims:$PATH

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

#alias activate='source /Users/shinya/.pyenv/versions/anaconda3-2.2.0/bin/activate'
#alias deactivate='source /Users/shinya/.pyenv/versions/anaconda3-2.2.0/bin/deactivate'

export LANG=ja_JP.UTF-8
export Dropbox=~/Dropbox/

# Pepper Setting
#export PYTHONPATH=~/Program/Pepper/pynaoqi-python2.7-2.4.2.26-mac64
#export DYLD_LIBRARY_PATH=$PYTHONPATH

# Git
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

PS1='\W$(__git_ps1) $ '

# Go
export GOPATH=$HOME/ghq
export PATH=$GOPATH/bin:$PATH

# Bitcoin
alias bx=bx-osx-x64-mainnet

# Cling (C++ インタープリタ)
# export PATH=/usr/local/Cellar/cling/0.5_1/bin:$PATH
