#
# Mat's super .bashrc
#
# A tweaked out bash script that adds a bunch of useful functionality. A work in progress
#
# NOTE: ~ expansion doesn't work here, for partially unclear reasons

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Tell pepople about the latest
if [ ! -f $HOME/.hushlogin ] ; then
	echo "Run 'mthelp' to get info about Mat's super scripts. Touch ~/.hushlogin to quell this and all other system provided login messages"
fi

mthelp()
{
	cat $DOTFILEPATH/README
}

# Color setup
NOCOLOR=$(tput sgr0)
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BOLD=$(tput bold)
UNDERLINE=$(tput smul)
BLINK=$(tput blink)
REVERSE=$(tput rev)

colortest() {
	echo -e "${NOCOLOR}COLOR_NC (No color)"
	echo -e "${NOCOLOR}${BLACK}BLACK\t${BOLD}BLACK"
	echo -e "${NOCOLOR}${RED}RED\t${BOLD}RED"
	echo -e "${NOCOLOR}${GREEN}GREEN\t${BOLD}GREEN"
	echo -e "${NOCOLOR}${YELLOW}YELLOW\t${BOLD}YELLOW"
	echo -e "${NOCOLOR}${BLUE}BLUE\t${BOLD}BLUE"
	echo -e "${NOCOLOR}${MAGENTA}MAGENTA\t${BOLD}MAGENTA"
	echo -e "${NOCOLOR}${CYAN}CYAN\t${BOLD}CYAN"
	echo -e "${NOCOLOR}${WHITE}WHITE\t${BOLD}WHITE"
}

# Copies your public key to the given ssh host
copypublickey()
{
	echo "Copying public key to $1..."
	cat ~/.ssh/id_dsa.pub | ssh $1 "mkdir -p ~/.ssh && touch ~/.ssh/authorized_keys && cat - >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys && chmod 700 ~/.ssh"
	echo "Done"
}

gemedit() {
	open `dirname \`gem which $1\``
}

dobash() {
	$EDITOR ~/.bashrc
}

#redefine pushd and popd so they don't output the directory stack
pushd()
{
	builtin pushd "$@" > /dev/null
	ls -lhG
}

popd()
{
	builtin popd "$@" > /dev/null
	ls -lhG
}

#alias cd so it uses the directory stack
alias cd='pushd'
#aliad cdb as a command that goes one directory back in the stack
alias cdb='popd'

alias cd..='cd ..'
alias ..='cd ..'

alias dir='ls -lhG'
alias ll='ls -lhG'
alias l='ls -lhG'
alias ls='ls -G'
alias ls-='ls -la #'
alias df='df -h'
alias gdb="gdb -q"
alias make="make -f ~/.makefile"
    
# Resize our window oppourtunistically
shopt -s checkwinsize

# Tweak our history settings
shopt -s histappend
alias h='history|grep'

# Set readline vars
set completion-ignore-case on

# Now to pimp out our prompt
export LSCOLORS=dxexbxbxcxbxbxfx
PS1="[\[${BLUE}\]\u@\h \[${BOLD}\]\w\[${NOCOLOR}\]\$(__git_ps1 ' (\[${MAGENTA}\]%s\[${NOCOLOR}\])')]\\$ "

# Prompt command updates our terminal window title
PROMPT_COMMAND='echo -ne "\033]0; [${USER}@${HOSTNAME} ${PWD/$HOME/~}]\007"'

# Pull in our completion scripts
if [ -f $DOTFILEPATH/bash_completion ]; then
	export BASH_COMPLETION="$DOTFILEPATH/bash_completion"
	export BASH_COMPLETION_DIR="$DOTFILEPATH/bash_completion.d"
	. $DOTFILEPATH/bash_completion
fi

# Source personal definitions -- these are ones that don't belong in a universal bashrc
if [ -f $DOTFILEPATH/bashrc.private ]; then
	. $DOTFILEPATH/bashrc.private
fi

# Source local definitions -- these aren't copied between machines
if [ -f $DOTFILEPATH/bashrc.local ]; then
	. $DOTFILEPATH/bashrc.local
fi