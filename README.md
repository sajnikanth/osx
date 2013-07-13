About
=====

Scripts used to setup my osx workstation.
* wget copied from [here](http://www.merenbach.com/software/wget/)
* shiftit compiled from [here](https://github.com/fikovnik/ShiftIt)
* `/bin` has my custom scripts
    * `vu` - script used to initialize a custom vagrant ubuntu VM which would install git, python, ack when 'up-ed'
    * `dot` - script used to setup my dotfiles in vagrant VM (not firgured how to do this via chef yet)
    * `holm` - script used to initialize a [holmium](https://holmiumcore.readthedocs.org/en/latest/) project

Run
===
* Run the first one with sudo - `sudo ./01_sudo_install_apps.sh`
* Second one to be run after installing XCode with Command Line Tools and Updating OS - `./02_setup_symlinks_and_other_apps.sh`
