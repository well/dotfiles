# .bash_profile

# This needs to be first
export DOTFILEPATH=$(cd `dirname \`readlink ~/.bashrc\`` && pwd -P)

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment (stuff that will get passed on to subshells)

export PATH=$PATH:$HOME/.bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:~/.gem/ruby/1.8/bin:
export MANPATH=$MANPATH:/opt/local/share/man:/usr/local/man

if [ -x `which mate` ] 
then
  export EDITOR=mate
  export CVSEDITOR="mate -w"
  export SVN_EDITOR="mate -w"
else
  export EDITOR=vim
  export CVSEDITOR=vim
  export SVN_EDITOR=vim
fi
unset USERNAME
export CLICOLOR

export HISTCONTROL=erasedups
export HISTSIZE=10000

export GREP_OPTIONS="-I --color --exclude=*.svn-base"
