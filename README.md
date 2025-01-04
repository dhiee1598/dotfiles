# My Dotfiles

WELCOME to my dotfiles! This provides an overview of the packages I use, configurations, and installation steps for my setup.

---

## Packages

### Installed via `pacman`:
- `ttf-firacode-nerd`: Nerd Fonts with Fira Code.
- `ttf-font-awesome`: Font Awesome icons.
- `neovim`: Text editor.
- `firefox`: Web browser.
- `kitty`: Terminal emulator.
- `waybar`: Status bar for Wayland.
- `papirus-icon-theme`: Icon theme.
- `git`: Version control.
- `base-devel`: Development tools.
- `rofi`: Application launcher.
- `pavucontrol`: Audio control.
- `zsh`: Shell.
- `stow`: Dotfile manager.
- `wl-clipboard`: Clipboard utilities for Wayland.
- `unzip`: Archive extractor.
- `neofetch`: System information tool.
- `gsimplecal` Calendar.
- `lazygit` Simple terminal UI for git commands.
- `ripgrep` Command-line tool for searching text within files.
- `tmux` Terminal multiplexer.

### Installed via `yay` (AUR):
- `bibata-cursor-theme`: Cursor theme.
- `swaync`: Notification center for Wayland.
- `visual-studio-code-bin`: Code editor.
- `spotify`: Music streaming application.
- `polkit-gnome`: Authentication agent for GNOME.
- `wlogout`: Logout menu for Wayland.
- `xdg-desktop-portal-hyprland-git`: Hyprland support for desktop portals.
- `hyprland-git`: Wayland compositor.
- `hyprpaper-git`: Wallpaper manager for Hyprland.
- `hyprlock-git`: Lock screen.
- `hypridle-git`: Idle management for Hyprland.
- `hyprshot-git`: Screenshot tool for Hyprland.

---

## Configuration

### VS Code Custom Title Bar
Add the following to your `settings.json` in VS Code:
```json
"window.titleBarStyle": "custom"
```

---

## Installation Steps

### Installing `yay`
```bash
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

### Installing `Tmux Plugin Manager`
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### Install `Oh My Zsh`
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Zsh Plugins

#### `zsh-autosuggestions`
```bash
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

#### `zsh-syntax-highlighting`
```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

#### `you-should-use`
```bash
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
```

Add all these plugins to the `plugins` array in your `.zshrc` file.

### Installing `powerlevel10k`
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

Edit your `.zshrc` file:
- Find the line that sets `ZSH_THEME`.
- Change its value to:
  ```bash
  ZSH_THEME="powerlevel10k/powerlevel10k"
  ```

### Load `neofetch` in `.zshrc`
Add the following line to the very top of your `.zshrc` file:
```bash
neofetch
```

---
