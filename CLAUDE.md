# Claude.md - Dotfiles Project

## Project Overview
This is a dotfiles repository managed with GNU Stow for easy config synchronization across machines. Configs are organized by tool and symlinked from `~` to this repo.

## Key Info
- **Location**: `/Users/paru/.dotfiles`
- **Tool**: GNU Stow 2.4.1 (already installed)
- **Git Config (local)**: 
  - Email: patrick.rueschenbaum@googlemail.com
  - Name: SwayZeee
- **Git Config (global)**: 
  - Email: paru@netlight.com
  - Name: paru-netlight

## Workflow
1. Edit configs in `~` (e.g., `~/.zshrc`, `~/.config/nvim/`)
2. Changes are automatically reflected in the repo (all symlinked via stow)
3. Commit and push:
   ```bash
   git add -A
   git commit -m "feat: <description>"
   git push origin main
   ```

## Current Managed Configs
- `zshrc/` → `~/.zshrc`
- `nvim/` → `~/.config/nvim/`
- `tmux/` → `~/.tmux.conf`

## Adding New Configs
1. Create directory: `mkdir -p <tool>` (e.g., `git/`)
2. Add config files matching target structure: `git/.gitconfig` → `~/.gitconfig`
3. Install: `stow <tool>`
4. Verify symlink: `ls -l ~/<config>`

## Do NOT
- Manually create symlinks (use stow instead)
- Edit files in the repo directly; edit in `~` and changes flow back
- Delete symlinks without `stow -D <tool>`

## Backups
- Local backups are prefixed with `.bak` (e.g., `~/.zshrc.bak`) — do not commit these
