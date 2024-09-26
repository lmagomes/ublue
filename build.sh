#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"


### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
# rpm-ostree install screen
rpm-ostree install fish

# this would install a package from rpmfusion
# rpm-ostree install vlc

# other packages
wget https://app.testcontainers.cloud/download/testcontainers-desktop_linux_x86-64.rpm  -O /tmp/testcontainers-desktop_linux_x86-64.rpm
rpm-ostree install /tmp/testcontainers-desktop_linux_x86-64.rpm
rm /tmp/testcontainers-desktop_linux_x86-64.rpm

#### Example for enabling a System Unit File

# systemctl enable podman.socket
