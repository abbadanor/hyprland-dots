#!/bin/sh
echo "Pacman packages:" > installed-packages
pacman -Qe > pacman-packages >> installed-packages
echo "AUR packages:" >> installed-packages
pacman -Qm > aur-packages >> installed-packages
echo "Global NPM packages:" >> installed-packages
npm -g ls > npm-packages >> installed-packages
