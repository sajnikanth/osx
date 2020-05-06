#!/bin/bash
echo -n  -e "\033[1;31mHave you installed Command Line Tools? \033[0;32m(y/n): \033[0m"
read -n 1 base
echo ""
if [ "$base" == "y" ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	touch ~/.hushlogin
	brew doctor
	brew tap phinze/homebrew-cask
	brew install wget
	wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
	wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
	brew install ack
	brew install tree
	brew cask install google-chrome
	brew cask install lastpass
	brew cask install vlc
	brew cask install dropbox
	brew cask install the-unarchiver
	brew cask install iterm2
	brew cask install xquartz
	brew cask install shiftit
	brew cask install whatsapp
	brew cask install spotify
	brew cask install amazon-music
	brew cask install slack
	brew cask install jing
	brew cask install visual-studio-code
	brew cask install zoomus
	brew install node
	npm install -g gulp
	npm install -g yarn
else:
	echo -n  -e "To install Command Line Tools, run this ---> \033[1;31mxcode-select --install\033[0m"
	echo ""
fi
echo -n -e "\033[1;31mdotfiles in ~/Dropbox\ \(Personal\)/repo/dotfiles/? \033[0;32m(y/n): \033[0m"
read -n 1 sym
echo ""
if [ "$sym" == "y" ]; then
	rm ~/.vim
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/.vim ~/.vim
	rm ~/.vimrc
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/.vimrc ~/.vimrc
	rm ~/.bash_profile
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/.bash_profile ~/.bash_profile
	rm ~/.bashrc
	rm ~/.gitconfig
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/.gitconfig ~/.gitconfig
	rm ~/.gitignore_global
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/.gitignore_global ~/.gitignore_global
	rm ~/.gitflow_export
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/.gitflow_export ~/.gitflow_export
	rm ~/.ssh
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/.ssh/ ~/.ssh
	/bin/bash --login -c 'sudo chmod 700 ~/.ssh/*'
	ln -s ~/Dropbox\ \(Personal\)/repo/albelli/oet ~/oet
	ln -s ~/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/PhotoOrganizer-Tests ~/api
	ln -s ~/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/StorageAPI-Tests ~/storage
	ln -s ~/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/PhotoOrganizer-Tests-UI ~/ui
	ln -s ~/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/PhotoOrganizer-Tests-Mobile ~/mobile
	ln -s ~/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/PhotoOrganizer-Tests-Load ~/load
	ln -s ~/Dropbox\ \(Personal\)/repo/octopy ~/oct
	/bin/bash --login -c ". ~/.bash_profile"
	rm -rf ~/bin
	mkdir ~/bin
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/clean ~/bin/clean
	rm -rf ~/.config
	mkdir ~/.config
	ln -s ~/Dropbox\ \(Personal\)/repo/dotfiles/flake8 ~/.config/flake8
	git config --global core.excludesfile ~/.gitignore_global
fi
echo -e "Cleanup "
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
echo""
echo -e "To change hostname, run this ---> \033[1;31msudo scutil --set HostName <hostname>\033[0m"
echo -e "enable hot corners, dock animation, install app from anywhere, turn on firewall, turn off Auto Sleep, keyboard repeat fast\033[0m"
echo -e "keyboard tab for all controls, mouse, touchpad, show date, change textdit preference\033[0m"
echo ""
