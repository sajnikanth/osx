#!/bin/bash

echo -n -e "\033[1;31mSetup symlinks? \033[0;32m(y/n): \033[0m"
read -n 1 sym
echo ""
if [ "$sym" == "y" ]; then

	rm ~/.vim
	ln -s /Volumes/Stuff/repo/dotfiles/.vim ~/.vim
	rm ~/.vimrc
	ln -s /Volumes/Stuff/repo/dotfiles/.vimrc ~/.vimrc
	rm ~/.bash_profile
	ln -s /Volumes/Stuff/repo/dotfiles/.bash_profile ~/.bash_profile
	rm ~/.bashrc
	#ln -s /Volumes/Stuff/repo/dotfiles/.bashrc ~/.bashrc
	rm ~/.gitconfig
	ln -s /Volumes/Stuff/repo/dotfiles/.gitconfig ~/.gitconfig
	rm ~/.gitignore_global
	ln -s /Volumes/Stuff/repo/dotfiles/.gitignore_global ~/.gitignore_global
	rm ~/.gitflow_export
	ln -s /Volumes/Stuff/repo/dotfiles/.gitflow_export ~/.gitflow_export
	rm ~/.ssh
	ln -s /Volumes/Stuff/repo/dotfiles/.ssh/ ~/.ssh
	/bin/bash --login -c 'sudo chmod 700 ~/.ssh/*'
	ln -s /Volumes/Stuff/Cloud/Dropbox/ ~/Dropbox
	ln -s /Volumes/Stuff/repo/ ~/repo
	ln -s /Volumes/Stuff/repo/android_sdk/ ~/android_sdk
	ln -s /Volumes/Stuff/vagrant/ ~/vagrant
	/bin/bash --login -c ". ~/.bash_profile"
	exec $SHELL -l

fi

echo -n -e "\033[1;31mBefore checking / installing remaining base apps, is port working? \033[0;32m(y/n): \033[0m"
read -n 1 base
echo ""
if [ "$base" == "y" ]; then

	if test ! -s /opt/local/bin/git
	then
		echo -e "\033[1;34mInstalling git...\033[0m"
		sudo port install git-core +bash_completion
	else
		echo -e "\033[0;32mgit found...\033[0m"
	fi

	if test ! -s ~/.git-prompt.sh
	then
		echo -e "\033[1;34mInstalling git prompt...\033[0m"
		curl -o ~/.git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
	else
		echo -e "\033[0;32mgit-prompt found...\033[0m"
	fi

	if test ! -s ~/.git-completion.bash
	then
		echo -e "\033[1;34mInstalling git completion...\033[0m"
		curl -o ~/.git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
	else
		echo -e "\033[0;32mgit-completion found...\033[0m"
	fi

	if test ! -s ~/bin/ack
	then
		echo -e "\033[1;34mInstalling ack...\033[0m"
		mkdir ~/bin
		curl http://beyondgrep.com/ack-2.04-single-file > ~/bin/ack && chmod 0755 !#:3
	else
		echo -e "\033[0;32mack found...\033[0m"
	fi

	if test ! -s /usr/local/bin/brew
	then
		echo -e "\033[1;34mInstalling homebrew...\033[0m"
		ruby <(curl -fsSk https://raw.github.com/mxcl/homebrew/go)
		/bin/bash --login -c ". ~/.bash_profile"
	else
		echo -e "\033[0;32mhomebrew found...\033[0m"
	fi

	if test ! -s /usr/local/bin/tree
	then
		echo -e "\033[1;34mInstalling tree...\033[0m"
		/bin/bash --login -c ". ~/.bash_profile && brew install tree"
	else
		echo -e "\033[0;32mtree found...\033[0m"
	fi

fi

echo -n -e "\033[1;31mInstall remaining dev apps? \033[0;32m(y/n): \033[0m"
read -n 1 dev
echo ""
if [ "$dev" == "y" ]; then

	if test ! -s /usr/local/bin/chromedriver
	then
		echo -e "\033[1;34mInstalling chromedriver...\033[0m"
		brew install chromedriver
	else
		echo -e "\033[0;32mchromedriver found...\033[0m"
	fi

	if test ! -d ~/bin/ec2*
	then
		echo -e "\033[1;34mInstalling ec2 tools...\033[0m"
		wget "http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip" && unzip ec2-api-tools.zip && rm ec2-api-tools.zip && mv ec2-api-tools* ~/bin
	else
		echo -e "\033[0;32mec2tools found...\033[0m"
	fi

	echo -e "\033[1;34mChecking / Installing vagrant omnibus...\033[0m"
	vagrant plugin install vagrant-omnibus

	echo -e "\033[1;34mChecking / Installing vagrant berkshelf...\033[0m"
	vagrant plugin install vagrant-berkshelf

	if test ! -d ~/.rvm
	then
		echo -e "\033[1;34mInstalling rvm and ruby...\033[0m"
		\curl -L https://get.rvm.io | bash -s stable --ruby
	else
		echo -e "\033[0;32mrvm found...\033[0m"
	fi

	echo -e "\033[1;34mChecking / Installing bundler...\033[0m"
	/bin/bash --login -c "rvm reload && gem install bundler"

	echo -e "\033[1;34mChecking / Installing berkshelf...\033[0m"
	/bin/bash --login -c "rvm reload && gem install berkshelf"

	#if test ! -d /Library/Python/2.7/site-packages/MySQL_python*
	#then
	#	echo -e "\033[1;34mInstalling MySQL-Python...\033[0m"
	#	sudo pip install MySQL-Python
	#	mysql -hlocalhost -uroot -e "create database nosereport;"
	#	nosetests --dbreport-create-schema --dbreport-dbtype=mysql --dbreport-host=localhost --dbreport-username=root --dbreport-db=nosereport
	#else
	#	echo -e "\033[0;32mMySQL-Python found...\033[0m"
	#fi
fi

echo ""
echo -e "\033[0;32mAll Done! Restart before use\033[0"
