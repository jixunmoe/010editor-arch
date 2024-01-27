#!/bin/bash

# install to /opt/010editor-patch
SOURCE_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"
APP_DIR="/opt/010editor"
INSTALL_DIR="/opt/010editor-patch"
FILE_LISTING=(update.sh wrapper.sh uninstall.sh)

# copy files
install -d -m 755 "${INSTALL_DIR}" || {
    echo "ERROR: Could not create installation directory"
    echo "       Are you root?"
    exit 1
}
for file in "${FILE_LISTING[@]}"; do
    echo "Installing ${file}..."
    cp -a "${SOURCE_DIR}/${file}" "${INSTALL_DIR}/"
done

if [[ ! -L "${APP_DIR}/010editor" ]]; then
    echo "Backup existing 010editor binary..."
    mv "${APP_DIR}/010editor" "${APP_DIR}/010editor_orig"
else
    echo "WARN: 010editor binary is already a symlink, skipping backup"
fi

echo "Connect wrapper to our wrapper script..."
ln -sf "${INSTALL_DIR}/wrapper.sh" "${APP_DIR}/010editor"

echo "Installing pacman hook..."
cat >/etc/pacman.d/hooks/010editor-jixun-patch.hook <<EOF
[Trigger]
Type = Package
Operation = Upgrade
Target = 010editor

[Action]
Description = Patching 010editor to setup qt environment variables...
When = PostTransaction
Exec = "${INSTALL_DIR}/update.sh"
EOF

echo "all done!"
