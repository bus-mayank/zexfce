#!/bin/bash

pacman -Qqe > ~/zexfce/packages/pacman.txt
pacman -Qqem > ~/zexfce/packages/aur.txt

command -v flatpak & > /dev/null && flatpak list --app --colomns=applications > ~/zexfce/packages/flatpak.txt

cd ~/zexfce && git add -A && git commit -m "backup $(date +%F)" && git push
