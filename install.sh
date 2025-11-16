#pacstrap -K base base-devel linux linux-firmware amd-ucode sudo git dosfstools mtools efibootmgr grub networkmanager neovim man-db man-pages htop python usbutils

install_pacman() {
    sudo pacman -S linux-firmware-qlogic mesa vulkan-radeon udiskie udisks2 zip unzip unrar \
    python-pip go clang cmake eslint pyright rust-analyzer rustup jre-openjdk \
    gtk3 gtk4 qt5-wayland qt6-wayland xdg-desktop-portal xdg-desktop-portal-wlr xdg-desktop-portal-gtk webkit2gtk-4.1 webkitgtk-6.0 \
    brightnessctl openssh polkit polkit-gnome ttf-dejavu ttf-nerd-fonts-symbols noto-fonts-cjk \
    bluez bluez-utils pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse \
    wayland hyprland ly wl-clipboard waybar wofi mako hyprshot bluetui zsh ghostty zed \
    firefox telegram-desktop kicad freecad gimp inkscape kdenlive audacity libreoffice-fresh \
    qbittorrent obs-studio showtime loupe obsidian android-tools
}

install_aur() {
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
}

enable_service() {
    systemctl --user enable pipewire.service
    systemctl --user enable pipewire-pulse.service
    systemctl --user enable wireplumber.service

    sudo systemctl enable ly.service
    sudo systemctl enable bluetooth.service
}

copy_config(){
    cp -r config/. ~/.config
    sudo cp -r flexoki /usr/share/themes/flexoki
    mkdir -p ~/pictures/screenshots
}

gtk_setting() {
    gsettings set org.gnome.desktop.interface gtk-theme flexoki
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
}

install_pacman
enable_service
copy_config
gtk_setting
