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

# this would install a package from rpmfusion
# rpm-ostree install vlc

# rpm-ostree install dotnet-sdk-8.0
rpm-ostree install dotnet-sdk-8.0 \
    openfortivpn \
    NetworkManager-fortisslvpn-gnome \
    NetworkManager-l2tp-gnome \
    gnome-shell-extension-system-monitor

rpm-ostree install https://release.axocdn.com/linux/gitkraken-amd64.rpm

#### Example for enabling a System Unit File

# systemctl enable podman.socket
