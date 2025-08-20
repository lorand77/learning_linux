#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <N (in MB)>\n", argv[0]);
        return 1;
    }

    int N = atoi(argv[1]);
    if (N <= 0) {
        fprintf(stderr, "Invalid memory size. Please enter a positive integer.\n");
        return 1;
    }

    size_t size = (size_t)N * 1024 * 1024; // Convert MB to bytes
    char *buffer = (char *)malloc(size);
    if (buffer == NULL) {
        fprintf(stderr, "Memory allocation failed.\n");
        return 1;
    }

    // Touch every page to actually allocate physical memory
    memset(buffer, 0, size);

    printf("Allocated %d MB of RAM. Sleeping indefinitely...\n", N);

    // Sleep indefinitely
    while (1) {
        sleep(1);
    }

    // Free memory (unreachable, but good practice)
    free(buffer);
    return 0;
}

