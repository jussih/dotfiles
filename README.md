# Dotfiles - Ansible + GNU Stow

This repository manages system packages with Ansible and dotfiles with GNU Stow.

## Supported distros

- Debian 13+ (Trixie)
- Ubuntu 25.10+
- Arch Linux

## Installation

### Prerequisites

Bootstrap the environment (installs stow, make and ansible):

```bash
# Debian/Ubuntu
sudo scripts/bootstrap_debian.sh
# Arch
sudo scripts/bootstrap_arch.sh
```

### Install dotfiles and devtools

```bash
# Debian/Ubuntu
make debian
# Arch
make arch
```

On Ubuntu 25.10 where sudo-rs has replaced traditional sudo, use this workaround until https://github.com/ansible/ansible/issues/85837 is fixed.

```bash
ANSIBLE_BECOME_EXE=sudo.ws make debian
```

### Configure Git Identity

```bash
cp ~/.config/git/config.local.example ~/.config/git/config.local
nvim ~/.config/git/config.local  # Add name and email
```

### Optional - calling ansible and stow individually

```bash
make stow
make install-debian
make install-arch
```

## Machine-local Configuration

- **ZSH:** Create `~/.zshrc.local` for machine-specific shell settings
- **Git:** Edit `~/.config/git/config.local` for identity and other local settings
- **SSH:** Copy `.ssh/config.example` to `.ssh/config` and customize

## Features

- NeoVim as default editor
- ZSH as shell
  - Machine specific configuration should be put to `~/.zshrc.local` - other config files are overwritten
  - `CTRL+X s` - prepend current command line with sudo
  - `CTRL+X d` - insert current date (YYYY-MM-DD) at current position
- FZF (`fzf`)
  - Fast fuzzy searching
  - `CTRL+R` - search command history
  - `CTRL+T` - pick a file to the command line, for example `nvim <CTRL+T>`
  - `ALT+C` - cd to a subdirectory
- RipGrep (`rg`)
  - Extremely fast grep
- TMUX (`tmux`)
  - Terminal multiplexing
  - Local config at `~/.config/tmux/tmux.conf.local`
  - `ALT+[1-9]` - switch window
  - `CTRL+B C` - create window
  - `CTRL+B "` - split vertically
  - `CTRL+B %` - split horizontally
  - `CTRL+B G` - open Lazygit popover in current dir
  - `CTRL+B s` - switch sessions
- Zoxide (`z`)
  - Directory switcher with frecency search
  - `z <substring>` - change to a recent dir
  - `z <substring><SPACE><TAB>` - fzf pick matches
  - `zi <substring>` - fzf pick matches
- GPG with smartcard support
  - Optionally use GPG agent in place of SSH agent, so PGP keys on a Yubikey can
    be used for SSH authentication. Add `export USE_GPG_AGENT=1` to
    `~/.zshrc.local` to enable.
- Languages
  - `uv` to manage Python
  - `rustup` to manage Rust (latest stable toolchain installed by default)
