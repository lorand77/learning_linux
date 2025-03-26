#include <stdio.h>
#include <stdlib.h>
#include <time.h>

double now_seconds() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return ts.tv_sec + ts.tv_nsec / 1e9;
}

int main(int argc, char *argv[]) {
    if (argc != 3) {
        printf("Usage: %s <N in megabytes> <M repetitions>\n", argv[0]);
        return 1;
    }

    size_t N_MB = atol(argv[1]);
    int M = atoi(argv[2]);
    if (N_MB == 0 || M <= 0) {
        printf("Invalid arguments.\n");
        return 1;
    }

    size_t num_elements = (N_MB * 1024 * 1024) / sizeof(double);
    double *array = (double *)malloc(num_elements * sizeof(double));
    if (!array) {
        perror("Memory allocation failed");
        return 1;
    }

    for (size_t i = 0; i < num_elements; ++i)
        array[i] = 7.0;

    double total_sum = 0.0;
    double start = now_seconds();

    for (int repeat = 0; repeat < M; ++repeat) {
        double sum = 0.0;
        for (size_t i = 0; i < num_elements; ++i) {
            sum += array[i];
        }
        total_sum += sum;
    }

    double end = now_seconds();
    double elapsed = end - start;
    double total_MB = N_MB * M;
    double speed = total_MB / elapsed;

    printf("Total sum: %.2f\n", total_sum);
    printf("Average speed (single-threaded): %.2f MB/s\n", speed);

    free(array);
    return 0;
}

