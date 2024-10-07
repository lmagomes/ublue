#!/bin/bash

set -ouex pipefail

TEMP_DIR=$(mktemp -d)
(
    cd $TEMP_DIR
    curl -Lo $TEMP_DIR/testcontainers-desktop_linux_x86-64.rpm https://app.testcontainers.cloud/download/testcontainers-desktop_linux_x86-64.rpm
    rpm2cpio $TEMP_DIR/testcontainers-desktop_linux_x86-64.rpm | cpio -idmv

    cp -r $TEMP_DIR/opt/testcontainers-desktop /var/opt/
    cp -ru $TEMP_DIR/usr/share/* /usr/share/

    gtk-update-icon-cache /usr/share/icons/hicolor
    ln -sf /var/opt/testcontainers-desktop/bin/testcontainers-desktop /usr/bin/testcontainers-desktop
)
