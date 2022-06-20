#!/bin/sh

rofi_command="rofi -theme $HOME/.config/rofi/config-power.rasi power-menu -modi"

#### Options ###
power_off="襤"
reboot="勒"
lock=""
suspend=""
log_out="﫼"
# Variable passed to rofi
options="$power_off\n$reboot\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $lock)
        betterlockscreen --lock blur
        ;;    
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
	systemctl suspend
        ;;
    $log_out)
        pkill xinit
        ;;
esac