#!/bin/bash
echo ""
echo "***************************************************************************************************************************************"
echo -e "                              To install Command Line Tools, run this ---> \033[1;31mxcode-select --install\033[0m"
echo "***************************************************************************************************************************************"
echo ""
echo -n  -e "\033[1;31mHave you installed Command Line Tools? \033[0;32m(y/n): \033[0m"
read -n 1 base
echo""
if [ "$base" == "y" ]; then
	echo "Enter sudo password"
	sudo echo ""
	ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
	brew doctor
	brew tap phinze/homebrew-cask
	brew install brew-cask
	brew install wget
	brew cask install google-chrome
	brew cask install lastpass-universal
	brew cask install google-notifier
	brew cask install firefox
	brew cask install flash
	brew cask install vlc
	brew cask install alfred
	brew cask install dropbox
	brew cask install iterm2
	brew cask install skype
	if test ! -d /Applications/ShiftIt.app
	then
		echo -e "\033[1;34mInstalling Shiftit...\033[0m"
		curl -O https://dl.dropboxusercontent.com/u/4289150/apps/shiftit.zip
		unzip -q shiftit.zip
		sudo mv ShiftIt.app/ /Applications/
		rm shiftit.zip
	else
		echo -e "\033[0;32mShiftit found...\033[0m"
	fi
	if test ! -d ~/Library/PreferencePanes/MouseLocator.prefPane
	then
		echo -e "\033[1;34mInstalling Mouselocator...\033[0m"
		wget --no-check-certificate http://www.2point5fish.com/files/MouseLocator.dmg -O mouselocator.dmg
		hdiutil	mount mouselocator.dmg
		sudo cp -r /Volumes/Mouse*/Mouse*.app/Contents/Resources/Distribution/MouseLocator.prefPane ~/Library/PreferencePanes/
		hdiutil unmount -force /Volumes/Mouse*
		rm mouselocator.dmg
	else
		echo -e "\033[0;32mMouselocator found...\033[0m"
	fi
	if test ! -s /usr/local/bin/pip
	then
		echo -e "\033[1;34mInstalling pip...\033[0m"
		sudo easy_install pip
	else
		echo -e "\033[0;32mpip found...\033[0m"
	fi
	if test ! -d /Library/Python/2.7/site-packages/grip
	then
		echo -e "\033[1;34mInstalling grip (Github Readme Instant Preview)...\033[0m"
		sudo pip install grip
	else
		echo -e "\033[0;32mgrip found...\033[0m"
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
	if test ! -d /usr/share/prey
	then
		echo -e "\033[1;34mCopying Prey installer to desktop...\033[0m"
		wget --no-check-certificate -nd -r -l1 --no-parent -A dmg https://preyproject.com/releases/current/ && rm robots.txt && mv prey*.dmg ~/Desktop
	else
		echo -e "\033[0;32mPrey found...\033[0m"
	fi
fi

echo -n  -e "\033[1;31mInstall apps for your personal computer? \033[0;32m(y/n): \033[0m"
read -n 1 home
echo""
if [ "$home" == "y" ]; then
	brew cask install f-lux
	brew cask install transmission
	brew cask install picasa
	brew cask install team-viewer
	brew cask install tv-shows
	brew cask install livestation
	if test ! -d /Applications/SkyDrive.app
	then
		echo -e "\033[1;34mInstalling SkyDrive...\033[0m"
		wget --no-check-certificate --user-agent "safari" http://www.macupdate.com/download/42736 -O skydrive.pkg
		sudo installer -pkg skydrive.pkg -target LocalSystem
		rm skydrive.pkg
	else
		echo -e "\033[0;32mSkyDrive found...\033[0m"
	fi
	if test ! -d /Library/Internet\ Plug-Ins/googletalkbrowserplugin.plugin
	then
		echo -e "\033[1;34mInstalling Google Voice...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg https://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg -O googlevoice.dmg
		hdiutil mount googlevoice.dmg
		sudo installer -pkg /Volumes/GoogleVoice*/Google*.pkg -target LocalSystem
		hdiutil unmount -force /Volumes/GoogleVoice*
		rm googlevoice.dmg
	else
		echo -e "\033[0;32mGoogle Voice found...\033[0m"
	fi
fi

echo -n  -e "\033[1;31mInstall dev apps? \033[0;32m(y/n): \033[0m"
read -n 1 dev
echo ""
if [ "$dev" == "y" ]; then
	brew install chromedriver
	brew cask install virtualbox
	brew cask install vagrant
	brew cask install mongohub
	#brew cask install sequel-pro
	\curl -L https://get.rvm.io | bash -s stable --ruby
	/bin/bash --login -c "rvm reload && gem install bundler"
	vagrant plugin install vagrant-omnibus
	vagrant plugin install vagrant-berkshelf
	/bin/bash --login -c "rvm reload && gem install bundler"
	/bin/bash --login -c "rvm reload && gem install berkshelf"
	if test ! -d /Library/Java/JavaVirtualMachines
	then
		echo -e "\033[1;34mInstalling Java...\033[0m"
		wget http://support.apple.com/downloads/DL1572/en_US/JavaForOSX2013-05.dmg -O jdk.dmg
		#wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/40659 -O jdk.dmg
		hdiutil mount jdk.dmg
		sudo installer -pkg /Volumes/Java*/Java*.pkg -target LocalSystem
		hdiutil unmount -force /Volumes/Java*
		rm jdk.dmg
	else
		echo -e "\033[0;32mJava found...\033[0m"
	fi
	if test ! -s /usr/local/bin/nosetests
	then
		echo -e "\033[1;34mInstalling nosetests...\033[0m"
		sudo easy_install nose
	else
		echo -e "\033[0;32mnosetests found...\033[0m"
	fi
	if test ! -s /usr/local/bin/bpython
	then
		echo -e "\033[1;34mInstalling bpython...\033[0m"
		sudo easy_install bpython
	else
		echo -e "\033[0;32mbpython found...\033[0m"
	fi
	if test ! -d /Library/Python/2.7/site-packages/selenium
	then
		echo -e "\033[1;34mInstalling selenium...\033[0m"
		sudo pip install -U selenium
	else
		echo -e "\033[0;32mselenium found...\033[0m"
	fi
	if test ! -d /Library/Python/2.7/site-packages/holmium
	then
		echo -e "\033[1;34mInstalling holmium...\033[0m"
		sudo pip install -U holmium.core
	else
		echo -e "\033[0;32mholmium found...\033[0m"
	fi
	if test ! -d /Library/Python/2.7/site-packages/flake8
	then
		echo -e "\033[1;34mInstalling flake8 (python source code checker)...\033[0m"
		sudo pip install flake8
	else
		echo -e "\033[0;32mflake8 found...\033[0m"
	fi
fi

echo -n -e "\033[1;31mSetup dotfiles and symlinks? \033[0;32m(y/n): \033[0m"
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
fi

echo""
echo "***************************************************************************************************************************************"
echo -e "                       To change hostname, run this ---> \033[1;31msudo scutil --set HostName <hostname>\033[0m"
echo -e "                                           Transmission ----> \033[1;31mhttp://i.imgur.com/dqGWO.png\033[0m"
echo -e "                                            Startup ----> \033[1;31mhttp://i.imgur.com/5AsHowz.png\033[0m"
echo -e "                                            Alfred -----> \033[1;31mhttp://i.imgur.com/kIepmS9.png\033[0m"
echo -e "       Mouse Locator Agent lives here ----> \033[1;31m/Users/sajnikanth/Library/PreferencePanes/MouseLocator.prefPane/Contents/Resources/\033[0m"
echo -e "      enable hot corners, dock animation, install app from anywhere, turn on firewall, turn off Auto Sleep, keyboard repeat fast\033[0m"
echo -e "     keyboard tab for all controls, set alt+space to spotlight, mouse, touchpad, user image, show date, change textdit preference\033[0m"
echo -e "                                                     Install XCode (for dev)"
echo "***************************************************************************************************************************************"
echo ""
