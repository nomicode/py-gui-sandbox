#!/bin/sh -e

# Experimental
apk add --no-cache \
    tk \
    tk-dev \
    libnotify-dev \
    libconfig-dev \
    xauth \
    xvfb \
    xpra \
    xpra-doc \
    xpra-webclient \
    dbus \
    dbus-x11 \
    gstreamer \
    avahi \
    python3-tkinter \
    py-avahi \
    py3-paramiko \
    py3-uinput \
    py3-cairo \
    py3-netifaces \
    py3-inotify \
    xdg-utils \
    py3-xdg \
    py3-opengl \
    py3-pam \
    linux-pam \
    pulseaudio \
    pulseaudio-alsa \
    alsa-plugins-pulse


# Error parsing xdg menu data:
# 2022-01-09 17:27:47,620  ParsingError in file '/etc/xdg/menus/kde-applications.menu', File not found
#
# Not sure why it's defaulting to KDE? but this seems to fix it
apk add --no-cache xdg-desktop-portal-kde
apk add --no-cache librsvg-dev
# TODO: get it working without KDE

# OpenGL
apk add x11vnc
