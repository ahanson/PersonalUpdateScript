#!/bin/bash
function install_basic_programs {
SOFTWARE=(
'abook' # http://abook.sourceforge.net/ | CLI Address Book
'artha' #http://artha.sourceforge.net/wiki/index.php/Home | Thesaurus
'audacity' #https://www.audacityteam.org/ | WAV Editor
'beets' #http://beets.io/ | Music Management System
'bmon' #https://github.com/tgraf/bmon | CLI bandwith monitor
'brasero' #https://wiki.gnome.org/Apps/Brasero | CD/DVD Burner
'catfish' #http://www.twotoasts.de/index.php/catfish/ | File Search Program
'dosbox' #https://www.dosbox.com/ | DOS Emulator
'dos2unix' #http://dos2unix.sourceforge.net/ | Converts files from dos format to unix format
'fdupes' #https://github.com/adrianlopezroche/fdupes | CLI duplicate file detector
'filezilla' #https://filezilla-project.org/ | FTP/SFTP Client
'fslint' #https://www.pixelbeat.org/fslint/ | Duplicate file detector
'geany' #https://www.geany.org/ | Text Editor
'giada' #https://www.giadamusic.com/ | Sampler/Sequencer
'git' #https://git-scm.com/ | VCS
'gnome-clocks' #https://help.gnome.org/users/gnome-clocks/stable/ | Timer
'gparted' #https://gparted.org/ | Partition Editor
'gsmartcontrol' #https://gsmartcontrol.sourceforge.io/home/ | HDD Information/Testing
'grsync' #http://www.opbyte.it/grsync/ | GUI frontend for Rsync
'gtypist' #https://www.gnu.org/software/gtypist/index.html | Typing Tutor
'hardinfo' #https://help.ubuntu.com/community/HardInfo | Hardware information
'htop' #https://hisham.hm/htop/ | System stats and process information
'i7z' #http://www.webupd8.org/2014/04/i7z-monitor-intel-i7-i5-and-i3.html |
'inxi' #https://smxi.org/docs/inxi.htm | Straightforward system information
'isomaster' #http://littlesvr.ca/isomaster/ | Creates and edits ISO files
'inkscape' #https://inkscape.org/en/ | SVG editor
'ipscan' #http://angryip.org/download/#linux | Simple network scanner
'jekyll' #https://jekyllrb.com/ | Static Site Generator
'keepassx' #https://www.keepassx.org/ | Password Manager
'libvirt-bin' #https://virt-manager.org/ | Virtualization Manager
'links' #http://links.twibright.com/ | CLI web browser
'lyx' #https://www.lyx.org/ | Latex Word Processor
'magic-wormhole' #https://magic-wormhole.readthedocs.io/en/latest/ | Share files over a network, securely
'meld' #http://meldmerge.org/ | Diff editor
'mercurial' #https://www.youtube.com/watch?v=A5ERnZAejPQ&t=27s | VCS
'milkytracker' #https://milkytracker.titandemo.org/ | Sequencer
'mixxx' #https://www.mixxx.org/ | DJ Mix Software
'moc' #http://moc.daper.net/ | CLI Mp3 Player
'mosh' #https://mosh.org/ | Mobile SSH
'mps-youtube' #https://github.com/mps-youtube/mps-youtube | CLI Youtube Playback
'pandoc' #https://pandoc.org | converts various markdown formats
'pdfmod' #https://wiki.gnome.org/Apps/PdfMod | PDF Editor
'pdfshuffler' #https://github.com/jeromerobert/pdfshuffler | PDF Editor
'puddletag' #http://docs.puddletag.net/ | Music Metadata Editor
'pyrenamer' #https://launchpad.net/pyrenamer | Mass File Renamer
'scribus' #https://www.scribus.net/ | desktop publishing
'shellcheck' #https://www.shellcheck.net/ | finds errors in bash scripts
'soundconverter' #http://soundconverter.org/ | Converts sound files between different formats
'sqlitebrowser' #http://sqlitebrowser.org/ | Database Editor
'steam' #http://store.steampowered.com/ | Games Platform
'testdisk' #https://www.cgsecurity.org/wiki/TestDisk | Data Recovery 
'ubuntu-make' #https://wiki.ubuntu.com/ubuntu-make | Installs dev tools 
'unetbootin' #https://unetbootin.github.io/ | Creates bootable USB sticks
'vagrant' #https://www.vagrantup.com/ | Quick VMs for development
'wordgrinder' #http://cowlark.com/wordgrinder/ | CLI word processor
'wine' #https://www.winehq.org/ | Windows Emulator
'winetricks' #https://wiki.winehq.org/Winetricks | Install stuff with Wine, easily.
'wireshark' #https://goodies.xfce.org/projects/applications/xfburn | Network monitoring
'xfburn' #https://goodies.xfce.org/projects/applications/xfburn | CD/DVD burner
'zenmap' #https://nmap.org/zenmap/ | Network Scanner
)
for program in ${SOFTWARE[*]};
do
    sudo apt-get -y install "$program"
done
	}

function install_webupd8_programs {
# Maybe webupd8 isn't maintained anymore? Need some alternate sources.
PPA=(
'ppa:webupd8team/brackets'
'ppa:webupd8team/sublime-text-3'
'pa:webupd8team/atom'
'ppa:webupd8team/y-ppa-manager'
'ppa:nilarimogard/webupd8'
'ppa:unit193/encryption'
)
WEBUPD8=(
'atom' #https://atom.io/ | IDE.
'brackets' #http://brackets.io/ | IDE.
'sublime-text-installer' #https://www.sublimetext.com/ | IDE.
'veracrypt' #https://www.veracrypt.fr/en/Home.html | File Encryption.
'youtube-dlg' #https://github.com/MrS0m30n3/youtube-dl-gui | Youtube Downloader.
'y-ppa-manager' #https://launchpad.net/~webupd8team/+archive/ubuntu/y-ppa-manager | Fixes problems with PPAs.
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
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt-get update
sudo apt-get -y install google-chrome-stable
	}

function install_multisystem {
# Install Multisystem:
sudo apt-add-repository 'deb http://liveusb.info/multisystem/depot all main'
wget -q -O - http://liveusb.info/multisystem/depot/multisystem.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get -y install multisystem
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
local vbox_repo="deb https://download.virtualbox.org/virtualbox/debian bionic contrib"
local vbox_key="https://www.virtualbox.org/download/oracle_vbox_2016.asc"
local vbox_latest="virtualbox-5.2"
echo "$vbox_repo" | sudo tee /etc/apt/sources.list
wget -q "$vbox_key" -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install "$vbox_latest"
}

function install_typora {
wget -qO - https://typora.io/linux/public-key.asc | sudo apt-key add -
sudo add-apt-repository 'deb https://typora.io/linux ./'
sudo apt-get update
sudo apt-get install typora
}

function setup_bluray_playback {
#Dan's script for setting up bluray disk playback.
#Haven't tested it much.
#https://www.howtogeek.com/240487/how-to-play-dvds-and-blu-rays-on-linux/
sudo apt-get install -y vlc libaacs0 libbluray-bdj libbluray1
mkdir -p ~/.config/aacs/
cd ~/.config/aacs/ && wget http://vlc-bluray.whoknowsmy.name/files/KEYDB.cfg
}
function install_latest_vlc {
sudo apt-get install -y snapd
sudo snap install vlc
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

function install_neofetch {
 install_from_ppa ppa:dawidd0811/neofetch-daily neofetch
}

function install_sendanywhere {
install_from_package https://update.send-anywhere.com/linux_downloads/sendanywhere_latest_amd64.deb sendanywhere_latest_amd64.deb
}

function install_tuxboot {
install_from_ppa ppa:thomas.tsai/ubuntu-tuxboot tuxboot
}

function install_pdfchain {
install_from_ppa ppa:pdfchain-team/ppa pdfchain
}

# Now that all the functions are declaired, run them:
sudo apt-get update
sudo apt-get -y dist-upgrade
touch before.txt after.txt comparison.txt
dpkg --get-selections >before.txt
install_basic_programs
install_webupd8_programs
install_chromebrowser
install_latest_virtualbox
install_neofetch
install_sendanywhere
install_multisystem
install_tuxboot
install_pdfchain
install_syncthing
install_typora
install_latest_vlc
# Clean up afterwards
dpkg --get-selections >after.txt
diff -y before.txt after.txt >comparison.txt
rm before.txt after.txt
rm -- *.deb
rm -- *.key
sudo apt-get autoclean
sudo apt-get -y autoremove
