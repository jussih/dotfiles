#!/bin/bash
set -e

echo "Bootstrapping Debian/Ubuntu system..."
echo ""

# Check if running on Debian/Ubuntu
if ! command -v apt &> /dev/null; then
    echo "Error: This script requires apt (Debian/Ubuntu)"
    exit 1
fi

echo "Installing prerequisites: ansible, stow and make"
sudo apt update
sudo apt install -y ansible stow make

echo ""
echo "Bootstrap complete! You can now run:"
echo "  make install-debian       - Install packages with Ansible"
echo "  make install-debian-core  - Install core role only with Ansible"
echo "  make stow                 - Install dotfiles with Stow"
echo "  make debian               - Run install-debian + stow"
echo "  make debian-core          - Run install-debian-core + stow"
