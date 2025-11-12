
#!/usr/bin/env bash

NVIM_KEYS_FILE="$HOME/.config/nvim/lua/configs/keymaps.lua"

mode_name() {
    case "$1" in
        n) echo "normal" ;;
        i) echo "insert" ;;
        v) echo "visual" ;;
        x) echo "visual" ;;
        s) echo "select" ;;
        t) echo "terminal" ;;
        *) echo "$1" ;;
    esac
}


readable_key() {
    local key="$1"
    # Add space after 'leader'
    key="${key//<leader>/leader }"
    key=$(echo "$key" | sed -E '
        s/<A-([^>]+)>/ALT \1/g;
        s/<C-([^>]+)>/CTRL \1/g;
        s/<S-([^>]+)>/SHIFT \1/g;
        s/<M-([^>]+)>/META \1/g;
        s/<([a-z]+)>/\U\1/g
    ')
    key=$(echo "$key" | sed 's/[<>]//g')
    echo "$key"
}


grep -E 'map\(|api\.nvim_set_keymap' "$NVIM_KEYS_FILE" | while read -r line; do
    # extract mode
    mode=$(echo "$line" | grep -oP 'map\(\s*"\K[^"]+')
    if [[ -z "$mode" ]]; then
        mode=$(echo "$line" | grep -oP 'api\.nvim_set_keymap\("\K[^"]+')
    fi
    # extract key
    key=$(echo "$line" | grep -oP 'map\(\s*"[^"]+",\s*"\K[^"]+' || true)
    if [[ -z "$key" ]]; then
        key=$(echo "$line" | grep -oP 'api\.nvim_set_keymap\("[^"]+",\s*"\K[^"]+' || true)
    fi
    # extract desc
    desc=$(echo "$line" | grep -oP 'desc\s*=\s*"\K[^"]+')

    # if missing desc, put a placeholder
    [[ -z "$desc" ]] && desc="No description"

    # convert and print
    mname=$(mode_name "$mode")
    rkey=$(readable_key "$key")
    printf "%-8s %-20s : %s\n" "$mname" "$rkey" "$desc"
done

