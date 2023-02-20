# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# Python
if [ -d "$HOME/anaconda3/bin" ] ; then
    PATH="$HOME/anaconda3/bin:$PATH"
fi

# Go
if [ -d "$HOME/ghq" ] ; then
    GOPATH="$HOME/ghq"
    PATH="$GOPATH/bin:$PATH"
fi

# Bitcoin
PYCOIN_CACHE_DIR=$HOME/.pycoin_cache
PYCOIN_BTC_PROVIDERS="blockr.io blockchain.info blockexplorer.com"
export PYCOIN_CACHE_DIR PYCOIN_BTC_PROVIDERS

