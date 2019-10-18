#!/bin/bash
# echo -n  -e "\033[1;31mDoes /usr/local/ exist? (Refer to http://j.mp/1O4rePe) \033[0;32m(y/n): \033[0m"
# read -n 1 base
# echo ""
# if [ "$base" == "y" ]; then
# 	sudo chown -R $(whoami):admin /usr/local
# fi
echo -n  -e "\033[1;31mHave you installed Command Line Tools? \033[0;32m(y/n): \033[0m"
read -n 1 base
echo ""
if [ "$base" == "y" ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	# sudo chown -R $(whoami):admin /usr/local # from OSX 10.11
	touch ~/.hushlogin
	brew doctor
	brew tap phinze/homebrew-cask
	brew install wget
	wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
	wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
	brew install ack
	brew install tree
	brew install brew-cask
	brew install chromedriver
	brew install allure
	brew cask install google-chrome
	brew cask install lastpass
	brew cask install vlc
	brew cask install dropbox
	brew cask install google-photos-backup-and-sync
	brew cask install the-unarchiver
	brew cask install iterm2
	brew cask install xquartz
	brew cask install shiftit
	brew cask install google-drive
	brew cask install namechanger
	brew cask install whatsapp
	brew cask install spotify
	brew cask install slack
	brew cask install jing
	# brew cask install java
else:
	echo -n  -e "To install Command Line Tools, run this ---> \033[1;31mxcode-select --install\033[0m"
	echo ""
fi
echo -n  -e "\033[1;31mInstall apps for your personal computer? \033[0;32m(y/n): \033[0m"
read -n 1 home
echo ""
if [ "$home" == "y" ]; then
	brew cask install transmission
fi
echo -n  -e "\033[1;31mInstall dev apps? \033[0;32m(y/n): \033[0m"
read -n 1 dev
echo ""
if [ "$dev" == "y" ]; then
	echo -n  -e "use python3 and install it properly"
	# sudo easy_install nose
	# sudo easy_install bpython
	# sudo pip install -U selenium
	# sudo pip install -U holmium.core
	# sudo easy_install pip
	# sudo pip install flake8
	# sudo pip install grip
	echo ""
fi
echo -n -e "\033[1;31mdotfiles in /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/? \033[0;32m(y/n): \033[0m"
read -n 1 sym
echo ""
if [ "$sym" == "y" ]; then
	rm ~/.vim
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/.vim ~/.vim
	rm ~/.vimrc
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/.vimrc ~/.vimrc
	rm ~/.bash_profile
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/.bash_profile ~/.bash_profile
	rm ~/.bashrc
	rm ~/.gitconfig
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/.gitconfig ~/.gitconfig
	rm ~/.gitignore_global
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/.gitignore_global ~/.gitignore_global
	rm ~/.gitflow_export
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/.gitflow_export ~/.gitflow_export
	rm ~/.ssh
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/.ssh/ ~/.ssh
	/bin/bash --login -c 'sudo chmod 700 ~/.ssh/*'
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/PhotoOrganizer-Tests ~/api
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/StorageAPI-Tests ~/storage
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/PhotoOrganizer-Tests-UI ~/ui
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/albelli/photo-organiser/PhotoOrganizer-Tests-Mobile ~/mobile
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/octopy ~/oct
	/bin/bash --login -c ". ~/.bash_profile"
	rm -rf ~/bin
	mkdir ~/bin
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/clean ~/bin/clean
	rm -rf ~/.config
	mkdir ~/.config
	ln -s /Volumes/Stuff/Cloud/Dropbox\ \(Personal\)/repo/dotfiles/flake8 ~/.config/flake8
fi
echo -e "Cleanup "
brew cleanup && brew cask cleanup
rm -f -r /Library/Caches/Homebrew/*
echo""
echo -e "To change hostname, run this ---> \033[1;31msudo scutil --set HostName <hostname>\033[0m"
echo -e "enable hot corners, dock animation, install app from anywhere, turn on firewall, turn off Auto Sleep, keyboard repeat fast\033[0m"
echo -e "keyboard tab for all controls, mouse, touchpad, show date, change textdit preference\033[0m"
echo ""