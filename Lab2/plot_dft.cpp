#include "H5Cpp.h"
#include "utils/bmp.cpp"
#include <complex>
#include <fstream>
#include <iostream>
#include <math.h>
#include <omp.h>
#include <stdio.h>
#include <string>
#include <vector>
using namespace H5;
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

  const int N = 7;
  size_t accuracy = 32; // We are interested in values from range [8; 64]
  int sizes[N] = {1, 2, 4, 6, 8, 10, 12};
  const int tries = 5;
  float naive[N][2];
  float efficient[N][2];
  float single_compress = 0;
  float single_decompress = 0;
  const std::string FileName("dft.h5");
  const std::string DatasetName_size("sizes");
  const std::string DatasetName_target("target");
  const std::string DatasetName_1("naive");
  const std::string DatasetName_2("efficient");
  omp_set_num_threads(1);

  for (int i = 0; i < tries; i++) {
    bmp.read("example.bmp");
    float compressTime = bmp.compress(compress, accuracy);
    float decompressTime = bmp.decompress(decompress);
    single_compress += compressTime / tries;
    single_decompress += decompressTime / tries;
  }

  bmp.write("example_result.bmp");

  for (int i = 0; i < N; i++) {
    printf("using %i proc\n", sizes[i]);
    omp_set_num_threads(sizes[i]);
    float naive_compress = 0;
    float naive_decompress = 0;
    float efficient_compress = 0;
    float efficient_decompress = 0;

    for (int j = 0; j < tries; j++) {
      bmp.read("example.bmp");
      float compressTimePar = bmp.compress(compressPar, accuracy);
      float decompressTimePar = bmp.decompress(decompressPar);
      bmp.write("example_result_para.bmp");
      bmp.read("example.bmp");
      float compressTimeParFast = bmp.compress(compressParFast, accuracy);
      float decompressTimeParFast = bmp.decompress(decompressParFast);
      bmp.write("example_result_para_fast.bmp");
      naive_compress += compressTimePar / tries;
      naive_decompress += decompressTimePar / tries;
      efficient_compress += compressTimeParFast / tries;
      efficient_decompress += decompressTimeParFast / tries;
    }
    naive[i][0] = naive_compress;
    naive[i][1] = naive_decompress;
    efficient[i][0] = efficient_compress;
    efficient[i][1] = efficient_decompress;
  }
  float target[2] = {single_compress, single_decompress};
  hsize_t dims_size[1] = {N};
  hsize_t dims_target[1] = {2};
  DataSpace dataspacesize(1, dims_size);
  DataSpace dataspacetarget(1, dims_target);
  hsize_t dims[2] = {N, 2};
  DataSpace dataspace1(2, dims);
  DataSpace dataspace2(2, dims);
  H5File file(FileName, H5F_ACC_TRUNC);
  DataSet dataset_size =
      file.createDataSet(DatasetName_size, PredType::NATIVE_INT, dataspacesize);
  DataSet dataset_1 =
      file.createDataSet(DatasetName_1, PredType::NATIVE_FLOAT, dataspace1);
  DataSet dataset_2 =
      file.createDataSet(DatasetName_2, PredType::NATIVE_FLOAT, dataspace2);
  DataSet dataset_target = file.createDataSet(
      DatasetName_target, PredType::NATIVE_FLOAT, dataspacetarget);
  dataset_size.write(sizes, PredType::NATIVE_INT);
  dataset_1.write(naive, PredType::NATIVE_FLOAT);
  dataset_2.write(efficient, PredType::NATIVE_FLOAT);
  dataset_target.write(efficient, PredType::NATIVE_FLOAT);

  return 0;
}
