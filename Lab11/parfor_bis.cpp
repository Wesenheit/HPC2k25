// Illustrates parallel for in TBB.
//
// HPC course, MIM UW
// Krzysztof Rzadca, LGPL

#include "tbb/tbb.h"
#include <iostream>
#include <math.h>

bool is_prime(long num) {
    long sqrt_num = (long) sqrt(num);
    for (long div = 2; div <= sqrt_num; ++div) {
        if ((num % div) == 0)
            return false;
    }
    return true;
}


int main() {
    const int num_threads = 4;  // Set desired number of threads
    tbb::global_control control(tbb::global_control::max_allowed_parallelism, num_threads);
    tbb::parallel_for(  // execute a parallel for
        tbb::blocked_range<long>(1, 500),  // pon a range from 1 to limit
        [](const tbb::blocked_range<long>& r) { // inside a loop, for a partial range r,
            // run this lambda
            std::cout << "Processing range: " << r.begin() << " to " << r.end() << std::endl;
        }
        );
}
