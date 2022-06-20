#!/bin/sh

xset -dpms
xset s off

exec dbus-launch bspwm
