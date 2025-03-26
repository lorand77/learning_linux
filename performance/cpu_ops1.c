#include <stdio.h>
#include <math.h>
#include <time.h>

#define NUM_OPERATIONS 1000000000UL  // 1 billion

double time_diff_in_seconds(struct timespec start, struct timespec end) {
    return (end.tv_sec - start.tv_sec) + (end.tv_nsec - start.tv_nsec) / 1e9;
}

int main() {
    struct timespec start, end;

    // Use volatile to prevent compiler optimizations
    volatile double a = 3.0, b = 2.0;
    volatile double f_result;

    // Floating-point Addition
    clock_gettime(CLOCK_MONOTONIC, &start);
    for (unsigned long i = 0; i < NUM_OPERATIONS; ++i) {
        f_result = a + b;
    }
    clock_gettime(CLOCK_MONOTONIC, &end);
    printf("Float Addition:      %.2f million ops/sec (%.3f seconds)\n",
           NUM_OPERATIONS / time_diff_in_seconds(start, end) / 1e6,
           time_diff_in_seconds(start, end));

    return 0;
}

