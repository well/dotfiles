if [ ! -f /usr/bin/gcc ] ; then
	echo "You need to install XCode before we can proceed. Please do so."
	exit 1
fi

if [ -z `which brew` ] ; then
	echo "Installing homebrew..."
	ruby -e "$(curl -fsS http://gist.github.com/raw/436471/install_homebrew.rb)"
fi

if [ -z `which git` ] ; then
	echo "Installing git..."
	sudo brew install git
fi

if [ -d ${HOME}/.dotfiles ] ; then
	echo "~/.dotfiles already exists. Run the following manually:"
	echo "git clone git://github.com/mtrudel/dotfiles.git"
	echo "<path to dotfiles repo>/bin/dotfiles link DOTFILEPATH=<path to dotfiles repo>"
	exit 1
fi

git clone git://github.com/mtrudel/dotfiles.git ${HOME}/.dotfiles

${HOME}/.dotfiles/bin/dotfiles link DOTFILEPATH=${HOME}/.dotfiles
