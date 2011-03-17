# .bash_profile

# This needs to be first
export DOTFILEPATH=$(cd `dirname \`readlink ~/.bashrc\`` && pwd -P)

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment (stuff that will get passed on to subshells)

export PATH=$HOME/.bin:$PATH
export MANPATH=/usr/local/man:$MANPATH

export EDITOR=vim
export CVSEDITOR=vim
export SVN_EDITOR=vim

unset USERNAME
export CLICOLOR

export HISTCONTROL=erasedups
export HISTSIZE=10000

export GREP_OPTIONS="-I --color --exclude=*.svn-base"
export NODE_PATH=/usr/local/lib/node
