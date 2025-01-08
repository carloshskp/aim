# [PT-BR](READMEBR.md)

# AIM - AppImage Manager

This project is an application manager for `.AppImage` files, allowing users to install and remove applications interactively. The main script (`main.sh`) coordinates the installation and uninstallation operations, utilizing functions defined in auxiliary files.


## Project Structure

- `main.sh`: Main script that manages the installation and removal of `.AppImage` files.
- `src/`: Directory containing auxiliary scripts.
  - `file_manager.sh`: Manages file and directory-related operations.
  - `icon_manager.sh`: Manages icon selection and conversion.
  - `appimage_manager.sh`: Contains functions for installing and uninstalling `.AppImage` files.

## Prerequisites

- Bash
- `ffmpeg` (for icon conversion)
- Execution permissions for `.AppImage` files

## Installation

1. Clone the repository or download the files.
2. Navigate to the project directory.
3. Run the main script:

   ```bash
   bash main.sh
   ```

## Usage

When executing `main.sh`, the user will be presented with the following options:

1. **Install**: Allows the user to select an `.AppImage` file from the Downloads folder for installation. The user can choose an icon for the application or use a default icon.
2. **Remove**: Allows the user to select a shortcut for uninstallation. The shortcut, the `.AppImage` file, and the associated icon will be removed.

### Example Execution

1. **Start the Application Manager**: Run the main script.

   ```bash
   bash main.sh
   ```

2. **Select an Option**: The menu will be displayed, allowing you to choose between installing or removing an `.AppImage` file.

   ```
   Do you want to install or remove an .AppImage file?
   1) Install
   2) Remove
   ```

3. **Install an Application**: If you choose "Install," the script will list the available `.AppImage` files in the Downloads folder.

   ```
   Select the .AppImage file to install:
   1) application1.AppImage
   2) application2.AppImage
   ```

4. **Choose a File**: Select the number corresponding to the file you want to install.

5. **Shortcut Name**: The script will prompt you to enter a name for the shortcut or press Enter to use the default name.

   ```
   Enter the shortcut name (press Enter to use 'application1'): 
   ```

6. **Select an Icon**: The script will ask if you want to select an icon from the Downloads folder.

   ```
   Do you want to select an icon from the Downloads folder? (y/n):
   ```

7. **Confirmation**: After installation, a confirmation message will be displayed.

   ```
   Shortcut for application1 created at ~/.local/share/applications/application1.desktop
   ```

8. **Remove an Application**: If you choose "Remove," the script will list the existing shortcuts.

   ```
   Select the .AppImage application shortcut to uninstall:
   1) application1.desktop
   2) application2.desktop
   ```

9. **Uninstallation Confirmation**: After selecting the shortcut, a confirmation message will be displayed.

   ```
   Application application1 successfully uninstalled.
   ```

10. **Cache Update**: After installation or removal, you may be advised to manually update the cache.

   ```
   Automatic cache update disabled to avoid freezing. Manually update using the commands below, if necessary:
   gtk-update-icon-cache
   update-desktop-database
   ```

## Directory Structure

The script automatically creates the following directories if they do not exist:

- `~/.local/share/applications`: To store application shortcuts.
- `~/.local/bin`: To store `.AppImage` files.
- `~/.local/share/icons/hicolor/128x128/apps`: To store application icons.

## Cache Update

After installing or removing applications, the user is advised to manually update the icon cache and the desktop database using the following commands:

```bash
gtk-update-icon-cache
update-desktop-database
```

## Contribution

Contributions are welcome! Feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.
