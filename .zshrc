#=========================================================
# 補完
#=========================================================
# マニュアル補完関数置き場
fpath=(~/zsh/functions $fpath)

# Emacs ライクな操作を有効にする（文字入力中に Ctrl-F,B でカーソル移動など）
# Vi ライクな操作が好みであれば `bindkey -v` とする
bindkey -e

# 自動補完を有効にする
# コマンドの引数やパス名を途中まで入力して <Tab> を押すといい感じに補完してくれる
# 例： `cd path/to/<Tab>`, `ls -<Tab>`
autoload -U compinit; compinit

#=========================================================
# マニュアル関数
#=========================================================
autoload -U peco-select-history
zle -N peco-select-history
bindkey '^r' peco-select-history

source ~/zsh/functions/z.sh
autoload -U peco-z-search
zle -N peco-z-search
bindkey '^@' peco-z-search

# autoload -U peco-src
# zle -N peco-src
# bindkey '^]' peco-src

autoload -U peco-M-x
zle -N peco-M-x
bindkey '^xx' peco-M-x

autoload -U peco-descbinds
zle -N peco-descbinds
bindkey '^xk' peco-descbinds

autoload -U peco-books
zle -N peco-books
bindkey '^xb' peco-books


source ~/zsh/functions/miya-clipboard

#=========================================================
# History
#=========================================================
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000

# 同じコマンドをヒストリに残さない
setopt HIST_IGNORE_ALL_DUPS

# スペースから始まるコマンド行はヒストリに残さない
setopt HIST_IGNORE_SPACE

#=========================================================
# Python
#=========================================================
export PATH=$HOME/anaconda/bin:$HOME/tool:$HOME/.pyenv/shims:$PATH

# pyenv設定
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin/:$PATH
eval "$(pyenv init -)"

#=========================================================
# Go
#=========================================================
#export GOPATH=$HOME/ghq
#export PATH=$GOPATH/bin:$PATH

#=========================================================
# R
#=========================================================
disable r # デフォルト"r"を無効

#=========================================================

# lsコマンド カラー表示
if [ "$(uname)" = 'Darwin' ]; then
    alias ls='ls -G'			# Mac
else
    eval `dircolors ~/.colorrc`
    alias ls='ls --color=auto'	# Linux or Cygwin
fi

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ディレクトリ名だけでcdする
setopt auto_cd

# ↑を設定すると、 .. とだけ入力したら1つ上のディレクトリに移動できるので……
# 2つ上、3つ上にも移動できるようにする
alias ...='cd ../..'
alias ....='cd ../../..'
#alias bx='bx-osx-x64-mainnet'

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# "~hoge" が特定のパス名に展開されるようにする（ブックマークのようなもの）
# 例： cd ~hoge と入力すると /long/path/to/hogehoge ディレクトリに移動
# hash -d hoge=/long/path/to/hogehoge

# 拡張 glob を有効にする
# glob とはパス名にマッチするワイルドカードパターンのこと
# （たとえば `mv hoge.* ~/dir` における "*"）
# 拡張 glob を有効にすると # ~ ^ もパターンとして扱われる
# どういう意味を持つかは `man zshexpn` の FILENAME GENERATION を参照
setopt extended_glob

# <Tab> でパス名の補完候補を表示したあと、
# 続けて <Tab> を押すと候補からパス名を選択できるようになる
# 候補を選ぶには <Tab> か Ctrl-N,B,F,P
zstyle ':completion:*:default' menu select=1

# 単語の一部として扱われる文字のセットを指定する
# ここではデフォルトのセットから / を抜いたものとする
# こうすると、 Ctrl-W でカーソル前の1単語を削除したとき、 / までで削除が止まる
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# Git Setting
#source ~/.git-completion.zsh
#source ~/.git-completion.bash
#source ~/.git-prompt.sh

# export PS1='\W$(__git_ps1) $ '

############### ターミナルのコマンド受付状態の表示変更
# %n	ユーザー名
# %m	ホスト名
# %~	カレントディレクトリ
# %T	時間(HH:MM)
# %*	時間(HH:MM:SS)
# %D	日付(YY-MM-DD)
##############
#PROMPT='%~ %# '

autoload -Uz vcs_info
setopt prompt_subst
# zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
# zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
zstyle ':vcs_info:*' formats '%F{yellow}[%b]'
precmd() { vcs_info }
# PROMPT='%{${fg[yellow]}%}%~%{${reset_color}%}
# [%n@%md]${vcs_info_msg_0_}
# %(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)ﻭ > !(;^ω^%) > )%f%b'
#PROMPT='%(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵) > !(;^ω^%) > )%f%b'
PROMPT='%(?.%B%F{green}.%B%F{blue})%(?!(๑˃̵ᴗ˂̵)${vcs_info_msg_0_}%F{green} > !(;^ω^%) > )%f%b'
# RPROMPT='[%~]'

#=========================================================
# 仮想通貨
#=========================================================
export DROPBOX=~/Dropbox
export BITCOIN_PRG=$DROPBOX/home/Program/Python/Finance/Bitcoin
export CRYPT_PATH=$DROPBOX/Document/投資/仮想通貨/
export CRYPT_2017=$CRYPT_PATH/2017年
export CRYPT_2018=$CRYPT_PATH/2018年

#=========================================================
# AWS
#=========================================================
# source /anaconda/bin/aws_zsh_completer.sh

#=========================================================
# Cling (C++ インタープリタ)
#=========================================================
# export PATH=/usr/local/Cellar/cling/0.5_1/bin:$PATH















