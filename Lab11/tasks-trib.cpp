// Illustrates tasks and task groups in TBB.
//
// adopted from https://www.threadingbuildingblocks.org/tutorial-intel-tbb-task-based-programming
// HPC course, MIM UW
// Krzysztof Rzadca, LGPL

#include <iostream>
#include "tbb/tbb.h"
#include "tbb/task_group.h"


// yes, there are better ways to compute Fibonacci numbers
long seq_fib(long n) {
    if (n < 3) {
        return n;
    }
    else {
        long x, y,z;
        x = seq_fib(n - 1);
        y = seq_fib(n - 2);
        z = seq_fib(n - 3);
        return x + y + z;
    }
}


int par_fib(long n) {
    if (n < 3) {
        return n;
    }
    else {
        long x, y,z;
        tbb::task_group g;
        g.run([&]{x = par_fib(n - 1);});  // spawn a task
        g.run([&]{y = par_fib(n - 2);});  // spawn another task
        g.run([&]{z = par_fib(n - 3);});  // spawn another task

        g.wait();  // wait for both tasks to complete
        return x + y + z;
    }
}


int main() {
    const long n = 30;
    tbb::tick_count seq_start_time = tbb::tick_count::now();
    long s_fib = seq_fib(n);
    tbb::tick_count seq_end_time = tbb::tick_count::now();
    double seq_time = (seq_end_time-seq_start_time).seconds();
    std::cout << "fib " << s_fib << std::endl;
    std::cout << "seq time " << seq_time << "[s]" <<std::endl;

    tbb::tick_count par_start_time = tbb::tick_count::now();
    long p_fib = par_fib(n);
    tbb::tick_count par_end_time = tbb::tick_count::now();
    double par_time = (par_end_time-par_start_time).seconds();
    std::cout << "p_fib " << p_fib << std::endl;
    std::cout << "par time " << par_time << "[s]" <<std::endl;
}
