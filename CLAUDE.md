# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a development environment setup repository that contains:
- Shell scripts for bootstrapping development environments on remote servers
- Dotfiles for configuring common development tools (zsh, vim, tmux, git)
- Setup scripts for both local and remote development environment initialization

## Project Structure

```
/
├── scripts/          # Bootstrap and setup scripts
│   ├── dev_setup.sh         # Main development setup script
│   ├── debian_bootstrap.sh  # Debian-specific bootstrap with Erlang/Elixir
│   ├── remote_bootstrap.sh  # Remote server bootstrap wrapper
│   └── remote_dev_setup.sh  # Remote development setup wrapper
└── dotfiles/         # Configuration files
    ├── .zshrc        # ZSH configuration with oh-my-zsh
    ├── .vimrc        # Vim configuration with Vundle plugins
    ├── .tmux.conf    # Tmux configuration
    └── .gitignore    # Global git ignore patterns
```

## Core Architecture

### Bootstrap Process
The repository implements a two-stage setup process:

1. **Bootstrap Stage** (`debian_bootstrap.sh`): Installs system dependencies and language runtimes (Erlang/Elixir via ASDF)
2. **Development Setup** (`dev_setup.sh`): Copies dotfiles and configures development tools

### Remote Setup Pattern
Scripts follow a pattern for remote server setup:
- `remote_bootstrap.sh` - Uploads and executes bootstrap scripts on remote servers
- `remote_dev_setup.sh` - Uploads and executes development setup on remote servers

Both scripts accept IP address and optional remote user parameters.

## Development Environment

### Shell Configuration (.zshrc)
- Uses oh-my-zsh with agnoster theme
- Plugins: git, tmux, docker, mix, kubectl, asdf
- Custom functions:
  - `dev()` - Navigate to project directories
  - `updatedots()` - Update dotfiles and push to git
  - `script()` - Create new executable scripts
- Environment paths include `~/custom/scripts` and `~/dev`

### Editor Configuration (.vimrc)
- Uses Vundle plugin manager
- Key plugins: NERDTree, CtrlP, vim-fugitive, tagbar
- Leader key: `,`
- Configured for 2-space indentation
- Elixir development support with ctags

### Terminal Multiplexer (.tmux.conf)
- Vim-aware pane navigation
- Custom keybindings for session management
- Theme: block/cyan via tmux-themepack

## Common Commands

### Local Development Setup
```bash
# Setup development environment for current user
./scripts/dev_setup.sh

# Setup for specific user
./scripts/dev_setup.sh username
```

### Remote Server Setup
```bash
# Bootstrap remote Debian server
./scripts/remote_bootstrap.sh IP_ADDRESS debian [REMOTE_USER]

# Setup development environment on remote server
./scripts/remote_dev_setup.sh IP_ADDRESS [REMOTE_USER]
```

### Dotfiles Management
```bash
# Update dotfiles from current environment (via zsh function)
updatedots

# Navigate to project directory (via zsh function)
dev project_name
```

## Important Notes

- The repository expects projects to be organized under `~/dev/`
- Custom scripts and tools are expected in `~/custom/`
- The setup process installs oh-my-zsh, tmux plugin manager, and Vundle
- Remote setup requires SSH key authentication
- Bootstrap scripts are designed for Debian-based systems