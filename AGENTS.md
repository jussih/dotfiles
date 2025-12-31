# Agent instructions

This is a dotfiles and environment setup project, which is used automatically configure and manage Linux machines for software development work.

The repository is structured into 2 parts:
- `stow/` folder contains GNU Stow packages which symlink configuration files into the home directory of the user
- `ansible/` folder contains an ansible project which installs and configures software and the user environment in the system. It is adaptable to multiple Linux distributions.

The entry point is the `Makefile` in the root which contains a GNU Make setup for running Stow and Ansible. 
Additionally, the `scripts/` folder contains independent shell scripts such as `booststrap_<distro_name>.sh` to install low level dependencies needed to invoke Make and Ansible, and `test_<distro_name>.sh` to test the system by installing into a clean Docker container.

When making changes to the project, update README.md when the existing information there conflicts with the new changes.

## Ansible instructions

- Different distros are managed by distro-specific vars files and conditionals in the `ansible/roles/[role_name]/tasks/main.yml` for different package managers
- When adding a new distro
  - Create a new vars file, populating it with same packages as in `Debian.yml` but with package names from the new distro
  - If the new distro is not apt-based, add a new conditional package installation task in `ansible/roles/[role_name]/tasks/main.yml` using the correct package manager
  - If there are known quirks in the new distro (things that work differently than in debian/ubuntu needing), add conditional tasks
  - Create a `scripts/bootstrap_[distro].sh` using `scripts/bootstrap_debian.sh` as a template
  - Create a `scripts/test_[distro].sh` using `scripts/test_debian.sh` as a template
  - Add tasks in `Makefile` - `boostrap_[distro]`, `install_[distro]`, `[distro]`
  - Update `README.md`
