if [ ! -f /usr/bin/gcc ] ; then
	echo "You need to install XCode before we can proceed. Please do so."
	exit 1
fi

if [ -z `which brew` ] ; then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsS http://gist.github.com/raw/436471/install_homebrew.rb)"
fi

git clone git://github.com/mtrudel/dotfiles.git ~/.dotfiles

(cd ~/.dotfiles ; ./install.sh)