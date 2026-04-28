# Dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/) for easy config synchronization across machines.

## What is GNU Stow?

GNU Stow is a symlink farm manager that organizes configuration files into packages. Instead of manually creating symlinks or copying files, stow automates the process:

```
~/.dotfiles/
  zshrc/
    .zshrc          → symlinks to ~/.zshrc
  nvim/
    .config/nvim/   → symlinks to ~/.config/nvim/
  tmux/
    .tmux.conf      → symlinks to ~/.tmux.conf
```

**Benefits:**
- One command to install all configs or individual packages
- Easy to uninstall (removes symlinks, keeps files)
- Automatic conflict detection
- Safe rollbacks
- No manual symlink management

## Getting Started

### Prerequisites
- GNU Stow (usually pre-installed; otherwise `brew install stow`)
- Git
- For Neovim: `tree-sitter` and `tree-sitter-cli` for syntax highlighting
  ```bash
  brew install tree-sitter tree-sitter-cli
  ```

### Initial Setup

```bash
# Clone the repo
git clone git@github.com:SwayZeee/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install all packages
stow zshrc nvim tmux

# Or install selectively
stow zshrc   # Just shell config
stow nvim    # Just neovim config
```

### Verify Installation

```bash
# Check symlinks
ls -l ~/.zshrc ~/.config/nvim ~/.tmux.conf

# All should point to ~/.dotfiles/<tool>/<config>
```

## Managing Configs

### Edit and Commit

Since configs are symlinked, edits flow back to the repo automatically:

```bash
# Edit your shell config (as normal)
vim ~/.zshrc

# Changes are in ~/.dotfiles/zshrc/.zshrc
cd ~/.dotfiles
git status          # Shows zshrc/.zshrc modified
git add zshrc/.zshrc
git commit -m "feat: update zshrc"
git push
```

### Add a New Config

Example: Adding git config to the dotfiles repo.

```bash
# 1. Create the package directory
mkdir -p git

# 2. Add config file matching target structure
# ~/.gitconfig → git/.gitconfig
cp ~/.gitconfig git/.gitconfig

# 3. Install with stow
stow git

# 4. Verify symlink
ls -l ~/.gitconfig  # Should point to ~/.dotfiles/git/.gitconfig

# 5. Commit
git add git/
git commit -m "feat: add git config"
git push
```

### Install/Uninstall Packages

```bash
# Install a package
stow tmux

# Uninstall a package (removes symlinks, keeps repo files)
stow -D tmux

# Install multiple at once
stow nvim tmux zshrc

# List installed packages
ls -d */
```

## Current Packages

| Package | Manages | Status |
|---------|---------|--------|
| `zshrc` | `~/.zshrc` | ✓ Installed |
| `nvim` | `~/.config/nvim/` | ✓ Installed |
| `tmux` | `~/.tmux.conf` | ✓ Installed |

### Tools Configured

- **Shell**: nvm, jenv, rbenv, Oh My Zsh, Powerlevel10k
- **Development**: Flutter, Android SDK, Miniconda, Bun
- **Plugins**: zsh-autosuggestions, zsh-syntax-highlighting
- **Utilities**: colorls

## Setup at a New Mac

### Quick Start

```bash
# 1. Clone dotfiles
git clone git@github.com:SwayZeee/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# 2. Install Homebrew (if not present)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 3. Install package managers via brew
brew install nvm jenv rbenv

# 4. Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 5. Install stow (if needed)
brew install stow

# 6. Install dotfiles packages
stow zshrc nvim tmux

# 7. Source the shell config
source ~/.zshrc

# 8. Follow tool-specific setup (see below)
```

### Tool-Specific Setup

After running the quick start, install remaining tools:

#### Node (via nvm)
```bash
nvm install node
npm install -g yarn
```

#### Ruby (via rbenv)
```bash
rbenv install 3.0.0  # or latest
rbenv global 3.0.0
```

#### Java (via jenv)
```bash
# Add existing Java installations
jenv add /Library/Java/JavaVirtualMachines/*/Contents/Home
jenv global <version>
```

#### Flutter & Android
```bash
# Install Android SDK: https://developer.android.com/studio
# Then update ANDROID_HOME in ~/.zshrc

# Install Flutter: https://flutter.dev/docs/get-started/install/macos
# Update Flutter path in ~/.zshrc
```

#### Miniconda
```bash
# Download from https://docs.conda.io/en/latest/miniconda.html
# Run installer (it auto-configures ~/.zshrc)
```

#### colorls (Ruby gem)
```bash
gem install colorls
```

#### Bun
```bash
curl -fsSL https://bun.sh/install | bash
```

### Neovim Setup
```bash
brew install neovim
# Plugins install automatically via lazy.nvim on first launch
```

### Tmux Setup
```bash
brew install tmux
# Configuration loads from ~/.tmux.conf (symlinked)
```

## Common Tasks

### Update Configs
```bash
cd ~/.dotfiles
git pull origin main
```

### Add a New Tool Config
See "Add a New Config" section above.

### Troubleshoot Symlinks
```bash
# Check what stow would do (dry-run)
stow --no <package>

# Check existing symlinks
cd ~
ls -la | grep "^l"

# Verify all dotfiles symlinks
cd ~
ls -lh .zshrc .config/nvim .tmux.conf
```

### Resolve Conflicts
If stow reports conflicts (file already exists):
```bash
# Option 1: Move existing file
mv ~/.zshrc ~/.zshrc.old

# Option 2: Delete existing file
rm ~/.zshrc

# Then run stow
stow zshrc
```

## Tips

- Keep machine-specific configs in `~/.zshrc.local` (add `source ~/.zshrc.local` to zshrc if needed)
- Use `.gitignore` for sensitive files (passwords, tokens)
- Backup before major updates: `cp -r ~/.dotfiles ~/.dotfiles.backup`
- Test new configs on a branch before merging to main

## Resources

- [GNU Stow Manual](https://www.gnu.org/software/stow/manual/)
- [Dotfiles Resources](https://dotfiles.github.io/)
- [My GitHub Dotfiles](https://github.com/SwayZeee/.dotfiles)
