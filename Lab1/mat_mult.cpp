#include <assert.h>
#include <iostream>
#include <omp.h>

#define SIZE 500

using Row = int *;
using Matrix = Row *;

Matrix generateMatrix(int size, bool empty = false) {
  Matrix result;
  result = new Row[size];

  for (int i = 0; i < size; i++) {
    result[i] = new int[size];
    for (int j = 0; j < size; j++) {
      result[i][j] = empty ? 0 : rand() % 100;
    }
  }

  return result;
}

Matrix matrixMult(Matrix first, Matrix second, int size) {
  Matrix result = generateMatrix(size, true);
  double startTime = omp_get_wtime();

  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      for (int k = 0; k < size; k++) {
        result[i][j] += first[i][k] * second[k][j];
      }
    }
  }

  double endTime = omp_get_wtime();
  std::cout << "Sequential execution time: " << endTime - startTime
            << std::endl;
  std::cout << "Parallel expected execution time (ideal): "
            << (endTime - startTime) / omp_get_max_threads() << std::endl;
  return result;
}

Matrix matrixMultParallel(Matrix first, Matrix second, int size) {
  Matrix result = generateMatrix(size, true);
  double startTime = omp_get_wtime();

#pragma omp parallel for schedule(static)
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      for (int k = 0; k < size; k++) {
        result[i][j] += first[i][k] * second[k][j];
      }
    }
  }

  double endTime = omp_get_wtime();
  std::cout << "Parallel execution time: " << endTime - startTime << std::endl;

  return result;
}

void check(Matrix first, Matrix second, int size) {
  for (int i = 0; i < size; i++) {
    for (int j = 0; j < size; j++) {
      assert(first[i][j] == second[i][j]);
    }
  }
}

int main(int argc, char *argv[]) {
  auto first = generateMatrix(SIZE);
  auto second = generateMatrix(SIZE);
  auto sequentialResult = matrixMult(first, second, SIZE);
  auto parallelResult = matrixMultParallel(first, second, SIZE);
  check(sequentialResult, parallelResult, SIZE);
  return 0;
}
