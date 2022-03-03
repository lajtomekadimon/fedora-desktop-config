# Lajto's Fedora desktop config
My personal configuration for Fedora in desktop.

# Configuration

After updating the entire system, and activating extra repos using GNOME
software, open a terminal and run:

```sh
sudo dnf install git make

sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo dnf update

sudo dnf config-manager --add-repo https://dl.winehq.org/wine-builds/fedora/$(rpm -E %fedora)/winehq.repo

sudo dnf update

sudo dnf groupupdate core

sudo dnf groupupdate multimedia

sudo dnf groupupdate sound-and-video

sudo dnf install akmod-nvidia

sudo dnf install xorg-x11-drv-nvidia-cuda

sudo dnf update
```

Reboot. Then, open a terminal and run:

```sh
git clone https://gitlab.com/lajtomekadimon/fedora-desktop-config

cd fedora-desktop-config

make configure

cd ..

rm -Rf fedora-desktop-config

# Telegram Desktop
wget -O telegram.tar.xz https://telegram.org/dl/desktop/linux && tar -xvf telegram.tar.xz && rm telegram.tar.xz && mv Telegram /home/lajto/.telegram-desktop-dir && /home/lajto/.telegram-desktop-dir/Telegram
```

Configure Telegram and install manually:

- Chrome
- GeoGebra

Install Discord using flatpak:

```sh
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.discordapp.Discord
```

Reboot. Then, configure Firefox properly (don't forget to activate OpenH264
video codec) and change this in `about:config`:

- Set `extensions.pocket.enabled` to `false`.
- Set `middlemouse.paste` to `false`.

Configure Wine:

```sh
winecfg

winetricks corefonts fontfix vcrun2005sp1 vcrun2008 vcrun6 \
vcrun2017 dxvk d3dx9 physx

winetricks gdiplus riched20 riched30 wenquanyi
```

Import [chn_fonts.reg](https://gist.githubusercontent.com/swordfeng/c3fd6b6fcf6dc7d7fa8a/raw/0ad845f98f5a97e7173ff40b5e57b3a163e92465/chn_fonts.reg)
after running:

```sh
winetricks regedit
```

Configure the rest of the software:

- GNOME
- GNOME Tweaks
- GNOME Disks
- Gedit
- Nautilus
- Rhythmbox
- Transmission
- Telegram Desktop
- Tutanota

Optimizing graphics in Wine:

```sh
WINEDEBUG=-all __GL_THREADED_OPTIMIZATIONS=1 wine filename.exe -opengl
```
