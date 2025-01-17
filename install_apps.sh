#!/bin/bash
echo -n  -e "\033[1;31mHave you enabled Admin Access? \033[0;32m(y/n): \033[0m"
read -n 1 base
echo ""
if [ "$base" == "y" ]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	touch ~/.hushlogin
	brew doctor
	brew install wget
	wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
	wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
	brew install rectangle
	brew install ack
	brew install tree
	brew install google-chrome
	brew install lastpass
	brew install vlc
	brew install dropbox
	brew install the-unarchiver
	brew install iterm2
	brew install whatsapp
	brew install spotify
	brew install slack
fi

echo -n -e "\033[1;31mdotfiles in ~/Dropbox/repo/dotfiles/? \033[0;32m(y/n): \033[0m"
read -n 1 sym
echo ""
if [ "$sym" == "y" ]; then
	rm ~/.zshrc
	ln -s ~/Dropbox/repo/dotfiles/.zshrc ~/.zshrc
	rm ~/.vimrc
	ln -s ~/Dropbox/repo/dotfiles/.vimrc ~/.vimrc

	rm ~/.gitconfig
	ln -s ~/Dropbox/repo/dotfiles/.gitconfig ~/.gitconfig
	rm ~/.gitignore_global
	ln -s ~/Dropbox/repo/dotfiles/.gitignore_global ~/.gitignore_global
	rm ~/.gitflow_export
	ln -s ~/Dropbox/repo/dotfiles/.gitflow_export ~/.gitflow_export
	git config --global core.excludesfile ~/.gitignore_global

	rm ~/.ssh
	ln -s ~/Dropbox/repo/dotfiles/.ssh/ ~/.ssh
	/bin/bash --login -c 'sudo chmod 700 ~/.ssh/*'
fi
echo -e "Cleanup "
brew cleanup
rm -f -r /Library/Caches/Homebrew/*
echo""
echo -e "To change hostname, ---> \033[1;31msudo scutil --set HostName <hostname>\033[0m"
echo -e "install app from anywhere, turn on firewall, turn off Auto Sleep, keyboard repeat fast\033[0m"
echo -e "keyboard tab for all controls, change textdit preference\033[0m"
echo ""
