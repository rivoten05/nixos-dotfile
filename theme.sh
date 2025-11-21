# ==============================================================================
# 2. Apply the theme to each application by calling its dedicated script
# ==============================================================================
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
SELECTED_FLAVOR="$1" # Make sure to capture the flavor argument if it's not the main script

# --- Refactored Block ---
APPLICATIONS=(
    "foot" "bat" "bottom" "btop" "yazi" "nu" "starship" "swaync" 
    "nvim" "lsd" "hyprlock" "wlogout" "waybar" "rofi" "sww" "hypr" 
    "superfile"
)

for APP in "${APPLICATIONS[@]}"; do
    SCRIPT_PATH="$SCRIPT_DIR/$APP.sh"
    
    if [ -f "$SCRIPT_PATH" ]; then
        # Execute the script, passing the flavor argument
        bash "$SCRIPT_PATH" "$SELECTED_FLAVOR"
    fi
done
# --- End Refactored Block ---

echo "Theme application complete."
