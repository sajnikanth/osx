#!/bin/bash

echo -n -e "\033[1;31mInstall basic apps? \033[0;32m(y/n): \033[0m"
read -n 1 base
echo""
if [ "$base" == "y" ]; then
	echo -e "\033[1;34mInstalling wget...\033[0m"
	curl -O https://dl.dropboxusercontent.com/u/4289150/apps/wget.zip
	unzip -q wget.zip
	installer -pkg wget.pkg -target LocalSystem
	rm wget.*

	echo -e "\033[1;34mInstalling google chrome...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/32956 -O googlechrome.dmg
	hdiutil mount googlechrome.dmg
	cp -R /Volumes/Google*/*Chrome.app /Applications/
	hdiutil unmount -force /Volumes/Google*
	rm googlechrome.dmg
	
	echo -e "\033[1;34mInstalling google notifier...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/19272 -O googlenotifier.dmg
	#wget http://dl.google.com/mac/download/GoogleNotifier_1.10.7.dmg --no-check-certificate
	hdiutil mount googlenotifier.dmg
	cp -R /Volumes/Google*/Google*.app /Applications/
	hdiutil unmount -force /Volumes/Google*
	rm googlenotifier.dmg
	
	echo -e "\033[1;34mInstalling mozilla firefox...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/10700 -O firefox.dmg
	hdiutil mount firefox.dmg
	cp -R /Volumes/Firefox/Firefox.app /Applications/
	hdiutil unmount -force /Volumes/Firefox/
	rm firefox.dmg

	echo -e "\033[1;34mInstalling flash player...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/4783 -O flash.dmg
	hdiutil mount flash.dmg
	installer -pkg /Volumes/Flash*/Install*.app/Contents/Resources/Adobe*.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/Flash*
	rm flash.dmg

	echo -e "\033[1;34mInstalling java runtime environment...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/44788 -O java.dmg
	hdiutil mount java.dmg
	installer -pkg /Volumes/Java*/Java*.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/Java*
	rm java.dmg
	
	echo -e "\033[1;34mInstalling alfred...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/34344 -O alfred.zip
	unzip -q alfre*.zip
	mv Alfr*.app /Applications/
	rm alfre*.zip

	echo -e "\033[1;34mInstalling xtrafinder...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/42067 -O xtrafinder.dmg
	#wget http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg --no-check-certificate
	hdiutil mount xtrafinder.dmg
	installer -pkg /Volumes/XtraFinder*/XtraFinder.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/XtraFinder*
	rm xtrafinder.dmg

	echo -e "\033[1;34mInstalling evernote...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/27456
	unzip Evernote*.zip
	mv Evernote.app /Applications/
	#hdiutil convert -quiet evernote.dmg -format UDTO -o evernote
	#hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint right_here evernote.cdr
	#cp -R right_here/Evernote.app /Applications/
	#hdiutil detach right_here
	rm Evernote*.zip

	echo -e "\033[1;34mInstalling shiftit...\033[0m"
	curl -O https://dl.dropboxusercontent.com/u/4289150/apps/shiftit.zip
	unzip -q shiftit.zip
	mv ShiftIt.app/ /Applications/
	rm shiftit.zip

	echo -e "\033[1;34mInstalling dropbox...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/28731 -O dropbox.dmg
	#wget -O Dropbox.dmg https://www.dropbox.com/download?plat=mac --no-check-certificate
	hdiutil mount dropbox.dmg
	cp -R /Volumes/Dropbox*/Dropbox.app /Applications/
	hdiutil unmount -force /Volumes/Dropbox*
	rm dropbox.dmg

	echo -e "\033[1;34mInstalling mouselocator...\033[0m"
	wget --no-check-certificate http://www.2point5fish.com/files/MouseLocator.dmg -O mouselocator.dmg
	hdiutil	mount mouselocator.dmg
	cp -r /Volumes/Mouse*/Mouse*.app/Contents/Resources/Distribution/MouseLocator.prefPane ~/Library/PreferencePanes/
	hdiutil unmount -force /Volumes/Mouse*
	rm mouselocator.dmg

	echo -e "\033[1;34mInstalling jing...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/25619 -O jing.dmg
	#wget -A dmg http://download.techsmith.com/jing/mac/jing.dmg --no-check-certificate
	hdiutil convert -quiet jing.dmg -format UDTO -o jing
	hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint right_here jing.cdr
	mv right_here/Jing.app /Applications/
	hdiutil detach right_here
	rm jing.*

	echo -e "\033[1;34mInstalling iterm2...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/40028 -O iterm2.zip
	unzip -q iterm2.zip
	mv iTerm.app /Applications/
	rm iterm2.zip

	echo -e "\033[1;34mCopying prey installer to desktop...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/33763 -O ~/Desktop/prey.dmg
	#wget --no-check-certificate -nd -r -l1 --no-parent -A dmg https://preyproject.com/releases/current/ && rm robots.txt && mv prey*.dmg ~/Desktop

	echo -e "\033[1;34mInstalling skype...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/15805 -O skype.dmg
	hdiutil mount skype.dmg
	cp -R /Volumes/Skype/Skype.app /Applications/
	hdiutil unmount -force /Volumes/Skype
	rm skype.dmg

	echo -e "\033[1;34mInstalling macports...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/21309 -O macports.pkg
	#wget https://distfiles.macports.org/MacPorts/MacPorts-2.1.3-10.8-MountainLion.pkg --no-check-certificate
	installer -pkg macports.pkg -target LocalSystem
	rm macports.pkg

	echo -e "\033[1;34mInstalling pip...\033[0m"
	easy_install pip

fi

echo -n  -e "\033[1;31mInstall apps for your personal computer? \033[0;32m(y/n): \033[0m"
read -n 1 home
echo""
if [ "$home" == "y" ]; then
	echo -e "\033[1;34mInstalling flux...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/37261 -O flux.zip
	#wget https://herf.org/flux/Flux.zip --secure-protocol=SSLv3 --no-check-certificate
	unzip -q flux.zip
	mv Flux.app /Applications/
	rm flux.zip

	echo -e "\033[1;34mInstalling vlc...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/5758 -O vlc.dmg
	hdiutil mount vlc.dmg
	cp -R /Volumes/vlc*/*.app /Applications/
	hdiutil unmount -force /Volumes/vlc*
	rm vlc.dmg

	echo -e "\033[1;34mInstalling transmission...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/19378 -O transmission.dmg
	hdiutil mount transmission.dmg
	cp -R /Volumes/Transmission/Transmission.app /Applications/
	hdiutil unmount -force /Volumes/Transmission/
	rm transmission.dmg

	echo -e "\033[1;34mInstalling picasa...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/30131 -O picasa.dmg
	hdiutil mount picasa.dmg
	cp -R /Volumes/Picasa*/Picasa.app /Applications/
	hdiutil unmount -force /Volumes/Picasa*
	rm picasa.dmg

	echo -e "\033[1;34mInstalling teamviewer...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/27332 -O teamviewer.dmg
	hdiutil mount teamviewer.dmg
		installer -pkg /Volumes/TeamViewer/Install*.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/TeamViewer
	rm teamviewer.dmg

	echo -e "\033[1;34mInstalling tvshows2...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/24834 -O tvshows.zip
	#wget http://tvshowsapp.com/TVShows.zip -O TVShows.zip --no-check-certificate
	unzip -q tvshows.zip
	mv TVShows.prefPane/ ~/Library/PreferencePanes/
	rm tvshows.zip

	echo -e "\033[1;34mInstalling livestation...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/28490 -O livestation.dmg
	hdiutil convert -quiet livestation.dmg -format UDTO -o Livestation
	hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint right_here Livestation.cdr
	mv right_here/Livestation.app /Applications/
	hdiutil detach right_here
	rm livestation.*

	echo -e "\033[1;34mInstalling skydrive...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/42736 -O skydrive.pkg
	installer -pkg skydrive.pkg -target LocalSystem
	rm skydrive.pkg

	echo -e "\033[1;34mInstalling google voice...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg https://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg -O googlevoice.dmg
	hdiutil mount googlevoice.dmg
	installer -pkg /Volumes/GoogleVoice*/Google*.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/GoogleVoice*
	rm googlevoice.dmg
fi

echo -n  -e "\033[1;31mInstall dev apps? \033[0;32m(y/n): \033[0m"
read -n 1 dev
echo ""
if [ "$dev" == "y" ]; then
	echo -e "\033[1;34mInstalling openjdk...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/40659 -O jdk.dmg
	hdiutil mount jdk.dmg
	installer -pkg /Volumes/Oracle*/JDK*.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/Oracle*
	rm jdk.dmg

	echo -e "\033[1;34mInstalling virtualbox...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/24801 -O virtualbox.dmg
	hdiutil mount virtualbox.dmg
	installer -pkg /Volumes/Virtual*/VirtualBox.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/Virtual*
	rm virtualbox.dmg

	echo -e "\033[1;34mInstalling vagrant...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://goo.gl/xXOmn -O vagrant.dmg
	hdiutil mount vagrant.dmg
	installer -package /Volumes/Vagrant*/Vagrant.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/Vagrant*
	rm vagrant.dmg

	# Install CLI apps
	echo -e "\033[1;34mInstalling nosetests...\033[0m"
	easy_install nose
	echo -e "\033[1;34mInstalling bpython...\033[0m"
	easy_install bpython
	echo -e "\033[1;34mInstalling selenium...\033[0m"
	pip install -U selenium
	echo -e "\033[1;34mInstalling holmium...\033[0m"
	pip install -U holmium.core
	echo -e "\033[1;34mInstalling flake8 (python source code checker)...\033[0m"
	pip install flake8
	echo -e "\033[1;34mInstalling grip (Github Readme Instant Preview)...\033[0m"
	pip install grip
	echo -e "\033[1;31mUpdates OS and install XCode CLT before running second script\033[0m"

	#echo -e "\033[1;34mInstalling nosedbreport...\033[0m"
	#pip install nosedbreport

	#echo -e "\033[1;34mInstalling mysql...\033[0m"
	#wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/6915 -O mysql.dmg
	#hdiutil mount mysql.dmg
	#installer -pkg /Volumes/mysql*/mysql*.pkg -target LocalSystem
	#installer -pkg /Volumes/mysql*/MySQLStartupItem.pkg/ -target LocalSystem
	#cp -r /Volumes/mysql*/MySQL.prefPane ~/Library/PreferencePanes/
	#hdiutil unmount -force /Volumes/mysql*
	#rm mysql.dmg
	#/Library/StartupItems/MySQLCOM/MySQLCOM start

	#echo -e "\033[1;34mInstalling sequelpro...\033[0m"
	#wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/28473 -O sequelpro.dmg
	#hdiutil mount sequelpro.dmg
	#cp -R /Volumes/Sequel*/*.app /Applications/
	#hdiutil unmount -force /Volumes/Sequel*
	#rm sequel*.dmg
fi

echo""
echo "***************************************************************************************************************************************"
echo -e "                       To change hostname, run this ---> \033[1;31msudo scutil --set HostName <hostname>\033[0m"
echo -e "                                           Transmission ----> \033[1;31mhttp://i.imgur.com/dqGWO.png\033[0m"
echo -e "                                            Startup ----> \033[1;31mhttp://i.imgur.com/5AsHowz.png\033[0m"
echo -e "                                           XtraFinder ----> \033[1;31mhttp://i.imgur.com/eGpq7u8.png\033[0m"
echo -e "                                            Alfred -----> \033[1;31mhttp://i.imgur.com/9LAdbwS.png\033[0m"
echo -e "       Mouse Locator Agent lives here ----> \033[1;31m/Users/sajnikanth/Library/PreferencePanes/MouseLocator.prefPane/Contents/Resources/\033[0m"
echo -e "         turn off Auto Sleep, keyboard repeat fast, keyboard tab for all controls, install app from anywhere, turn on firewall\033[0m"
echo -e "   enable hot corners, dock animation, user image, show date, enable assistive, change textdit preference, change mac+space to alfred\033[0m"
echo "***************************************************************************************************************************************"
echo ""
