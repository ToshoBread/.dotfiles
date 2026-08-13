# Dotfiles

Personal configuration files for my Linux + Hyprland setup.

## Stack

- **WM**: Hyprland
- **Terminal**: WezTerm
- **Editor**: Neovim
- **Shell**: Zsh + Starship
- **Status bar**: Waybar
- **Launcher**: Wofi
- **Multiplexer**: tmux

## Installation

### Clone full repo

Clone and symlink with [stow](https://www.gnu.org/software/stow/):

```bash
git clone https://github.com/ToshoBread/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Symlink all
stow */

# Or symlink individually
stow hypr nvim zsh
```

### Clone individual directories

Use [degit](https://github.com/Rich-Harris/degit) to fetch a single folder and symlink it:

```bash
# Clone to a local directory
npx degit https://github.com/ToshoBread/.dotfiles/tree/main/hypr ~/.dotfiles/hypr
npx degit https://github.com/ToshoBread/.dotfiles/tree/main/nvim ~/.dotfiles/nvim
npx degit https://github.com/ToshoBread/.dotfiles/tree/main/zsh ~/.dotfiles/zsh

# Then symlink with stow
cd ~/.dotfiles
stow hypr nvim zsh
```
