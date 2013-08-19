#!/bin/bash

echo -e "\033[1;31mChecking / Installing base apps...\033[0m"

if test ! -s /usr/local/bin/wget
then
	echo -e "\033[1;34mInstalling wget...\033[0m"
	curl -O https://dl.dropboxusercontent.com/u/4289150/apps/wget.zip
	unzip -q wget.zip
	installer -pkg wget.pkg -target LocalSystem
	rm wget.*
else
	echo -e "\033[0;32mwget found...\033[0m"
fi


if test ! -d /Applications/Google\ Chrome.app
then
	echo -e "\033[1;34mInstalling Google Chrome...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/32956 -O googlechrome.dmg
	hdiutil mount googlechrome.dmg
	cp -R /Volumes/Google*/*Chrome.app /Applications/
	hdiutil unmount -force /Volumes/Google*
	rm googlechrome.dmg
else
	echo -e "\033[0;32mGoogle Chrome found...\033[0m"
fi

if test ! -d /Applications/Google\ Notifier.app
then
	echo -e "\033[1;34mInstalling Google Notifier...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/19272 -O googlenotifier.dmg
	#wget http://dl.google.com/mac/download/GoogleNotifier_1.10.7.dmg --no-check-certificate
	hdiutil mount googlenotifier.dmg
	cp -R /Volumes/Google*/Google*.app /Applications/
	hdiutil unmount -force /Volumes/Google*
	rm googlenotifier.dmg
else
	echo -e "\033[0;32mGoogle Notifier found...\033[0m"
fi

if test ! -d /Applications/Firefox.app
then
	echo -e "\033[1;34mInstalling Firefox...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/10700 -O firefox.dmg
	hdiutil mount firefox.dmg
	cp -R /Volumes/Firefox/Firefox.app /Applications/
	hdiutil unmount -force /Volumes/Firefox/
	rm firefox.dmg
else
	echo -e "\033[0;32mFirefox found...\033[0m"
fi

if test ! -d /Library/Internet\ Plug-Ins/Flash\ Player.plugin
then
	echo -e "\033[1;34mInstalling Flash Player...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/4783 -O flash.dmg
	hdiutil mount flash.dmg
	installer -pkg /Volumes/Flash*/Install*.app/Contents/Resources/Adobe*.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/Flash*
	rm flash.dmg
else
	echo -e "\033[0;32mFlash Player found...\033[0m"
fi

if test ! -d /Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin
then
	echo -e "\033[1;34mInstalling JRE...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/44788 -O java.dmg
	hdiutil mount java.dmg
	installer -pkg /Volumes/Java*/Java*.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/Java*
	rm java.dmg
else
	echo -e "\033[0;32mJRE found...\033[0m"
fi

if test ! -d /Applications/VLC.app
then
	echo -e "\033[1;34mInstalling VLC...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/5758 -O vlc.dmg
	hdiutil mount vlc.dmg
	cp -R /Volumes/vlc*/*.app /Applications/
	hdiutil unmount -force /Volumes/vlc*
	rm vlc.dmg
else
	echo -e "\033[0;32mVLC found...\033[0m"
fi

if test ! -d /Applications/Alfred*.app
then
	echo -e "\033[1;34mInstalling Alfred...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/34344 -O alfred.zip
	unzip -q alfre*.zip
	mv Alfr*.app /Applications/
	rm alfre*.zip
else
	echo -e "\033[0;32mAlfred found...\033[0m"
fi

if test ! -d /Applications/XtraFinder.app
then
	echo -e "\033[1;34mInstalling Xtrafinder...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/42067 -O xtrafinder.dmg
	#wget http://www.trankynam.com/xtrafinder/downloads/XtraFinder.dmg --no-check-certificate
	hdiutil mount xtrafinder.dmg
	installer -pkg /Volumes/XtraFinder*/XtraFinder.pkg -target LocalSystem
	hdiutil unmount -force /Volumes/XtraFinder*
	rm xtrafinder.dmg
else
	echo -e "\033[0;32mXtraFinder found...\033[0m"
fi

if test ! -d /Applications/Evernote.app
then
	echo -e "\033[1;34mInstalling Evernote...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/27456
	unzip Evernote*.zip
	mv Evernote.app /Applications/
	#hdiutil convert -quiet evernote.dmg -format UDTO -o evernote
	#hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint right_here evernote.cdr
	#cp -R right_here/Evernote.app /Applications/
	#hdiutil detach right_here
	rm Evernote*.zip
else
	echo -e "\033[0;32mEvernote found...\033[0m"
fi

if test ! -d /Applications/ShiftIt.app
then
	echo -e "\033[1;34mInstalling Shiftit...\033[0m"
	curl -O https://dl.dropboxusercontent.com/u/4289150/apps/shiftit.zip
	unzip -q shiftit.zip
	mv ShiftIt.app/ /Applications/
	rm shiftit.zip
else
	echo -e "\033[0;32mShiftit found...\033[0m"
fi

if test ! -d /Applications/Dropbox.app
then
	echo -e "\033[1;34mInstalling Dropbox...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/28731 -O dropbox.dmg
	#wget -O Dropbox.dmg https://www.dropbox.com/download?plat=mac --no-check-certificate
	hdiutil mount dropbox.dmg
	cp -R /Volumes/Dropbox*/Dropbox.app /Applications/
	hdiutil unmount -force /Volumes/Dropbox*
	rm dropbox.dmg
else
	echo -e "\033[0;32mDropbox found...\033[0m"
fi

if test ! -d ~/Library/PreferencePanes/MouseLocator.prefPane
then
	echo -e "\033[1;34mInstalling Mouselocator...\033[0m"
	wget --no-check-certificate http://www.2point5fish.com/files/MouseLocator.dmg -O mouselocator.dmg
	hdiutil	mount mouselocator.dmg
	cp -r /Volumes/Mouse*/Mouse*.app/Contents/Resources/Distribution/MouseLocator.prefPane ~/Library/PreferencePanes/
	hdiutil unmount -force /Volumes/Mouse*
	rm mouselocator.dmg
else
	echo -e "\033[0;32mMouselocator found...\033[0m"
fi

if test ! -d /Applications/Jing.app
then
	echo -e "\033[1;34mInstalling Jing...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/25619 -O jing.dmg
	#wget -A dmg http://download.techsmith.com/jing/mac/jing.dmg --no-check-certificate
	hdiutil convert -quiet jing.dmg -format UDTO -o jing
	hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint right_here jing.cdr
	mv right_here/Jing.app /Applications/
	hdiutil detach right_here
	rm jing.*
else
	echo -e "\033[0;32mJing found...\033[0m"
fi

if test ! -d /Applications/iTerm.app
then
	echo -e "\033[1;34mInstalling iTerm2...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/40028 -O iterm2.zip
	unzip -q iterm2.zip
	mv iTerm.app /Applications/
	rm iterm2.zip
else
	echo -e "\033[0;32miTerm found...\033[0m"
fi

if test ! -d /usr/share/prey
then
	echo -e "\033[1;34mCopying Prey installer to desktop...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/33763 -O ~/Desktop/prey.dmg
	#wget --no-check-certificate -nd -r -l1 --no-parent -A dmg https://preyproject.com/releases/current/ && rm robots.txt && mv prey*.dmg ~/Desktop
else
	echo -e "\033[0;32mPrey found...\033[0m"
fi

if test ! -d /Applications/Skype.app
then
	echo -e "\033[1;34mInstalling Skype...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/15805 -O skype.dmg
	hdiutil mount skype.dmg
	cp -R /Volumes/Skype/Skype.app /Applications/
	hdiutil unmount -force /Volumes/Skype
	rm skype.dmg
else
	echo -e "\033[0;32mSkype found...\033[0m"
fi

if test ! -s /opt/local/bin/port
then
	echo -e "\033[1;34mInstalling Macports...\033[0m"
	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/21309 -O macports.pkg
	#wget https://distfiles.macports.org/MacPorts/MacPorts-2.1.3-10.8-MountainLion.pkg --no-check-certificate
	installer -pkg macports.pkg -target LocalSystem
	rm macports.pkg
else
	echo -e "\033[0;32mMacports found...\033[0m"
fi

if test ! -s /usr/local/bin/pip
then
	echo -e "\033[1;34mInstalling pip...\033[0m"
	easy_install pip
else
	echo -e "\033[0;32mpip found...\033[0m"
fi

if test ! -d /Library/Python/2.7/site-packages/grip
then
	echo -e "\033[1;34mInstalling grip (Github Readme Instant Preview)...\033[0m"
	pip install grip
else
	echo -e "\033[0;32mgrip found...\033[0m"
fi

echo -n  -e "\033[1;31mInstall apps for your personal computer? \033[0;32m(y/n): \033[0m"
read -n 1 home
echo""
if [ "$home" == "y" ]; then

	if test ! -d /Applications/Flux.app
	then
		echo -e "\033[1;34mInstalling flux...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/37261 -O flux.zip
		#wget https://herf.org/flux/Flux.zip --secure-protocol=SSLv3 --no-check-certificate
		unzip -q flux.zip
		mv Flux.app /Applications/
		rm flux.zip
	else
		echo -e "\033[0;32mflux found...\033[0m"
	fi

	if test ! -d /Applications/Transmission.app
	then
		echo -e "\033[1;34mInstalling Transmission...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/19378 -O transmission.dmg
		hdiutil mount transmission.dmg
		cp -R /Volumes/Transmission/Transmission.app /Applications/
		hdiutil unmount -force /Volumes/Transmission/
		rm transmission.dmg
	else
		echo -e "\033[0;32mTransmission found...\033[0m"
	fi

	if test ! -d /Applications/Picasa.app
	then
		echo -e "\033[1;34mInstalling Picasa...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/30131 -O picasa.dmg
		hdiutil mount picasa.dmg
		cp -R /Volumes/Picasa*/Picasa.app /Applications/
		hdiutil unmount -force /Volumes/Picasa*
		rm picasa.dmg
	else
		echo -e "\033[0;32mPicasa found...\033[0m"
	fi

	if test ! -d /Applications/TeamViewer*
	then
		echo -e "\033[1;34mInstalling Teamviewer...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/27332 -O teamviewer.dmg
		hdiutil mount teamviewer.dmg
		installer -pkg /Volumes/TeamViewer/Install*.pkg -target LocalSystem
		hdiutil unmount -force /Volumes/TeamViewer
		rm teamviewer.dmg
	else
		echo -e "\033[0;32mTeamviewer found...\033[0m"
	fi

	if test ! -d ~/Library/PreferencePanes/TVShows.prefPane
	then
		echo -e "\033[1;34mInstalling TVShows...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/24834 -O tvshows.zip
		#wget http://tvshowsapp.com/TVShows.zip -O TVShows.zip --no-check-certificate
		unzip -q tvshows.zip
		mv TVShows.prefPane/ ~/Library/PreferencePanes/
		rm tvshows.zip
	else
		echo -e "\033[0;32mTVShows found...\033[0m"
	fi

	if test ! -d /Applications/Livestation.app
	then
		echo -e "\033[1;34mInstalling Livestation...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/28490 -O livestation.dmg
		hdiutil convert -quiet livestation.dmg -format UDTO -o Livestation
		hdiutil attach -quiet -nobrowse -noverify -noautoopen -mountpoint right_here Livestation.cdr
		mv right_here/Livestation.app /Applications/
		hdiutil detach right_here
		rm livestation.*
	else
		echo -e "\033[0;32mLivestation found...\033[0m"
	fi

	if test ! -d /Applications/SkyDrive.app
	then
		echo -e "\033[1;34mInstalling SkyDrive...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/42736 -O skydrive.pkg
		installer -pkg skydrive.pkg -target LocalSystem
		rm skydrive.pkg
	else
		echo -e "\033[0;32mSkyDrive found...\033[0m"
	fi

	if test ! -d /Library/Internet\ Plug-Ins/googletalkbrowserplugin.plugin
	then
		echo -e "\033[1;34mInstalling Google Voice...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg https://dl.google.com/googletalk/googletalkplugin/GoogleVoiceAndVideoSetup.dmg -O googlevoice.dmg
		hdiutil mount googlevoice.dmg
		installer -pkg /Volumes/GoogleVoice*/Google*.pkg -target LocalSystem
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

	if test ! -d /Library/Java/JavaVirtualMachines/*.jdk
	then
		echo -e "\033[1;34mInstalling OpenJDK...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/40659 -O jdk.dmg
		hdiutil mount jdk.dmg
		installer -pkg /Volumes/Oracle*/JDK*.pkg -target LocalSystem
		hdiutil unmount -force /Volumes/Oracle*
		rm jdk.dmg
	else
		echo -e "\033[0;32mOpenJDK found...\033[0m"
	fi

	if test ! -d /Applications/VirtualBox.app
	then
		echo -e "\033[1;34mInstalling VirtualBox...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/24801 -O virtualbox.dmg
		hdiutil mount virtualbox.dmg
		installer -pkg /Volumes/Virtual*/VirtualBox.pkg -target LocalSystem
		hdiutil unmount -force /Volumes/Virtual*
		rm virtualbox.dmg
	else
		echo -e "\033[0;32mVirtualBox found...\033[0m"
	fi

	if test ! -s /usr/bin/vagrant
	then
		echo -e "\033[1;34mInstalling Vagrant...\033[0m"
		wget --no-check-certificate --user-agent "safari" -A dmg http://goo.gl/xXOmn -O vagrant.dmg
		hdiutil mount vagrant.dmg
		installer -package /Volumes/Vagrant*/Vagrant.pkg -target LocalSystem
		hdiutil unmount -force /Volumes/Vagrant*
		rm vagrant.dmg
	else
		echo -e "\033[0;32mVagrant found...\033[0m"
	fi

	if test ! -s /usr/local/bin/nosetests
	then
		echo -e "\033[1;34mInstalling nosetests...\033[0m"
		easy_install nose
	else
		echo -e "\033[0;32mnosetests found...\033[0m"
	fi

	if test ! -s /usr/local/bin/bpython
	then
		echo -e "\033[1;34mInstalling bpython...\033[0m"
		easy_install bpython
	else
		echo -e "\033[0;32mbpython found...\033[0m"
	fi

	if test ! -d /Library/Python/2.7/site-packages/selenium
	then
		echo -e "\033[1;34mInstalling selenium...\033[0m"
		pip install -U selenium
	else
		echo -e "\033[0;32mselenium found...\033[0m"
	fi

	if test ! -d /Library/Python/2.7/site-packages/holmium
	then
		echo -e "\033[1;34mInstalling holmium...\033[0m"
		pip install -U holmium.core
	else
		echo -e "\033[0;32mholmium found...\033[0m"
	fi

	if test ! -d /Library/Python/2.7/site-packages/flake8
	then
		echo -e "\033[1;34mInstalling flake8 (python source code checker)...\033[0m"
		pip install flake8
	else
		echo -e "\033[0;32mflake8 found...\033[0m"
	fi

	#if test ! -d /Library/Python/2.7/site-packages/nosedbreport
	#then
	#	echo -e "\033[1;34mInstalling nosedbreport...\033[0m"
	#	pip install nosedbreport
	#else
	#	echo -e "\033[0;32mnosedbreport found...\033[0m"
	#fi

	#if test ! -d /usr/local/mysql
	#then
	#	echo -e "\033[1;34mInstalling Mysql...\033[0m"
	#	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/6915 -O mysql.dmg
	#	hdiutil mount mysql.dmg
	#	installer -pkg /Volumes/mysql*/mysql*.pkg -target LocalSystem
	#	installer -pkg /Volumes/mysql*/MySQLStartupItem.pkg/ -target LocalSystem
	#	cp -r /Volumes/mysql*/MySQL.prefPane ~/Library/PreferencePanes/
	#	hdiutil unmount -force /Volumes/mysql*
	#	rm mysql.dmg
	#	/Library/StartupItems/MySQLCOM/MySQLCOM start
	#else
	#	echo -e "\033[0;32mMysql found...\033[0m"
	#fi

	#if test ! -d /Applications/Sequel*
	#then
	#	echo -e "\033[1;34mInstalling SequelPro...\033[0m"
	#	wget --no-check-certificate --user-agent "safari" -A dmg http://www.macupdate.com/download/28473 -O sequelpro.dmg
	#	hdiutil mount sequelpro.dmg
	#	cp -R /Volumes/Sequel*/*.app /Applications/
	#	hdiutil unmount -force /Volumes/Sequel*
	#	rm sequel*.dmg
	#else
	#	echo -e "\033[0;32mSequelPro found...\033[0m"
	#fi

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
