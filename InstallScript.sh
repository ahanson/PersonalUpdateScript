#!/bin/bash
function install_basic_programs {
SOFTWARE=('abook' 'artha' 'audacity' 'baobab' 'beets' 'bleachbit' 'bmon' 'brasero' 'catfish' 'dosbox' 'dos2unix' 'dropbox' 'fdupes' 'filezilla' 'fslint' 'gdebi' 'geany' 'giada' 'git' 'gnome-clocks' 'gnome-schedule' 'gparted' 'gsmartcontrol' 'gtypist' 'hardinfo' 'htp' 'htop' 'i7z' 'inxi' 'isomaster' 'inkscape' 'ipscan' 'jekyll' 'keepassx' 'links' 'lyx' 'meld' 'mercurial' 'milkytracker' 'mixxx' 'mocp' 'mosh' 'pdfmod' 'pdfshuffler' 'puddletag' 'pyrenamer' 'ruby' 'shellcheck' 'skypeforlinux' 'soundconverter' 'sqliteman' 'sqlitebrowser' 'steam' 'syncthing-gtk' 'testdisk' 'transmission-gtk' 'ubuntu-make' 'unetbootin' 'virtualbox' 'virtualbox-qt' 'vlc' 'wordgrinder' 'wine' 'winetricks' 'wireshark' 'xfburn' 'zenmap')
for program in ${SOFTWARE[*]};
do
    sudo apt-get -y install "$program"
done
	}

function install_webupd8_programs {
PPA=('ppa:webupd8team/tor-browser' 'ppa:webupd8team/brackets' 'ppa:webupd8team/sublime-text-3' 'pa:webupd8team/atom' 'ppa:snwh/pulp' 'ppa:webupd8team/y-ppa-manager' 'ppa:nilarimogard/webupd8' 'ppa:unit193/encryption' 'ppa:bitcoin/bitcoin')
WEBUPD8=('y-ppa-manager' 'tor-browser' 'brackets' 'sublime-text-installer' 'atom' 'paper-gtk-theme' 'youtube-dlg' 'veracrypt' 'bitcoin-qt')
# Extra PPAs from webupd8 added here:
for item in ${PPA[*]};
do
    sudo add-apt-repository -y $item || echo $item "wasn't added properly."
done
sudo apt-get update
# Install software from webupd8: (including the Atom editor, the Tor Browser Bundle, Veracrypt, the Youtube DL GUI).
for w in ${WEBUPD8[*]};
do
    sudo apt-get -y install $w
done
	}

function install_chromebrowser {
# Install Chrome Browser:
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable
	}

function install_dukto {
# Install Dukto:
wget -nv http://download.opensuse.org/repositories/home:colomboem/xUbuntu_16.04/Release.key -O Release.key
sudo apt-key add - < Release.key
sudo apt-get update
sudo sh -c "echo 'deb http://download.opensuse.org/repositories/home:/colomboem/xUbuntu_16.04/ /' > /etc/apt/sources.list.d/dukto.list"
sudo apt-get update
sudo apt-get -y install dukto
}

function install_haroopad {
wget -nv https://bitbucket.org/rhiokim/haroopad-download/downloads/haroopad-v0.13.1-x64.deb
sudo dpkg -i haroopad*.deb
}

function install_insync {
# Install Insync:
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
sudo touch /etc/apt/sources.list.d/insync.list
sudo echo "deb http://apt.insynchq.com/mint sonya non-free contrib" >> /etc/apt/sources.list.d/insync.list
sudo apt-get update
sudo apt-get -y install insync
}

function install_multisystem {
# Install Multisystem:
sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'
wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install multisystem
	}

function install_neofetch {
# Install Neofetch:
sudo add-apt-repository -y ppa:dawidd0811/neofetch-daily
sudo apt-get update
sudo apt-get install -y neofetch
	}

function install_pdfcompressor {
# Install PDF Compressor:
sudo add-apt-repository -y ppa:jfswitz/released
sudo apt-get update
sudo apt-get -y install pdf-compressor
	}

function install_sendanywhere {
# Install Send Anywhere:
wget https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb
sudo dpkg -i sendanywhere_latest_amd64.deb
}

function install_from_package {
    wget $1
    sudo dpkg -i $2
}

function install_from_ppa {
    sudo add-apt-repository -y $1
    sudo apt-get update
    sudo apt-get -y install $2
}

function setup_bluray_playback {
# Dan's script for setting up bluray disk playback.
# Haven't tested it much.
# https://www.howtogeek.com/240487/how-to-play-dvds-and-blu-rays-on-linux/
sudo apt-get install -y vlc libaacs0 libbluray-bdj libbluray1
mkdir -p ~/.config/aacs/
cd ~/.config/aacs/ && wget http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
}

# Now that all the functions are declaired, run them:
sudo apt-get update
sudo apt-get -y dist-upgrade
touch before.txt after.txt comparison.txt
dpkg --get-selections >before.txt
install_basic_programs
install_webupd8_programs
install_chromebrowser
install_insync
install_dukto
#install_neofetch
install_from_ppa ppa:dawidd0811/neofetch-daily neofetch
#install_sendanywhere
install_from_package https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb sendanywhere_latest_amd64.deb
#install_pdfcompressor
install_from_ppa ppa:jfswitz/released pdf-compressor
install_multisystem
#install tuxboot
install_from_ppa ppa:thomas.tsai/ubuntu-tuxboot tuxboot
# Clean up afterwards
dpkg --get-selections >after.txt
diff -y before.txt after.txt >comparison.txt
rm before.txt after.txt
sudo apt-get autoclean
sudo apt-get -y autoremove
