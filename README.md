# Proton Shunt
[![Latest Release](https://img.shields.io/github/v/release/ralgar/proton-shunt?style=for-the-badge&logo=semver&logoColor=white)](https://github.com/ralgar/proton-shunt/releases)
[![Build Status](https://img.shields.io/github/checks-status/ralgar/proton-shunt/master?style=for-the-badge&logo=gitlab&label=Build)](https://github.com/ralgar/proton-shunt/tree/master)
[![Software License](https://img.shields.io/github/license/ralgar/proton-shunt?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0.html)
[![GitHub Stars](https://img.shields.io/github/stars/ralgar/proton-shunt?style=for-the-badge&logo=github&logoColor=white&color=gold)](https://github.com/ralgar/proton-shunt)


## Overview
This project allows for launching alternate executables under Proton (Steam Play for Linux).

### Features
- [x] Launch an alternate executable any time the game is started (ex. a mod manager).
- [x] Flawless, like-native experience. No ugly flickering, or permanent console windows.
- [x] Simple configuration file to adjust the path of the alternate executable.
- [x] Properly preserves and passes through all arguments supplied via Steam.
- [x] Helper feature for programmatically initializing Proton prefixes
- [ ] Launch multiple executables, and configure arguments for each (coming soon).


## Usage

### Basic Usage
1. Grab the latest stable release [here](https://github.com/ralgar/proton-shunt/releases), or build it yourself following the [instructions](#compiling) below..
2. Replace your game's default executable with `proton-shunt.exe` (don't forget to back up the original file).
3. Edit the path in `proton-shunt.cfg` to point to another executable, and place it in the same directory as `proton-shunt.exe`.

### Prefix Initialization Helper
This is a helper feature designed for developers. It could be used to assist with programmatically installing a custom Proton version for the user, or simply making sure a prefix is initialized before calling `protontricks`.

When Proton Shunt is called with the `--init-prefix` argument, it checks for the existence of a lock file `proton-shunt.lock`, deletes it, and exits. This allows for a script to monitor for the existence of the lock file to determine the state of the process.

**Example:**
```sh
# Extract custom Proton
tar -C "$steam_root/compatibilitytools.d" -xzf "$downloads/GE-Proton7-20.tar.gz"

# Move the existing prefix to a backup location
if [[ -d "$compat_dir/489830" ]] ; then
    mv "$compat_dir/489830" "$compat_dir/489830.bak"
fi

# Create the lock file and start Proton Shunt using the Steam CLI
touch "$game_dir/proton-shunt.lock"
steam -silent -applaunch 489830 --init-prefix &>/dev/null &

while [[ -f "$game_directory/proton-shunt.lock" ]] ; do
    echo "Waiting while Steam initializes the prefix..."
    sleep 1
done

echo "Prefix initialized, continuing script..."
protontricks 489830 -q xaudio2_7=native
```


## Compiling
Compiling Proton Shunt yourself is simple.

### Prerequisites
You will need the following dependencies:
- make
- mingw-w64-gcc

### Building
Execute the following commands in your terminal:
```sh
$ git clone https://github.com/ralgar/proton-shunt
$ cd proton-shunt
$ make
```


## License

GNU General Public License v3.0 (see LICENSE or https://www.gnu.org/licenses/gpl-3.0.txt)
