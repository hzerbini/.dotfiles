#!/bin/bash

# Install pacman Dependencies
sudo pacman -S --needed base-devel
sudo pacman -S neovim \
    obsidian \
    discord \
    npm \
    ripgrep \
    httpie \
    libreoffice-still \
    docker \
    docker-compose \
    kubectl \
    youtube-dl \
    zathura \
    zathura-pdf-mupdf \
    nerd-fonts \
    ttf-jetbrains-mono-nerd \
    zsh \
    tmux \
    xclip \
    nitrogen \
    rofi \
    rofi-calc \
    rofi-emoji \
    picom \
    xdotool \
    tldr \
    thunderbird \
    bluez \
    bluez-utils \
    openvpn \
    pulsemixer \
    flameshot \
    acpi \
    gimp \
    noto-fonts-emoji \
    go \
    conky \
    zoxide \
    brightnessctl \
    playerctl \
    pass \
    keepassxc \
    fzf

# Install Paru (AUR Helper)
git clone https://aur.archlinux.org/paru.git $HOME/.paru
cd $HOME/.paru
makepkg -si
cd $HOME


# Install AUR Packages
paru -S beekeeper-studio \
    brave-bin \
    nvim-packer-git \
    tmux-plugin-manager \
    vial-appimage \
    activitywatch \
    spotify \
    mongosh-bin \
    studio-3t

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
