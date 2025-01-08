#!/bin/bash

# Directories
DOWNLOADS_DIR="$HOME/Downloads"
APPS_DIR="$HOME/.local/share/applications"
APPIMAGES_DIR="$HOME/.local/bin"
ICONS_DIR="$HOME/.local/share/icons/hicolor/128x128/apps"

# Create directories if they do not exist
mkdir -p "$APPS_DIR" "$APPIMAGES_DIR" "$ICONS_DIR"
