# 010editor - Jixun's patch for running on 200% scaled Wayland

Help smooth out the installation of `010editor` on Wayland.

It will backup `/opt/010editor/010editor` binary to `/opt/010editor/010editor_orig`,
then symlink `/opt/010editor-patch/wrapper.sh` to `/opt/010editor/010editor`.

## Prerequisites

- System with `bash` installed
- root access (modify `010editor` and persistent across upgrades)
- Install `010editor` to `/opt/010editor`, e.g. via [AUR `010editor`](https://aur.archlinux.org/packages/010editor).

## Installation

```sh
git clone https://github.com/jixunmoe/010editor-arch.git
cd 010editor-arch
sudo ./install.sh
```

## Uninstall

Invoke uninstall script from the installation directory:

```sh
sudo /opt/010editor-patch/uninstall.sh
```

## Configuration

You can define both user config and installation config, which had this priority:

- Default fallback (lowest priority)
- `/opt/010editor-patch/010editorrc`
- `~/.config/010editorrc` (highest priority)

Default values are:

```sh
CONFIGURE_PLATFORM_XCB=true
CONFIGURE_AUTO_SCALE=true
```

To disable any of those features, set it to `false`.
