#!/bin/sh

zscroll -l 50 \
        --delay 0.2 \
        --match-command "mpc current" \
        --match-text "Playing" "--scroll 1" \
        --match-text "Paused" "--scroll 0" \
        --update-check true "mpc current" &

wait
