USERNAME=lajto

configure:
	# Basic packages
	sudo dnf install -y rpmfusion-free-release-tainted
	sudo dnf install -y libdvdcss
	sudo dnf install -y wget nano git make kernel-headers kernel-devel \
	libxml2 libxml2-devel alsa-firmware mercurial
	sudo dnf groupinstall -y "Development Tools"
	sudo dnf groupinstall -y "Development Libraries"
	sudo dnf install -y unrar p7zip p7zip-plugins zip unzip xz
	# Codecs
	sudo dnf install -y gstreamer1-libav \
	gstreamer1-plugins-bad-free-extras gstreamer1-plugins-bad-freeworld \
	gstreamer1-plugins-good-extras gstreamer1-plugins-ugly gstreamer-ffmpeg \
	gstreamer-plugins-bad \
	gstreamer-plugins-bad-nonfree gstreamer-plugins-ugly gstreamer-ffmpeg \
	ffmpeg ffmpeg-libs libmatroska xvidcore libva-vdpau-driver libvdpau \
	libvdpau-devel gstreamer1-vaapi \
	gstreamer1-plugin-openh264 mozilla-openh264 openh264
	# Codecs (for rendering)
	sudo dnf install -y x264 h264enc x265
	# Fonts
	sudo dnf install -y freetype-freeworld levien-inconsolata-fonts \
	adobe-source-code-pro-fonts mozilla-fira-mono-fonts \
	google-droid-sans-mono-fonts dejavu-sans-mono-fonts \
	google-noto-sans-fonts
	sudo dnf install -y \
	http://sourceforge.net/projects/mscorefonts2/files/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
	# Japanese and Chinese input
	sudo dnf install -y ibus-anthy ibus-libpinyin
	# LaTeX
	sudo dnf install -y texlive-scheme-full
	# Remove software
	sudo dnf remove -y gnome-photos totem
	# Install terminal software
	sudo dnf install -y screenfetch neofetch tokei
	# Install software
	sudo dnf install -y mpv gparted gnome-tweaks gimp inkscape \
	transmission-gtk audacity-freeworld kid3 gnome-builder \
	blender simple-scan xfburn soundconverter gnome-clocks \
	keepassxc anki
	# Vim
	sudo dnf install -y vim-enhanced
	rm -f /home/$(USERNAME)/.vimrc
	wget -O /home/$(USERNAME)/.vimrc \
	https://raw.githubusercontent.com/lajtomekadimon/vim-config/main/.vimrc
	# Steam
	#sudo dnf install steam SDL2 SDL2_image SDL2_mixer librtmp libidn \
	#openal-soft libcurl libcurl-devel alsa-plugins-pulseaudio pulseaudio-libs \
	#pulseaudio-libs-devel pulseaudio-libs-glib2 SDL2-devel
	# Emulators
	#sudo dnf install -y desmume gnome-nds-thumbnailer dolphin-emu pcsxr pcsx2
	# Wine
	sudo dnf install -y winehq-stable
	wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
	chmod +x winetricks
	sudo mv winetricks /usr/local/bin/
	# Java
	sudo dnf install -y java-latest-openjdk java-latest-openjdk-devel
	# Android tools
	sudo dnf install -y android-tools
