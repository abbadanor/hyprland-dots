is_floating=$(hyprctl activewindow -j | jq '.floating')
if [ $is_floating = 'false' ]
then
    hyprctl --batch "dispatch togglefloating active;dispatch resizeactive exact 1000 700; dispatch centerwindow active"
fi
