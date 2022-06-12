# Proton Shunt
[![Latest Release](https://img.shields.io/github/v/release/ralgar/proton-shunt?style=for-the-badge&logo=semver&logoColor=white)](https://github.com/ralgar/proton-shunt/releases)
[![Build Status](https://img.shields.io/github/checks-status/ralgar/proton-shunt/master?style=for-the-badge&logo=gitlab&label=Build)](https://github.com/ralgar/proton-shunt/tree/master)
[![Software License](https://img.shields.io/github/license/ralgar/proton-shunt?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0.html)
[![GitHub Stars](https://img.shields.io/github/stars/ralgar/proton-shunt?style=for-the-badge&logo=github&logoColor=white&color=gold)](https://github.com/ralgar/proton-shunt)


## Overview
This project allows for launching alternate executables with Proton (Steam Play for Linux).

### Features
- [x] Launch an alternate executable any time the game is started (ex. a mod manager).
- [x] Flawless, like-native experience. No ugly flickering, or permanent console windows.
- [x] Simple configuration file to adjust the path of the alternate executable.
- [x] Properly preserves and passes through all arguments supplied via Steam.
- [ ] Launch multiple executables, and configure arguments for each (coming soon).


## Usage
1. Grab the latest stable release [here](https://github.com/ralgar/proton-shunt/releases), or build it yourself following the [instructions](#compiling) below..
2. Replace your game's default executable with `proton-shunt.exe` (don't forget to back up the original file).
3. Edit the path in `proton-shunt.cfg` to point to another executable, and place it in the same directory as `proton-shunt.exe`.


## Compiling
Compiling Proton Shunt yourself is simple.

### Prerequisites
You will need the following dependencies:
- make
- mingw-w64-gcc
- mingw-w64-winpthreads

### Building
Execute the following commands in your terminal:
```sh
$ git clone https://github.com/ralgar/proton-shunt
$ cd proton-shunt
$ make
```


## License

GNU General Public License v3.0 (see LICENSE or https://www.gnu.org/licenses/gpl-3.0.txt)
