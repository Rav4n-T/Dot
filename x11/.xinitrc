#!/bin/env bash


export XCURSOR_PATH="$HOME/.local/share/icons:/usr/share/icons:/usr/local/share/icons"

# cursor
export XCURSOR_THEME="Future-dark-cursors"
export XCURSOR_SIZE=24

# QT
export QT_QPA_PLATFORM="xcb"
export QT_QPA_PLATFORMTHEME="qt6ct"
export QT_SCREEN_SCALE_FACTOR "1;1" # "wayland;xcb"

# Locale
export LC_ALL="zh_CN.UTF-8"
export LANG="zh_CN.UTF-8"
export LANGUAGE="zh_CN:en_US"

# fcitx5
export GTK_IM_MODULE="fcitx"
export QT_IM_MODULE="fcitx"
export XMODIFIERS="@im=fcitx"

export LIBSEAT_BACKEND="logind"

xrdb ~/.Xresources

exec bspwm

