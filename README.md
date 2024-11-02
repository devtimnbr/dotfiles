# Dotfiles

Personal configurations for a consistent development environment setup.

## Installation

Run the setup script:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/devtimnbr/dotfiles/refs/heads/main/.install-setup.sh)"
```

## Repository Structure

```
.
├── .config
│   ├── alacritty          # Alacritty terminal configs + themes
│   ├── btop               # btop system monitor configs + themes
│   ├── nvim               # Neovim config and plugins
│   ├── starship.toml      # Starship prompt config
│   └── svim               # SketchyVim configuration
├── .install-setup.sh      # Setup script
├── .tmux.conf             # Tmux configuration
├── .zshrc                 # Zsh shell configuration
└── README.md              # This README
```

### Config Highlights

- **Alacritty**: Includes themes (Dracula, Nord, etc.). Theme previews are in `images/`.
- **Neovim**: Configured with plugins for code styling, git, debugging.
- **Starship**: Cross-shell prompt customization.
- **Tmux**: Keybindings, appearance customizations.
- **Zsh**: Aliases, functions, and extras.
- **SketchyVim**: Turns accessible input fields on macOS into full Vim buffers.

### Modifications

- **Themes**: Swap Alacritty, btop, or Neovim themes by editing their `.toml` files.
- **Neovim Plugins**: Add plugins to `.config/nvim/lua/custom/plugins/`.

Edit config files or extend this setup as needed.

