#
# ~/.bash_profile
#

export PATH="$HOME/.local/bin/:$HOME/.emacs.d/bin/:$PATH"

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
    ~/.local/bin/wrappedhl
fi
