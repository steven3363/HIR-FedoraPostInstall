#/bin/bash
bindir=$HOME
bindir+='/.local/bin'
orgdir=$(pwd)
mkdir "$bindir"
echo "Install 3rd party repos"

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#rpm fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y


#multimedia
echo "Install Multimedia"
sudo dnf swap 'ffmpeg-free' 'ffmpeg' --allowerasing -y
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y



echo "Other unzipping programs"
sudo dnf install -y unzip p7zip p7zip-plugins unrar -y


#Packages
echo "Installing: openlp v4l2loopback libreoffice gimp kedenlive audacity"
sudo dnf install OpenLP v4l2loopback libreoffice gimp kdenlive audacity-freeworld python3-vlc wget -y

#obs
echo "Installing OBS"
sudo flatpak install flathub com.obsproject.Studio 
sudo flatpak install flathub com.obsproject.Studio.Plugin.MoveTransition
sudo flatpak install flathub com.obsproject.Studio.Plugin.DroidCam 
sudo flatpak install flathub com.obsproject.Studio.Plugin.BackgroundRemoval




bindir=$HOME
bindir+="/.local/bin"
icondir=$HOME
icondir+="/.local/share/icons"
mkdir "$icondir"
orgdir=$(pwd)


mkdir "$bindir"


#set launcher dir
orgdirlaunch=$orgdir
orgdirlaunch+="/launchers"


#deckboard
apploc=$bindir

savebase=$HOME
savebase+="/.local/share/applications"

cd  "$apploc"
rm -v Deckboard*
wget "https://github.com/rivafarabi/deckboard/releases/download/v3.0.0-rc9.5/Deckboard-3.0.0-rc9.5.AppImage"
chmod +x Deckboard-3.0.0-rc9.5.AppImage

#cp icon and launcher
cd "$orgdirlaunch"
cp -f deckboard.png "$icondir"
cp -f Deckboard.desktop $savebase

echo "Installed Deckboard"

#H2R (Here to record)
apploc=$bindir

cd "$apploc"
#rm old file 
rm -v H2R*
wget "https://github.com/iamjohnbarker/h2r-graphics-releases/releases/download/v2.20.2/H2R-Graphics-2.20.2.AppImage"

chmod +x H2R-Graphics-2.20.2.AppImage

#download icon and create shorcut
#cp icon and launcher

cd "$orgdirlaunch"
cp -f H2R-Graphics.png "$icondir"
cp -f H2R-Graphics.desktop  $savebase
echo "Installed H2R-Graphics"

echo "Now open OpenLP and run the script to install custom stage view."










