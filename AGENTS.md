# Agent instructions

This is a dotfiles and environment setup project, which is used automatically configure and manage Linux machines for software development work.

The repository is structured into 2 parts:
- `stow/` folder contains GNU Stow packages which symlink configuration files into the home directory of the user
- `ansible/` folder contains an ansible project which installs and configures software and the user environment in the system. It is adaptable to multiple Linux distributions.

The entry point is the `Makefile` in the root which contains a GNU Make setup for running Stow and Ansible. 
Additionally, the `scripts/` folder contains independent shell scripts such as `booststrap_<distro_name>.sh` to install low level dependencies needed to invoke Make and Ansible, and `test_<distro_name>.sh` to test the system by installing into a clean Docker container.

