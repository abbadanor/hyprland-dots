#
# ~/.bash_profile
#

PATH=$PATH:/home/adam/.local/bin

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    ~/.local/bin/wrappedhl
fi
