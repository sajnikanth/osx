#!/bin/bash
echo -n -e "\033[1;31mSetup symlinks? \033[0;32m(y/n): \033[0m"
read -n 1 sym
echo ""
if [ "$sym" == "y" ]; then
	rm /Users/sajnikanth/.vim
	ln -s /Volumes/Stuff/repo/dotfiles/.vim ~/.vim
	rm /Users/sajnikanth/.vimrc
	ln -s /Volumes/Stuff/repo/dotfiles/.vimrc ~/.vimrc
	rm ~/.bash_profile
	ln -s /Volumes/Stuff/repo/dotfiles/.bash_profile ~/.bash_profile
	rm ~/.bashrc
	ln -s /Volumes/Stuff/repo/dotfiles/.bashrc ~/.bashrc
	rm /Users/sajnikanth/.gitconfig
	ln -s /Volumes/Stuff/repo/dotfiles/.gitconfig ~/.gitconfig
	rm /Users/sajnikanth/.gitignore_global
	ln -s /Volumes/Stuff/repo/dotfiles/.gitignore_global ~/.gitignore_global
	ln -s /Volumes/Stuff/repo/dotfiles/.ssh/ ~/.ssh
	/bin/bash --login -c 'chmod 700 ~/.ssh/id_rsa'
	/bin/bash --login -c 'chmod 700 ~/.ssh/*.pem'
	ln -s /Volumes/Stuff/Cloud/Dropbox/ ~/Dropbox
	ln -s /Volumes/Stuff/repo/ ~/repo
	ln -s /Volumes/Stuff/repo/android_sdk/ ~/android_sdk
	ln -s /Volumes/Stuff/vagrant/ ~/vagrant
	/bin/bash --login -c '. ~/.bash_profile'
	exec $SHELL -l
	
fi

echo -n -e "\033[1;31mInstall remaining base apps (and is port working)? \033[0;32m(y/n): \033[0m"
read -n 1 base
echo ""
if [ "$base" == "y" ]; then
	echo -e "\033[1;34mInstalling git...\033[0m"
	sudo port install git-core

	echo -e "\033[1;34mInstalling bash_completion...\033[0m"
	sudo port install bash-completion

	echo -e "\033[1;34mInstalling git prompt...\033[0m"
	curl -o ~/.git-prompt.sh https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh

	echo -e "\033[1;34mInstalling ack...\033[0m"
	mkdir ~/bin
	curl http://beyondgrep.com/ack-2.04-single-file > ~/bin/ack && chmod 0755 !#:3

	echo -e "\033[1;34mInstalling rbenv and rbenv-build...\033[0m"
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

	echo -e "\033[1;34mInstalling home brew...\033[0m"
	ruby <(curl -fsSk https://raw.github.com/mxcl/homebrew/go)
	/bin/bash --login -c '. ~/.bash_profile'

	echo -e "\033[1;34mInstalling p7zip...\033[0m"
	brew install p7zip

	echo -e "\033[1;34mInstalling tree...\033[0m"
	brew install tree
fi

echo -n -e "\033[1;31mInstall remaining dev apps? \033[0;32m(y/n): \033[0m"
read -n 1 dev
echo ""
if [ "$dev" == "y" ]; then
	echo -e "\033[1;34mInstalling custom scripts...\033[0m"
	curl https://raw.github.com/sajnikanth/osx/master/bin/vu > ~/bin/vu && chmod +x ~/bin/vu
	curl https://raw.github.com/sajnikanth/osx/master/bin/dot > ~/bin/dot && chmod +x ~/bin/dot
	curl https://raw.github.com/sajnikanth/osx/master/bin/holm > ~/bin/holm && chmod +x ~/bin/holm

	echo -e "\033[1;34mInstalling chromedriver...\033[0m"
	brew install chromedriver

	echo -e "\033[1;34mInstalling ec2 tools...\033[0m"
	wget "http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip" && unzip ec2-api-tools.zip && rm ec2-api-tools.zip && mv ec2-api-tools* ~/bin

	echo -e "\033[1;34mInstalling vagrant omnibus...\033[0m"
	vagrant plugin install vagrant-omnibus

	echo -e "\033[1;34mInstalling vagrant berkshelf...\033[0m"
	vagrant plugin install vagrant-berkshelf

	echo -e "\033[1;34mInstalling ruby 1.9.3...\033[0m"
	rbenv install 1.9.3-p385
	/bin/bash --login -c '. ~/.bash_profile'
	rbenv rehash && rbenv shell 1.9.3-p385 && rbenv global 1.9.3-p385

	echo -e "\033[1;34mInstalling bundler...\033[0m"
	gem install bundler

	echo -e "\033[1;34mInstalling berkshelf...\033[0m"
	gem install berkshelf

	echo -e "\033[1;34mDownloading vagrant box (ubuntu 13.04). This could take a while...\033[0m"
	vagrant box add base http://goo.gl/h2ckI

	#sudo pip install MySQL-Python
	#mysql -hlocalhost -uroot -e "create database nosereport;"
	#nosetests --dbreport-create-schema --dbreport-dbtype=mysql --dbreport-host=localhost --dbreport-username=root --dbreport-db=nosereport
fi

echo ""
echo "All Done! Restart before use"
echo ""
