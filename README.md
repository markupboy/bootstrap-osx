#Mac Setup

##Getting Started

_Note: associated rake tasks are bolded_

* Fresh install osx
* Download and install dropbox and let sync over network
* Install XCode
* Open Xcode and install command line tools
* Copy over SSH keys
* Install Homebrew **install homebrew**
    
    ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"

* Install brew formulas **brew**

    brew install ack grc automake gettext libtool ossp-uuid ruby-build rbenv-gemset rbenv tig aria2 cmake git lynx nmap pidof readline siege todo-txt autoconf gdbm htop-osx markdown node pkg-config redis sqlite wget postgresql mysql

* Setup mysql **setup_mysql**

    ln -sfv /usr/local/opt/mysql/*.plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

* Setup postgres **setup_postgres**

    initdb /usr/local/var/postgres -E utf8
    ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

* Setup redis **setup_redis**

    ln -sfv /usr/local/opt/redis/*.plist ~/Library/LaunchAgents
    launchctl load ~/Library/LaunchAgents/homebrew.mxcl.redis.plist

* Install GCC **install_gcc**

    brew tap homebrew/dupes ; brew install apple-gcc42

* Install all the rubies **install_rubies**

    CONFIGURE_OPTS=--without-tk rbenv install 1.8.7-p370
    rbenv install ree-1.8.7-2012.02 1.9.3-p327 1.9.3-p374 2.0.0-p195
    rbenv global 1.9.3-p374

* Link oh-my-zsh **oh_my_zsh**

    ln -s "$HOME/Dropbox/Shared\ Libraries/oh-my-zsh"

* Install Dotfiles **dotfiles**

    cd "$HOME/Dropbox/Shared\ Libraries/dotfiles" && rake install && cd -

* Link shared libs folders **link_libs**
    
    cd ~/Library/Application\ Support
    ln -s ~/Dropbox/Shared\ Libraries/Adium\ 2.0
    ln -s ~/Dropbox/Shared\ Libraries/Alfred
    ln -s ~/Dropbox/Shared\ Libraries/Sublime\ Text\ 2
    ln -s ~/Dropbox/Shared\ Libraries/TextExpander
    ln -s ~/Dropbox/Shared\ Libraries/Yojimbo
    ln -s ~/Dropbox/Shared\ Libraries/iTerm

* Install various apps from app store
* Download and Install non-appstore apps **download_apps**

    http://www.alfredapp.com/
    https://www.google.com/intl/en/chrome/
    http://www.iterm2.com/#/section/home
    http://www.sublimetext.com/2
    https://agilebits.com/onepassword
    http://www.panic.com/blog/2012/08/candybar-mountain-lion-and-beyond
    http://flexibits.com/fantastical
    https://agilebits.com/knox
    http://www.sequelpro.com/
    http://store.steampowered.com/
    http://www.shirt-pocket.com/SuperDuper/SuperDuperDescription.html
    http://smilesoftware.com/TextExpander/index.html
    http://www.noodlesoft.com/hazel.php
    http://www.usboverdrive.com/USBOverdrive/News.html
    http://www.transmissionbt.com/
    http://panic.com/transmit/
    http://clickontyler.com/virtualhostx/
    http://www.videolan.org/
    http://www.barebones.com/products/yojimbo/
    http://www.keyboardmaestro.com/main/
    http://www.mozilla.org/en-US/firefox/new/?from=getfirefox
    http://www.webkit.org/
    https://www.google.com/intl/en/chrome/browser/canary.html
    https://www.spotify.com/us/video-splash/?utm_source=spotify&utm_medium=web&utm_campaign=start
    https://creative.adobe.com/
    http://www.macbartender.com/
    http://imageoptim.com/
    http://vemedio.com/products/instacast-mac
    http://www.soma-zone.com/LaunchControl/
    http://tweaksapp.com/app/mountain-tweaks/
    http://totalfinder.binaryage.com/

* Open and configure startup apps

    bartender
    hardwaregrowler
    moom
    alfred
    geektool
    fantastical
    keyboard maestro
    textexpander
    cloud
    hazel
    tweetbot
    usboverdrive
    totalfinder

* Install Fonts

    Source Code Pro - http://sourceforge.net/projects/sourcecodepro.adobe/files/


##Settings

* No Dock Delay **set_dock_delay**

    defaults write com.apple.Dock autohide-delay -float 0 && killall Dock

* Set default shell to ZSH
* Disable translucent menu bar
* Enable remote login and screen sharing
* Disable natural scrolling
