#!/bin/bash

set -e 
sudo pacman -S --needed - < packages/pacman.txt

#AUR helper yay if not present

command -v yay & > /dev/null || {
    sudo pacman -S --needed base-devel git
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    (cd /tmp/yay && makepkg -si --noconfirm)
}

yay -S --needed - < packages/aur.txt

[-f packages/flatpak.txt] && xargs -a packages/flatpak.txt flatpak install -y flathub

sudo pacman -S --needed stow
cd dotfiles && for d in */; do stow -t ~ "${d%/}"; done
