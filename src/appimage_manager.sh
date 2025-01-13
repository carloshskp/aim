#!/bin/bash

# Import the icon manager functions
source "$(pwd)/src/icon_manager.sh"

# Function to install an .AppImage file
install_appimage() {
  # List available .AppImage files
  appimages=($(ls "$DOWNLOADS_DIR"/*.AppImage 2>/dev/null))
  if [ ${#appimages[@]} -eq 0 ]; then
    echo "No .AppImage files found in $DOWNLOADS_DIR."
    exit 1
  fi

  # Display options for the user
  echo "Select the .AppImage file to install:"
  select appimage in "${appimages[@]}"; do
    if [[ -n "$appimage" ]]; then
      break
    else
      echo "Invalid option. Please try again."
    fi
  done

  # Process the selected file
  if [[ -f "$appimage" ]]; then
    # Extract the filename without version
    base_name=$(basename "$appimage")
    clean_name=$(remove_version "$base_name")

    # Ask the user for the shortcut name
    read -p "Enter the shortcut name (press Enter to use '$clean_name'): " custom_name
    if [[ -z "$custom_name" ]]; then
      custom_name="$clean_name"
    fi

    # Copy the file to the standard applications directory
    cp "$appimage" "$APPIMAGES_DIR/$clean_name"
    chmod +x "$APPIMAGES_DIR/$clean_name"

    # Extract embedded icon if available
    icon_name="${custom_name}"
    icon_path="$ICONS_DIR/$icon_name.png"
    
    # Ask the user if they want to select a default icon
    read -p "Do you want to select an icon from the Downloads folder? (y/n): " select_icon
    if [[ "$select_icon" == "y" ]]; then
      echo "Select an icon from the Downloads folder:"
      # List available icon files in the Downloads folder
      icons=($(ls "$DOWNLOADS_DIR"/*.{ico,png,jpg} 2>/dev/null))
      if [ ${#icons[@]} -eq 0 ]; then
        echo "No icons found in the Downloads folder."
        cp "$(pwd)/assets/default-icon.png" "$icon_path"  # Replace with the path to the default icon
        echo "Using default icon."
      else
        select icon in "${icons[@]}"; do
          if [[ -n "$icon" ]]; then
            # Check the icon format and convert if necessary
            if [[ "$icon" == *.ico || "$icon" == *.jpg ]]; then
              convert_icon "$icon" "$icon_path"  # Call the convert_icon function
            else
              cp "$icon" "$icon_path"
              echo "Icon successfully copied to $icon_path."
            fi
            break
          else
            echo "Invalid option. Please try again."
          fi
        done
      fi
    else
      # Use default icon if no embedded icon
      cp "$(pwd)/assets/default-icon.png" "$icon_path"  # Replace with the path to the default icon
    fi

    # Create a shortcut for the application
    desktop_file="$APPS_DIR/$icon_name.desktop"

    cat > "$desktop_file" <<EOL
[Desktop Entry]
Name=$icon_name
Exec=$APPIMAGES_DIR/$clean_name --no-sandbox
Icon=$icon_path
Type=Application
Terminal=false
Categories=Utility;
StartupWMClass=$icon_name
EOL

    echo "Shortcut for $icon_name created at $desktop_file"
  fi
}

# Function to uninstall an .AppImage file
uninstall_appimage() {
  # List existing shortcuts
  desktop_files=($(ls "$APPS_DIR"/*.desktop 2>/dev/null))
  if [ ${#desktop_files[@]} -eq 0 ]; then
    echo "No shortcuts found in $APPS_DIR."
    exit 1
  fi

  # Display options for the user
  echo "Select the .AppImage application shortcut to uninstall:"
  select desktop_file in "${desktop_files[@]}"; do
    if [[ -n "$desktop_file" ]]; then
      break
    else
      echo "Invalid option. Please try again."
    fi
  done

  # Remove the shortcut, copied file, and icon
  if [[ -f "$desktop_file" ]]; then
    app_name="$(basename "$desktop_file" .desktop)"
    appimage_file="$APPIMAGES_DIR/$app_name.AppImage"
    icon_file="$ICONS_DIR/$app_name.png"

    rm -f "$desktop_file"
    rm -f "$appimage_file"
    rm -f "$icon_file"

    echo "Application $app_name successfully uninstalled."
  fi
}