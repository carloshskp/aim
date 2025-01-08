#!/bin/bash

# Imports
source "$(pwd)/config.sh"

# Create directories if they do not exist
mkdir -p "$APPS_DIR" "$APPIMAGES_DIR" "$ICONS_DIR"

# Function to remove the version from the filename
remove_version() {
  echo "$1" | sed -E 's/-[0-9]+(\.[0-9]+)*(-[a-zA-Z]+)?\.AppImage$/.AppImage/'
}

# Function to select an .AppImage file
select_appimage() {
  appimages=($(ls "$DOWNLOADS_DIR"/*.AppImage 2>/dev/null))
  if [ ${#appimages[@]} -eq 0 ]; then
    echo "No .AppImage files found in $DOWNLOADS_DIR."
    exit 1
  fi

  echo "Select the .AppImage file to install:"
  select appimage in "${appimages[@]}"; do
    if [[ -n "$appimage" ]]; then
      echo "$appimage"
      return
    else
      echo "Invalid option. Please try again."
    fi
  done
}
