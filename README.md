# Sessiony
Really simple session management plugin for tmux.

![image](https://github.com/user-attachments/assets/dcde7729-da41-42bb-9c5b-8ae51bbee9b0)

## Requirements 
- [fzf](https://github.com/junegunn/fzf)
- [tmux](https://github.com/tmux/tmux)
- [tpm](https://github.com/tmux-plugins/tpm)

## Installation
### Using TPM 
```bash
# Using TPM
set -g @plugin 'qulxizer/sessiony'
```

### Manual Installation
1. Cloning this repo into `~/.config/tmux/plugins`
  ```bash
  # Manual Installation
  mkdir -p ~/.config/tmux/plugins
  git clone https://github.com/qulxizer/sessiony/ ~/.config/tmux/plugins
  ```
2. Either sourcing `~/.config/tmux/plugins/sessiony/sessiony.tmux` or adding `run ~/.config/tmux/plugins/sessiony/sessiony.tmux` in your `~/.config/tmux/tmux.conf`

## Configuration
```bash
# Setting custom bind to launch sessiony, Usage: Prefix+k
set -g @sessiony-bind 'k'

# Setting custom paths for the directories panel
set -g @sessiony-custom-paths '$HOME,$HOME/.config'
```



