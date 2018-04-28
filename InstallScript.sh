#!/bin/bash
function install_basic_programs {
SOFTWARE=(
'abook' # http://abook.sourceforge.net/ 
'artha' #http://artha.sourceforge.net/wiki/index.php/Home
'audacity' #https://www.audacityteam.org/
'beets' #http://beets.io/
'bleachbit' #http://bleachbit.com/
'bmon' #https://github.com/tgraf/bmon
'brasero' #https://wiki.gnome.org/Apps/Brasero
'catfish' #http://www.twotoasts.de/index.php/catfish/
'dosbox' #https://www.dosbox.com/
'dos2unix' #http://dos2unix.sourceforge.net/
'dropbox' #https://www.dropbox.com/
'fdupes' #https://github.com/adrianlopezroche/fdupes
'filezilla' #https://filezilla-project.org/
'fslint' #https://www.pixelbeat.org/fslint/
'geany' #https://www.geany.org/
'giada' #https://www.giadamusic.com/
'git' #https://git-scm.com/
'gnome-clocks' #https://help.gnome.org/users/gnome-clocks/stable/
'gparted' #https://gparted.org/
'gsmartcontrol' #https://gsmartcontrol.sourceforge.io/home/
'gtypist' #https://www.gnu.org/software/gtypist/index.html
'hardinfo' #https://help.ubuntu.com/community/HardInfo
'htop' #https://hisham.hm/htop/
'i7z' #http://www.webupd8.org/2014/04/i7z-monitor-intel-i7-i5-and-i3.html
'inxi' #https://smxi.org/docs/inxi.htm
'isomaster' #http://littlesvr.ca/isomaster/
'inkscape' #https://inkscape.org/en/
'ipscan' #http://angryip.org/download/#linux
'jekyll' #https://jekyllrb.com/
'keepassx' #https://www.keepassx.org/
'libvirt-bin' #https://virt-manager.org/
'links' #http://links.twibright.com/
'lyx' #https://www.lyx.org/
'meld' #http://meldmerge.org/
'mercurial' #https://www.youtube.com/watch?v=A5ERnZAejPQ&t=27s
'milkytracker' #https://milkytracker.titandemo.org/
'mixxx' #https://www.mixxx.org/
'moc' #http://moc.daper.net/
'mosh' #https://mosh.org/
'mps-youtube' #https://github.com/mps-youtube/mps-youtube
'pandoc' #https://pandoc.org/
'pdfmod' #https://wiki.gnome.org/Apps/PdfMod
'pdfshuffler' #https://github.com/jeromerobert/pdfshuffler
'puddletag' #http://docs.puddletag.net/
'pyrenamer' #https://launchpad.net/pyrenamer
'shellcheck' #https://www.shellcheck.net/
'skypeforlinux' #https://www.skype.com/en/get-skype/skype-for-linux/
'soundconverter' #http://soundconverter.org/
'sqliteman' #http://sqliteman.yarpen.cz/
'sqlitebrowser' #http://sqlitebrowser.org/
'steam' #http://store.steampowered.com/
'testdisk' #https://www.cgsecurity.org/wiki/TestDisk
'ubuntu-make' #https://wiki.ubuntu.com/ubuntu-make
'unetbootin' #https://unetbootin.github.io/
'virt-manager' #https://virt-manager.org/
'wordgrinder' #http://cowlark.com/wordgrinder/
'wine' #https://www.winehq.org/
'winetricks' #https://wiki.winehq.org/Winetricks
'wireshark' #https://goodies.xfce.org/projects/applications/xfburn
'xfburn' #https://goodies.xfce.org/projects/applications/xfburn
'zenmap' #https://nmap.org/zenmap/
)
for program in ${SOFTWARE[*]};
do
    sudo apt-get -y install "$program"
done
	}

function install_webupd8_programs {
PPA=(
'ppa:webupd8team/tor-browser'
'ppa:webupd8team/brackets'
'ppa:webupd8team/sublime-text-3'
'pa:webupd8team/atom'
'ppa:snwh/pulp'
'ppa:webupd8team/y-ppa-manager'
'ppa:nilarimogard/webupd8'
'ppa:unit193/encryption'
'ppa:bitcoin/bitcoin'
)
WEBUPD8=(
'atom' #https://atom.io/
'brackets' #http://brackets.io/
'bitcoin-qt' #https://bitcoin.org/en/download
'paper-gtk-theme' #https://snwh.org/paper
'sublime-text-installer' #https://www.sublimetext.com/
'tor-browser' #https://www.torproject.org/projects/torbrowser.html.en
'veracrypt' #https://www.veracrypt.fr/en/Home.html
'youtube-dlg' #https://github.com/MrS0m30n3/youtube-dl-gui
'y-ppa-manager' #https://launchpad.net/~webupd8team/+archive/ubuntu/y-ppa-manager
)
# Extra PPAs from webupd8 added here:
for item in ${PPA[*]};
do
    sudo add-apt-repository -y "$item" || echo "$item" "wasn't added properly."
done
sudo apt-get update
# Install software from webupd8: (including the Atom editor, the Tor Browser Bundle, Veracrypt, the Youtube DL GUI).
for w in ${WEBUPD8[*]};
do
    sudo apt-get -y install "$w"
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
function install_sendanywhere {
# Install Send Anywhere:
wget https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb
sudo dpkg -i sendanywhere_latest_amd64.deb
}

function install_syncthing {
# Add the release PGP keys:
curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# Add the "stable" channel to your APT sources:
echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# Update and install syncthing:
sudo apt-get update
sudo apt-get -y install syncthing
}

function install_latest_virtualbox {
echo "deb https://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-5.2
}

function install_from_package {
    wget "$1"
    sudo dpkg -i "$2"
}

function install_from_ppa {
    sudo add-apt-repository -y "$1"
    sudo apt-get update
    sudo apt-get -y install "$2"
}

#function setup_bluray_playback {
# Dan's script for setting up bluray disk playback.
# Haven't tested it much.
# https://www.howtogeek.com/240487/how-to-play-dvds-and-blu-rays-on-linux/
#sudo apt-get install -y vlc libaacs0 libbluray-bdj libbluray1
#mkdir -p ~/.config/aacs/
#cd ~/.config/aacs/ && wget http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
#}

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
install_latest_virtualbox
#install_neofetch
install_from_ppa ppa:dawidd0811/neofetch-daily neofetch
#install_sendanywhere
install_from_package https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb sendanywhere_latest_amd64.deb
install_multisystem
#install tuxboot
install_from_ppa ppa:thomas.tsai/ubuntu-tuxboot tuxboot
install_syncthing
# Clean up afterwards
dpkg --get-selections >after.txt
diff -y before.txt after.txt >comparison.txt
rm before.txt after.txt
rm -- *.deb
rm -- *.key
sudo apt-get autoclean
sudo apt-get -y autoremove
