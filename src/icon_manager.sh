#!/bin/bash

# Function to select an icon
select_icon() {
  echo "Select an icon from the Downloads folder:"
  icons=($(ls "$DOWNLOADS_DIR"/*.{ico,png,jpg} 2>/dev/null))
  if [ ${#icons[@]} -eq 0 ]; then
    echo "No icons found in the Downloads folder."
    return 1
  fi

  select icon in "${icons[@]}"; do
    if [[ -n "$icon" ]]; then
      echo "$icon"
      return
    else
      echo "Invalid option. Please try again."
    fi
  done
}

# Function to convert icon to .png
convert_icon() {
  local icon_path="$1"
  local output_path="$2"
  
  if ffmpeg -i "$icon_path" "$output_path" >/dev/null 2>&1; then
    echo "Icon successfully converted to $output_path."
  else
    echo "Error converting the icon."
    return 1
  fi
}