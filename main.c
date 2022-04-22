// Proton Shunt - Allows launching alternate executables with Proton (Steam Play for Linux)
//
// The Proton application's executable file is replaced with proton-shunt, it then reads
//   a path from proton-shunt.cfg in the same directory, and attempts to execute the file
//   at that path, passing arguments through from Steam to the alternate executable.
//
// Copyright: (c) 2022, Ryan Algar (https://github.com/ralgar/proton-shunt)
//
// GNU General Public License v3.0 (see LICENSE or https://www.gnu.org/licenses/gpl-3.0.txt)

#define _WIN32_WINNT 0x0500
#define CONFIG_FILE "proton-shunt.cfg"
#define HIDE_CONSOLE

#include <errno.h>
#include <process.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <windows.h>


// Executes the specified command, passing through all args
int exec_shunt(const char* cmd, const char* const* argv) {

    _execv(cmd, argv);

    if (errno == 0) {
        return 0;
    } else {
        fprintf(stderr, "Failed to execute '%s' (ERRNO %i)\n", cmd, errno);
        return 1;
    }
}


// Reads first line of file, replacing newline with nullbyte
char* read_config(const char* file) {

    static char buf[1024];
    FILE* fp = fopen(file, "r");

    if (fp == NULL) {
        fprintf(stderr, "ERROR: Could not read from config file '%s'\n", file);
        return NULL;
    }

    // Read from file until first newline
    if (fgets(buf, sizeof(buf), fp) == NULL) {
        fprintf(stderr, "ERROR: Config file is empty '%s'\n", file);
        fclose(fp);
        return NULL;
    } else {
        size_t len = strlen(buf)-1;
        if (buf[len] == '\n') {
            buf[len] = '\0';
        }
    }

    fclose(fp);
    return buf;
}


int main(int argc, const char** argv) {

#ifdef HIDE_CONSOLE
    HWND hWnd = GetConsoleWindow();
    ShowWindow(hWnd, SW_HIDE);
#endif

    const char** shunt_argv = argv;
    shunt_argv[0] = read_config(CONFIG_FILE);

    if (shunt_argv[0] == NULL) {
        return 1;
    }

    if (exec_shunt(shunt_argv[0], shunt_argv) != 0) {
        return 1;
    }
}
