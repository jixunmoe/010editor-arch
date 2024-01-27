#!/bin/sh

# This file is to be called when upgrading 010editor.

INSTALL_DIR="/opt/010editor-patch"
APP_DIR="/opt/010editor"

mv "${APP_DIR}/010editor" "${APP_DIR}/010editor_orig"
ln -sf "${INSTALL_DIR}/wrapper.sh" "${APP_DIR}/010editor"
