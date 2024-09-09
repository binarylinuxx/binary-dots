#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Wallpapers/"

# Get list of wallpapers
wallpapers=$(ls "$WALLPAPER_DIR")

# Use wofi to select a wallpaper
selected_wallpaper=$(echo "$wallpapers" | wofi --dmenu --insensitive --prompt="Select Wallpaper:")

# Set the selected wallpaper using swww
if [ -n "$selected_wallpaper" ]; then
    swww img "$WALLPAPER_DIR/$selected_wallpaper"

# Generate Pywal color scheme
    wal -i "$WALLPAPER_DIR/$selected_wallpaper" 

# Restart Waybar
    pkill waybar && waybar

else
    echo "No wallpaper selected."
    exit 1
fi

