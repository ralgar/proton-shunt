# Proton Shunt
[![Latest Tag](https://img.shields.io/github/v/tag/ralgar/proton-shunt?style=for-the-badge&logo=semver&logoColor=white)](https://github.com/ralgar/proton-shunt/tags)
[![Software License](https://img.shields.io/github/license/ralgar/proton-shunt?style=for-the-badge&logo=gnu&logoColor=white)](https://www.gnu.org/licenses/gpl-3.0.html)
[![Github Stars](https://img.shields.io/github/stars/ralgar/proton-shunt?style=for-the-badge&logo=github&logoColor=white&color=gold)](https://github.com/ralgar/proton-shunt)


## Overview
This project allows for launching alternate executables with Proton (Steam Play for Linux).

### Features
- [x] Launch an alternate executable any time the game is started (ex. a mod manager).
- [x] Flawless, native-like experience. No flickering, or permanent console windows.
- [x] Simple configuration file to adjust the path of the alternate executable.
- [x] Correctly passes through all arguments supplied by Steam.
- [ ] Launch multiple executables, and configure arguments (coming soon).


## Usage
1. Grab the latest stable release [here](https://github.com/ralgar/proton-shunt/releases), or build it yourself following the [instructions](#compiling) below.
2. Extract the archive to your game's root directory.
3. Replace your game's default executable with `proton-shunt.exe` (don't forget to back up the original file).
4. Edit the path in `proton-shunt.cfg` to point to another executable.


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
