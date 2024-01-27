#!/bin/bash

INSTALL_DIR="/opt/010editor-patch"
APP_DIR="/opt/010editor"

# Restore original 010editor binary first, if possible
if [[ -f "${APP_DIR}/010editor_orig" ]]; then
    echo "Restoring 010editor binary..."
    rm -f "${APP_DIR}/010editor"
    mv "${APP_DIR}/010editor_orig" "${APP_DIR}/010editor"
else
    echo "WARN: 010editor binary not found, skipping restore"
fi

echo "Removing 010editor patch files..."
rm -rf "${INSTALL_DIR}"
rm -f /etc/pacman.d/hooks/010editor-jixun-patch.hook

echo "All done!"
