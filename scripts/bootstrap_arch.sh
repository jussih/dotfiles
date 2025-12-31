#!/bin/bash
set -e

echo "Bootstrapping Arch Linux system..."
echo ""

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    echo "Error: This script requires pacman (Arch Linux)"
    exit 1
fi

echo "Installing prerequisites: ansible, stow and make"
sudo pacman -Sy --needed --noconfirm ansible stow make

echo ""
echo "Bootstrap complete! You can now run:"
echo "  make install-arch  - Install packages with Ansible"
echo "  make stow          - Install dotfiles with Stow"
echo "  make arch          - Run both install-arch and stow"
