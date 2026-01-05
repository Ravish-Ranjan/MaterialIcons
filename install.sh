#!/usr/bin/env bash
set -e

THEME_NAME="MaterialIcons"
ICON_SRC_DIR="$(pwd)/$THEME_NAME"
MIME_SRC_FILE="$(pwd)/mime/custom-mime.xml"

ICON_DEST_BASE="$HOME/.icons"
ICON_DEST_DIR="$ICON_DEST_BASE/$THEME_NAME"
MIME_DEST_DIR="$HOME/.local/share/mime/packages"

echo "> Installing $THEME_NAME icon pack"

# Validate source files
[[ -d "$ICON_SRC_DIR" ]] || { echo -e "\e[31mIcon directory not found\e[0m"; exit 1; }
[[ -f "$MIME_SRC_FILE" ]] || { echo -e "\e[31mMIME file not found\e[0m"; exit 1; }

# Create target directories
mkdir -p "$ICON_DEST_BASE"
mkdir -p "$MIME_DEST_DIR"

# Copy icon pack
echo "> Copying icon theme to ~/.icons"
rm -rf "$ICON_DEST_DIR"
cp -r "$ICON_SRC_DIR" "$ICON_DEST_BASE/"

# Copy MIME definition
echo "> Installing custom MIME types"
cp "$MIME_SRC_FILE" "$MIME_DEST_DIR/"

# Update MIME database
echo "> Updating MIME database"
update-mime-database "$HOME/.local/share/mime"

# Update GTK icon cache
echo "> Updating icon cache"
gtk-update-icon-cache -f -t "$ICON_DEST_DIR"

# Apply icon theme (GTK desktops)
if command -v gsettings >/dev/null; then
  echo "> Applying icon theme"
  gsettings set org.gnome.desktop.interface icon-theme "$THEME_NAME" || true
fi

echo -e "\e[32mInstallation complete\e[0m"
