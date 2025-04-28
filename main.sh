Sessions=$(tmux ls -F "#S")
CHOOSEN=$(
    tmux ls -F "#S" | fzf-tmux -p 60%,60% --border --margin=0 \
        --header '  A-1 Current Sessions  A-2 Directories  A-d kill ' \
        --no-sort --ansi --border-label ' Sessiony ' --prompt '  ' --border=rounded \
        --bind "tab:down,btab:up" \
        --bind "alt-1:change-prompt(  )+reload(tmux ls -F \"#S\")" \
        --bind "alt-2:change-prompt(  )+reload(find -L \"$HOME/Dev\" \"$HOME/.config\" -depth -maxdepth 1 -type d)" \
        --bind "alt-d:execute(tmux kill-session -t {})+change-prompt(  )+reload(tmux ls -F \"#S\")" \
        --bind "alt-k:up,alt-j:down" \
        --bind alt-\':abort
)

if [ "$CHOOSEN" == "" ]; then
    exit 0
fi

ESCAPED_CHOOSEN=$(echo "$CHOOSEN" | tr "." "_")
CHOOSEN_EXISTS=$(echo "$Sessions" | grep "$CHOOSEN")
if [ -z "$CHOOSEN_EXISTS" ]; then
    tmux new -d -s "$ESCAPED_CHOOSEN" -c "$CHOOSEN"
    tmux switchc -t "$ESCAPED_CHOOSEN"
else
    tmux switchc -t "$CHOOSEN"
fi
