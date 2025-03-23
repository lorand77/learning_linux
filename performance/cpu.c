#include <stdio.h>
#include <math.h>

int main() {
    volatile double result;
    while (1) {
        // Keep calculating sqrt(2) to keep the CPU busy
        result = sqrt(2.0);
    }
    return 0;
}
