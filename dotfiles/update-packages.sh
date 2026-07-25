#!/bin/bash
pacman -Qqe > ~/zexfce/dotfiles/packages/pacman.txt
pacman -Qqem > ~/zexfce/dotfiles/packages/aur.txt
command -v flatpak &>/dev/null && flatpak list --app --columns=application > ~/zexfce/dotfiles/packages/flatpak.txt

cd ~/zexfce/dotfiles
git add -A
git commit -m "update package lists $(date +%F)"
git push
