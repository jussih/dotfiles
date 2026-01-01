.PHONY: help install uninstall stow unstow bootstrap-debian bootstrap-arch install-debian install-fedora install-arch debian arch

STOW_DIR := stow
PACKAGES := $(notdir $(wildcard $(STOW_DIR)/*))
ANSIBLE_DIR := ansible
ANSIBLE_PLAYBOOK := $(ANSIBLE_DIR)/playbook.yml
ANSIBLE_INVENTORY := $(ANSIBLE_DIR)/hosts

help:
	@echo "Dotfiles Management"
	@echo ""
	@echo "Bootstrap targets (install prerequisites):"
	@echo "  bootstrap-debian   - Install Ansible and Stow on Debian/Ubuntu"
	@echo "  bootstrap-arch     - Install Ansible and Stow on Arch Linux"
	@echo ""
	@echo "Stow targets (dotfiles only):"
	@echo "  stow     - Install dotfiles using GNU Stow"
	@echo "  unstow - Uninstall dotfiles"
	@echo ""
	@echo "Ansible targets (system packages):"
	@echo "  install-debian     - Install packages on Debian/Ubuntu"
	@echo "  install-arch       - Install packages on Arch Linux"
	@echo ""
	@echo "All-in-one targets:"
	@echo "  debian             - Bootstrap + install packages + stow (Debian/Ubuntu)"
	@echo "  arch               - Bootstrap + install packages + stow (Arch Linux)"
	@echo ""
	@echo "Manual workflow:"
	@echo "  1. Run 'make bootstrap-<distro>' to install prerequisites"
	@echo "  2. Run 'make install-<distro>' to install packages"
	@echo "  3. Run 'make stow' to install dotfiles"

install: stow

stow:
	@echo "Installing dotfiles with Stow..."
	# --no-folding makes sure directories are not symlinked but created to the target
	#  and individual files are linked.
	cd $(STOW_DIR) && stow -v --no-folding --restow -t $${HOME} $(PACKAGES)
	@echo "Done! Dotfiles installed."

uninstall: unstow

unstow:
	@echo "Uninstalling dotfiles with Stow..."
	cd $(STOW_DIR) && stow -vD -t $${HOME} $(PACKAGES)
	@echo "Done! Dotfiles uninstalled."

install-debian:
	@echo "Installing packages with Ansible (Debian/Ubuntu)..."
	ansible-playbook -v -i $(ANSIBLE_INVENTORY) -K $(ANSIBLE_PLAYBOOK)

install-fedora:
	@echo "Installing packages with Ansible (Fedora/RHEL)..."
	@echo "NOTE: Fedora support not yet implemented. Please add vars/RedHat.yml first."
	@exit 1

install-arch:
	@echo "Installing packages with Ansible (Arch Linux)..."
	ansible-playbook -v -i $(ANSIBLE_INVENTORY) -K $(ANSIBLE_PLAYBOOK)

bootstrap-debian:
	@echo "Bootstrapping Debian/Ubuntu system..."
	./scripts/bootstrap_debian.sh

bootstrap-arch:
	@echo "Bootstrapping Arch Linux system..."
	./scripts/bootstrap_arch.sh

debian: bootstrap-debian install-debian stow

arch: bootstrap-arch install-arch stow
