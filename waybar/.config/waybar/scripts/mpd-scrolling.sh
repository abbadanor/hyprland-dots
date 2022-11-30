#!/bin/sh

zscroll -l 50 -n true -u true -d 0.2 -M "mpc status" -m "playing" \
            "-b '󰝚 '" -m "paused" "-b '󰏥 ' -s f" "mpc current" &

wait
