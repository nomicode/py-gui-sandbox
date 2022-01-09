#!/bin/sh -e

sudo mkdir -p /run/user/1000
sudo chown -R vscode /run/user/1000
sudo chown -R vscode /run/xpra

xpra start \
    --bind-tcp=0.0.0.0:10000 \
    --html=on \
    --start-child=./test.py \
    --exit-with-children \
    --daemon=no \
    --opengl=no \
    --xvfb="Xvfb -nolisten tcp -noreset" \
    --pulseaudio=no \
    --notifications=no \
    --bell=no \
    --webcam=no \
    --mdns=no \
    --resize-display=yes

#   --opengl=no \
#   --webcam=no \
#   --system-tray=no
#   --xvfb="Xorg -nolisten tcp -noreset +extension GLX" \

# Xvfb +extension Composite -screen 0 1920x1080x24+32 -nolisten tcp -noreset
