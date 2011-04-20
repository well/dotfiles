if [ -z `which git` ] ; then
	if [ ! -f /usr/bin/gcc ] ; then
		echo "You need to install XCode before we can proceed."
		echo "If you don't want to install XCode, then you can install"
		echo "a prebuilt git binary from http://code.google.com/p/git-osx-installer/"
		echo "and rerun this installer"
		exit 1
	fi

	if [ -z `which brew` ] ; then
		echo "Installing homebrew..."
		ruby -e "$(curl -fsS https://gist.github.com/raw/436471/install_homebrew.rb)"
	fi

	echo "Installing git..."
	sudo brew install git
fi

if [ -d ${HOME}/.dotfiles ] ; then
	echo "~/.dotfiles already exists. Run the following manually:"
	echo "git clone git://github.com/well/dotfiles.git"
	echo "DOTFILEPATH=<path to dotfiles repo> <path to dotfiles repo>/bin/dotfiles link"
	exit 1
fi

git clone git://github.com/well/dotfiles.git ${HOME}/.dotfiles

DOTFILEPATH=${HOME}/.dotfiles ${HOME}/.dotfiles/bin/dotfiles link 
