#!/bin/bash

xhost +

podman run -e XDG_RUNTIME_DIR=/tmp \
           -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY \
           -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/tmp/$WAYLAND_DISPLAY  \
           --rm -it --cap-drop=all  --cap-add=DAC_OVERRIDE,SETFCAP,SETPCAP,SYS_CHROOT --network host --env DISPLAY --security-opt label=type:container_runtime_t --security-opt no-new-privileges=true --name fx firefox-sandbox

xhost -
