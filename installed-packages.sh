#!/bin/sh
echo "Pacman packages:" > installed-packages
pacman -Qe >> installed-packages
echo "AUR packages:" >> installed-packages
pacman -Qm >> installed-packages
