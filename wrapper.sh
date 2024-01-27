#!/bin/bash

SCRIPT_DIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")")"

# defaults
CONFIGURE_PLATFORM_XCB="true"
CONFIGURE_AUTO_SCALE="true"

# load user config
[[ -f "${SCRIPT_DIR}/010editorrc" ]] && . "${SCRIPT_DIR}/010editorrc"
[[ -f "${HOME}/.config/010editorrc" ]] && . "${HOME}/.config/010editorrc"

if [[ "${CONFIGURE_PLATFORM_XCB}" != "false" ]]; then
    export QT_QPA_PLATFORM=xcb
fi

if [[ "${CONFIGURE_AUTO_SCALE}" != "false" ]]; then
    export QT_AUTO_SCREEN_SCALE_FACTOR=1
fi

exec "/opt/010editor/010editor_orig" "$@"
