// Solves the n-quees puzzle on an n x x checkerboard.
//
// This sequential implementation is to be extended with TBB to get a
// parallel implementation.
//
// HPC course, MIM UW
// Krzysztof Rzadca, LGPL

#include "tbb/tbb.h"
#include <iostream>
#include <list>
#include <vector>
#include <cmath>

#define load 6
#define ratio 0.5

// Indexed by column. Value is the row where the queen is placed,
// or -1 if no queen.
typedef std::vector<int> Board;


void pretty_print(const Board& board) {
    for (int row = 0; row < (int) board.size(); row++) {
        for (const auto& loc : board) {
            if (loc == row)
                std::cout << "*";
            else
                std::cout << " ";
        }
        std::cout << std::endl;
    }
}


// Checks the location of queen in column 'col' against queens in cols [0, col).
bool check_col(Board& board, int col_prop) {
    int row_prop = board[col_prop];
    int col_queen = 0;
    for (auto i = board.begin();
         (i != board.end()) && (col_queen < col_prop);
         ++i, ++col_queen) {
        int row_queen = *i;
        if (row_queen == row_prop) {
            return false;
        }
        if (abs(row_prop - row_queen) == col_prop - col_queen) {
            return false;
        }
    }
    return true;
}


void initialize(Board& board, int size) {
    board.reserve(size);
    for (int col = 0; col < size; ++col)
        board.push_back(-1);
}


// Solves starting from a partially-filled board (up to column col).
void recursive_solve(Board& partial_board, int col, std::list<Board>& solutions) {
    // std::cout << "rec solve col " << col << std::endl;
    // pretty_print(b_partial);

    int b_size = partial_board.size();
    if (col == b_size) {
        solutions.push_back(partial_board);
    }
    else {
        for (int tested_row = 0; tested_row < b_size; tested_row++) {
            partial_board[col] = tested_row;
            if (check_col(partial_board, col))
                recursive_solve(partial_board, col+1, solutions);
        }
    }
}


void parallel_recursive_solve(Board& partial_board, int col, tbb::concurrent_queue<Board>& solutions,tbb::task_group &g) {
    // std::cout << "rec solve col " << col << std::endl;
    // pretty_print(b_partial);

    int b_size = partial_board.size();
    if (col == b_size) {
        solutions.push(partial_board);
    }
    else {

        for (int tested_row = 0; tested_row < b_size; tested_row++) {
            g.run([&, tested_row]() {
                Board tested_row_board = partial_board;
                tested_row_board[col] = tested_row;
                if (check_col(tested_row_board, col)) {
                    parallel_recursive_solve(tested_row_board, col + 1, solutions,g);
                }
            });
        }
    }
}
void parallel_recursive_solve(Board& partial_board, int col, tbb::concurrent_queue<Board>& sol) {
    // std::cout << "rec solve col " << col << std::endl;
    // pretty_print(b_partial);

    int b_size = partial_board.size();
    if (col == b_size) {
        sol.push(partial_board);
    }
    else {
        tbb::task_group g;
        int to_parallel = b_size * ratio;
        for (int tested_row = 0; tested_row < to_parallel; tested_row+=load) {
            g.run([&, tested_row]() {
                Board tested_row_board = partial_board;

                for (int i = 0; i < load && (tested_row + i) < to_parallel; ++i) {
                    int row = tested_row + i;
                    partial_board[col] = row;

                    tested_row_board[col] = row;
                    if (check_col(tested_row_board, col)) {
                        parallel_recursive_solve(tested_row_board, col + 1, sol);
                    }
                }
            });
        }
        Board tested_row_board = partial_board;
        for (int tested_row = to_parallel; tested_row < b_size; tested_row++) {
            tested_row_board[col] = tested_row;
            if (check_col(tested_row_board, col)) {
                parallel_recursive_solve(tested_row_board, col + 1, sol);
            }
        }
        g.wait();

    }
}

void parallel_recursive_solve_count(Board& partial_board, int col, std::atomic<int>& counter) {
    // std::cout << "rec solve col " << col << std::endl;
    // pretty_print(b_partial);

    int b_size = partial_board.size();
    if (col == b_size) {
        counter.fetch_add(1, std::memory_order_relaxed);
    }
    else {
        tbb::task_group g;
        int to_parallel = b_size*ratio;
        for (int tested_row = 0; tested_row < to_parallel; tested_row+=load) {
            g.run([&, tested_row]() {
                Board tested_row_board = partial_board;

                for (int i = 0; i < load && (tested_row + i) < to_parallel; ++i) {
                    int row = tested_row + i;
                    partial_board[col] = row;

                    tested_row_board[col] = row;
                    if (check_col(tested_row_board, col)) {
                        parallel_recursive_solve_count(tested_row_board, col + 1, counter);
                    }
                }
            });
        }
        Board tested_row_board = partial_board;
        for (int tested_row = to_parallel; tested_row < b_size; tested_row++) {
            tested_row_board[col] = tested_row;
            if (check_col(tested_row_board, col)) {
                parallel_recursive_solve_count(tested_row_board, col + 1, counter);
            }
        }
        g.wait();

    }
}

int main() {
    int default_threads = tbb::this_task_arena::max_concurrency();
    std::cout << "Default number of threads: " << default_threads << std::endl;
    const int board_size = 14;
    Board board{};
    initialize(board, board_size);
    std::list<Board> solutions{};

    tbb::tick_count seq_start_time = tbb::tick_count::now();
    recursive_solve(board, 0, solutions);
    tbb::tick_count seq_end_time = tbb::tick_count::now();
    double seq_time = (seq_end_time-seq_start_time).seconds();
    std::cout << "seq time: " << seq_time << "[s]" <<std::endl;
    std::cout << "solution count: "<<solutions.size()<<std::endl;

    tbb::concurrent_queue<Board> solutions_par;
    std::atomic<int> counter(0);
    tbb::tick_count start_time = tbb::tick_count::now();
    parallel_recursive_solve_count(board, 0, counter);

    tbb::tick_count end_time = tbb::tick_count::now();
    double par_time = (end_time-start_time).seconds();
    std::cout << "par time: " << par_time << "[s]" <<std::endl;

    std::cout << "solution count: "<<counter<<std::endl;

    tbb::tick_count start_time_q = tbb::tick_count::now();
    parallel_recursive_solve(board, 0, solutions_par);

    tbb::tick_count end_time_q = tbb::tick_count::now();
    double par_time_q = (end_time_q-start_time_q).seconds();
    std::cout << "par time (with queue): " << par_time_q << "[s]" <<std::endl;
    return 0;
}
