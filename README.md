# Dotfiles - Ansible + GNU Stow

This repository manages system packages with Ansible and dotfiles with GNU Stow.

## Supported distros

- Debian 13+ (Trixie)
- Ubuntu 25.10+

## Installation

### Prerequisites

Bootstrap the environment (installs stow, make and ansible):

```bash
sudo scripts/bootstrap_debian.sh
```

### Install dotfiles and devtools

```bash
make debian
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
```


## Machine-local Configuration

- **ZSH:** Create `~/.zshrc.local` for machine-specific shell settings
- **Git:** Edit `~/.config/git/config.local` for identity and other local settings
- **SSH:** Copy `.ssh/config.example` to `.ssh/config` and customize

## Features

- NeoVim as default editor
- ZSH as shell
  - Machine specific configuration should be put to ~/.zshrc.local - other config files are overwritten
- FZF (`fzf`)
  - Fast fuzzy searching
  - `CTRL+R` - search command history
  - `CTRL+T` - pick a file to the command line, for example `nvim <CTRL+T>`
  - `ALT+C` - cd to a subdirectory
- RipGrep (`rg`)
  - Extremely fast grep
- TMUX (`tmux`)
  - Terminal multiplexing
  - `ALT+[1-9]` - switch window
  - `CTRL+B C` - create window
  - `CTRL+B "` - split vertically
  - `CTRL+B %` - split horizontally
  - `CTRL+B G` - Open Lazygit popover in current dir
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
