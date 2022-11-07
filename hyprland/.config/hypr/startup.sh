#!/bin/sh

# randomize bg with swaybg and save tmp picture to use with swaylock
$HOME/.local/bin/randombg

# DONE: fix cursor currently only working on wallpaper, no programs
hyprctl setcursor capitaine-cursors 24
gsettings set org.gnome.desktop.interface cursor-theme 'capitaine-cursors'

# policy kit
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 > /tmp/polkit-gnome-log 2>&1 &

# TODO: add gnome keyring for nextcloud
# eval $(gnome-keyring-daemon --start)
# export SSH_AUTH_SOCK

# update user dirs (~/downloads, ~/pictures, ~/documents etc.)
xdg-user-dirs-update

# spawn notification daemon (otherwise no mpd notifications on boot)
mako &

# audio
pipewire > /tmp/pipewire-log 2>&1 &
pipewire-pulse > /tmp/pipewire-pulse-log 2>&1 &
wireplumber > /tmp/wireplumber-log 2>&1 &

mpd > /tmp/mpd-log 2>&1
# make mpd interect with MPRIS2 to be able to use playerctl and get notifications
mpDris2 > /tmp/mpDris2-log 2>&1 &
# daemonize playerctl, making it remember the last player
playerctld daemon > /tmp/playerctl-log 2>&1 

# wait until pipewire is ready before launching waybar
until pactl info > /dev/null 2>&1; do sleep 1; done

waybar > /tmp/waybar-log 2>&1 &

wezterm-mux-server --daemonize -- zsh

# TODO: add nextcloud
# nextcloud &

# launch emacs daemon
emacs --daemon

swayidle -w \
        timeout 300 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on' \
        lock 'swaylock -f'

# autostart emacs
# emacsclient -c || until emacsclient -c; do sleep 1; done
