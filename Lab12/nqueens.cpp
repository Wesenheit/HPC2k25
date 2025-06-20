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
#include <ranges>

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


void parallel_recursive_solve_count(Board& partial_board, int col, tbb::enumerable_thread_specific<int>& counter) {
    // std::cout << "rec solve col " << col << std::endl;
    // pretty_print(b_partial);

    int b_size = partial_board.size();
    if (col == b_size) {
        (counter.local())++;
    }
    else {
        tbb::parallel_for_each(std::views::iota(0,b_size),
            [&](int row) {
                Board tested_row_board = partial_board;
                tested_row_board[col] = row;
                if (check_col(tested_row_board, col)) {
                    parallel_recursive_solve_count(tested_row_board, col + 1, counter);
                }
        });
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

    tbb::enumerable_thread_specific<int> counters;
    tbb::tick_count start_time = tbb::tick_count::now();
    parallel_recursive_solve_count(board, 0, counters);
    int final = 0;
    for (auto val:counters)
    {
        final += val;
    }
    tbb::tick_count end_time = tbb::tick_count::now();
    double par_time = (end_time-start_time).seconds();
    std::cout << "par time: " << par_time << "[s]" <<std::endl;

    std::cout << "solution count: "<<final<<std::endl;

    return 0;
}
