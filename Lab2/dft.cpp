#include <complex>
#include <fstream>
#include <iostream>
#include <math.h>
#include <omp.h>
#include <stdio.h>
#include <string>
#include <vector>

#include "utils/bmp.cpp"

#define SIMD_SIZE 4

#include "omp_speed.hpp"

void compress(const uint32_t valuesCount, const int accuracy,
              const uint8_t *values, float *Xreal, float *Ximag) {
  // values, Xreal and Ximag are values describing single color of single row of
  // bitmap. This function will be called once per each (color, row)
  // combination.
  for (int k = 0; k < accuracy; k++) {
    for (int i = 0; i < valuesCount; i++) {
      float theta = (2 * M_PI * k * i) / valuesCount;
      Xreal[k] += values[i] * cos(theta);
      Ximag[k] -= values[i] * sin(theta);
    }
  }
}

void decompress(const uint32_t valuesCount, const int accuracy, uint8_t *values,
                const float *Xreal, const float *Ximag) {
  // values, Xreal and Ximag are values describing single color of single row of
  // bitmap. This function will be called once per each (color, row)
  // combination.
  std::vector<float> rawValues(valuesCount, 0);

  for (int i = 0; i < valuesCount; i++) {
    for (int k = 0; k < accuracy; k++) {
      float theta = (2 * M_PI * k * i) / valuesCount;
      rawValues[i] += Xreal[k] * cos(theta) + Ximag[k] * sin(theta);
    }
    values[i] = rawValues[i] / valuesCount;
  }
}

int main() {
  BMP bmp;
  bmp.read("example.bmp");

  size_t accuracy = 64; // We are interested in values from range [8; 64]

  // bmp.{compress,decompress} will run provided function on every bitmap row
  // and color.
  float compressTime = bmp.compress(compress, accuracy);
  float decompressTime = bmp.decompress(decompress);

  printf("Compress time: %.2lfs\nDecompress time: %.2lfs\nTotal: %.2lfs\n",
         compressTime, decompressTime, compressTime + decompressTime);

  bmp.write("example_result.bmp");

  printf("using %i threads\n", omp_get_max_threads());

  bmp.read("example.bmp");

  float compressTimePar = bmp.compress(compressPar, accuracy);
  float decompressTimePar = bmp.decompress(decompressPar);

  printf("(Naive)\n Compress time: %.2lfs\nDecompress time: %.2lfs\nTotal: "
         "%.2lfs\n",
         compressTimePar, decompressTimePar,
         compressTimePar + decompressTimePar);
  bmp.write("example_result_para.bmp");

  bmp.read("example.bmp");

  float compressTimeParFast = bmp.compress(compressParFast, accuracy);
  float decompressTimeParFast = bmp.decompress(decompressParFast);

  printf("(Fast)\n Compress time: %.2lfs\nDecompress time: %.2lfs\nTotal: "
         "%.2lfs\n",
         compressTimeParFast, decompressTimeParFast,
         compressTimeParFast + decompressTimeParFast);

  bmp.write("example_result_para_fast.bmp");

  return 0;
}
