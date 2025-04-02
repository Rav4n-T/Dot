# Theme
# 
# export HYPRCURSOR_THEME="theme_Catppuccin-Macchiato-Dark-Cursors"
expor HYPRCURSOR_SIZE=24

export XCURSOR_THEME="Colloid-dark-cursors"

expor XCURSOR_SIZE=24

export GDK_BACKEND="wayland,x11"

# XDG Specifications

# export XDG_CURRENT_DESKTOP="Hyprland"
#
#export XDG_CURRENT_DESKTOP="Plasma"

# export XDG_SESSION_TYPE="wayland"

# QT

# export QT_QPA_PLATFORM="wayland;xcb"
#
#expor= QT_WAYLAND_DISABLE_WINDOWDECORATION 1

export QT_QPA_PLATFORMTHEME="qt6ct"

export QT_SCREEN_SCALE_FACTOR="1;1" # "wayland;xcb"

# other
#
#export LC_ALL="en_US.UTF-8"

export LC_ALL="zh_CN.UTF-8"

export LANG="zh_CN.UTF-8"

export LANGUAGE="zh_CN:en_US"

# fcitx5
#
#export GTK_IM_MODULE="fcitx"

export QT_IM_MODULE="fcitx"

# export QT_IM_MODULES="wayland;fcitx"

export XMODIFIERS="@im=fcitx"

set -x LIBSEAT_BACKEND "logind"
