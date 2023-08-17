#!/bin/bash

# Install pacman Dependencies
sudo pacman -S --needed base-devel
sudo pacman -S acpi \
    bluez \
    bluez-utils \
    brightnessctl \
    composer \
    conky \
    discord \
    docker \
    docker-compose \
    flameshot \
    fzf \
    gimp \
    go \
    httpie \
    keepassxc \
    kubectl \
    libreoffice-still \
    neovim \
    nerd-fonts \
    nextcloud-client \
    nitrogen \
    noto-fonts-emoji \
    npm \
    obsidian \
    openvpn \
    pass \
    picom \
    playerctl \
    pulsemixer \
    ripgrep \
    rofi \
    rofi-calc \
    rofi-emoji \
    thunderbird \
    tldr \
    tmux \
    ttf-jetbrains-mono-nerd \
    unzip \
    xclip \
    xdotool \
    youtube-dl \
    zathura \
    zathura-pdf-mupdf \
    zoxide \
    zsh

# Install Paru (AUR Helper)
git clone https://aur.archlinux.org/paru.git $HOME/.paru
cd $HOME/.paru
makepkg -si
cd $HOME


# Install AUR Packages
paru -S activitywatch \
    beekeeper-studio \
    brave-bin \
    clickup \
    mongosh-bin \
    nvim-packer-git \
    pcloud-drive \
    spotify \
    studio-3t \
    tmux-plugin-manager \
    vial-appimage

# Install Kind (Kubernets in Docker)
# For AMD64 / x86_64
[ $(uname -m) = x86_64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-amd64
# For ARM64
[ $(uname -m) = aarch64 ] && curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.20.0/kind-linux-arm64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind

# Setup Docker
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service

# Setup tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#Make vial work on Linux
export USER_GID=`id -g`; sudo --preserve-env=USER_GID sh -c 'echo "KERNEL==\"hidraw*\", SUBSYSTEM==\"hidraw\", ATTRS{serial}==\"*vial:f64c2b3c*\", MODE=\"0660\", GROUP=\"$USER_GID\", TAG+=\"uaccess\", TAG+=\"udev-acl\"" > /etc/udev/rules.d/99-vial.rules && udevadm control --reload && udevadm trigger'

#Set right keyboard layout
localectl set-x11-keymap us pc104 intl

# Config GIT
git config --global user.email "henriquezjassis@gmail.com"
git config --global user.name "Henrique Zerbini Junqueira de Assis"

#Change Shell
chsh -s $(which zsh)
