# My Dotfiles

Welcome to my dotfiles! This README provides an overview of the packages I use, configurations, and installation steps for my setup.

---

## Packages

### Installed via `pacman`:
- `ttf-firacode-nerd`: Nerd Fonts with Fira.
-`ttf-font-awesome`: Font Awesome icons.
- `neovim`: Text editor.
- `firefox`: Web browser.
- `kitty`: Terminal emulator.
- `hyprland`: Wayland compositor.
- `hyprpaper`: Wallpaper manager for Hyprland.
- `waybar`: Status bar for Wayland.
- `papirus-icon-theme`: Icon theme.
- `git`: Version control.
- `base-devel`: Development tools.
- `rofi`: Application launcher.
- `pavucontrol`: Audio control.
- `hyprlock`: Lock screen.
- `feh`: Image viewer.
- `zsh`: Shell.
- `nautilus`: File manager.
- `stow`: Dotfile manager.
- `wl-clipboard`: Clipboard utilities for Wayland.
- `unzip`: Archive extractor.
- `neofetch`: System information tool.
- `gsimplecal` Calendar
- `lazygit` Simple terminal UI for git commands

### Installed via `yay` (AUR):
- `bibata-cursor-theme`: Cursor theme.
- `hyprshot`: Screenshot tool for Hyprland.
- `swaync`: Notification center for Wayland.
- `hypridle`: Idle management for Hyprland.
- `visual-studio-code-bin`: Code editor.
- `spotify`: Music streaming application.
- `polkit-gnome`: Authentication agent for GNOME.
- `wlogout`: Logout menu for Wayland.
- `xdg-desktop-portal-gtk`: GTK support for desktop portals.
- `xdg-desktop-portal-hyprland`: Hyprland support for desktop portals.
- `sddm-theme-tokyo-night-git`: Login theme using sddm

---

## Configuration

### Setting Dark Theme
To enable the dark theme:
```bash
gsettings set org.gnome.desktop.interface color-scheme prefer-dark
```

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

### Install Oh My Zsh
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

### Making `sddm.conf` file
If sddm.conf is missing in the /etc/
```bash
sddm --example-config | sudo tee /etc/sddm.conf
```
Find the line that sets `[Theme]`
Change the theme to:
```bash
[Theme]
Current=tokyo-night-sddm
```

---
