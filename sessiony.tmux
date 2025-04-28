#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "$(tmux display-message -p "#{@sessiony-key}")" ]; then
    tmux bind-key k run-shell "$CURRENT_DIR/main.sh"
else
    tmux bind-key "$(tmux display-message -p "#{@sessiony-key}")" run-shell "$CURRENT_DIR/main.sh"
fi
