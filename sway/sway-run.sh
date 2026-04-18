#!/bin/bash
# 1. Clean the environment of X11/Wayland ghost variables
unset DISPLAY WAYLAND_DISPLAY

# 2. Setup XDG (Critical for Debian Trixie)
export XDG_RUNTIME_DIR=/run/user/$(id -u)
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_TYPE=wayland

export QT_STYLE_OVERRIDE=Fusion
export QT_QPA_PLATFORMTHEME=qt6ct 

# 3. Launch with a clean D-Bus session
exec dbus-run-session sway
