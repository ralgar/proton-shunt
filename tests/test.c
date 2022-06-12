#include <stdio.h>
#include <string.h>

int main(int argc, const char **argv) {

    char *arg[5];

    arg[1] = "arg1";
    arg[2] = "--arg2";
    arg[3] = "https://arg3.tld/api/v1/endpoint?user_id=1234&file=5678";
    arg[4] = "arg 4";

    // Make sure # of args is correct
    if (argc != 5) {
        fprintf(stderr, "ERROR: Did not receive expected 4 (or 5 total) arguments\n");
        return 1;
    }

    // Loop through and compare args
    for (int i = 0; i < argc - 1; i++) {
        if (strcmp(argv[i+1], arg[i+1]) != 0) {
            fprintf(stderr, "Test failed on arg%i\n", i+1);
            fprintf(stderr, "Expected: %s    Got: %s\n", arg[i+1], argv[i+1]);
            return 1;
        }
    }

    fprintf(stdout, "Test successful!\n");
    return 0;
}
