DOTFILES=`cd \`dirname __FILE__\` > /dev/null && pwd`
ln -fs $DOTFILES/dotmakefile  ${HOME}/.makefile
ln -fs $DOTFILES/irbrc ${HOME}/.irbrc
ln -fs $DOTFILES/bashrc ${HOME}/.bashrc
ln -fs $DOTFILES/bash_profile ${HOME}/.bash_profile
ln -fs $DOTFILES/inputrc ${HOME}/.inputrc
ln -fs $DOTFILES/gitignore ${HOME}/.gitignore
ln -fns $DOTFILES/bin ${HOME}/.bin
