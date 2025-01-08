#!/bin/bash

source "$(pwd)/config.sh"
source "$(pwd)/src/file_manager.sh"
source "$(pwd)/src/icon_manager.sh"
source "$(pwd)/src/appimage_manager.sh"

# Menu for the user
echo "Do you want to install or remove an .AppImage file?"
select option in "Install" "Remove"; do
  case $option in
    "Install")
      install_appimage
      break
      ;;
    "Remove")
      uninstall_appimage
      exit 0
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac
done

# Suggest the user to manually update the cache
echo "Automatic cache update disabled to avoid freezing. Manually update using the commands below, if necessary:"
echo "  gtk-update-icon-cache"
echo "  update-desktop-database"
echo "Processing completed."
