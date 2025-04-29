#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -z "$(tmux display-message -p "#{@sessiony-bind}")" ]; then
    tmux bind-key k run-shell "$CURRENT_DIR/main.sh --paths #{@sessiony-custom-paths}"
else
    tmux bind-key "$(tmux display-message -p "#{@sessiony-bind}")" run-shell "$CURRENT_DIR/main.sh --paths #{@sessiony-custom-paths}"
fi
