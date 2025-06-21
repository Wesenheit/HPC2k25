#include <math.h>
#include <omp.h>
#include <vector>

void compressPar(const uint32_t valuesCount, const int accuracy,
                 const uint8_t *values, float *Xreal, float *Ximag) {

#pragma omp parallel for collapse(2) schedule(static)
  for (int k = 0; k < accuracy; k++) {
    for (int i = 0; i < valuesCount; i++) {
      float theta = (2 * M_PI * k * i) / valuesCount;

      float val1 = values[i] * cos(theta);
      float val2 = values[i] * sin(theta);
#pragma omp atomic update
      Xreal[k] += val1;
#pragma omp atomic update
      Ximag[k] -= val2;
    }
  }
}

void decompressPar(const uint32_t valuesCount, const int accuracy,
                   uint8_t *values, const float *Xreal, const float *Ximag) {
  std::vector<float> rawValues(valuesCount, 0);

#pragma omp parallel for collapse(2) schedule(static)
  for (int i = 0; i < valuesCount; i++) {
    for (int k = 0; k < accuracy; k++) {
      float theta = (2 * M_PI * k * i) / valuesCount;
#pragma omp atomic update
      rawValues[i] += Xreal[k] * cos(theta) + Ximag[k] * sin(theta);
    }

    values[i] = rawValues[i] / valuesCount;
  }
}

void compressParFast(const uint32_t valuesCount, const int accuracy,
                     const uint8_t *values, float *Xreal, float *Ximag) {

  std::vector<float> cosinus(valuesCount, 0);
  std::vector<float> sinus(valuesCount, 0);

  std::vector<float> cosinus_back(valuesCount, 0);
  std::vector<float> sinus_back(valuesCount, 0);

#pragma omp parallel shared(cosinus, sinus, cosinus_back, sinus_back)
  {
    for (int k = 0; k < accuracy; k++) {

#pragma omp for schedule(static)
      for (int i = 0; i < valuesCount; i++) {
        float theta = (2 * M_PI * k * i) / valuesCount;
        cosinus[i] = cos(theta);
        sinus[i] = sin(theta);
      }

#pragma omp for schedule(static)
      for (int i = 0; i < valuesCount; i += SIMD_SIZE) {
#pragma omp simd
        for (int idx = 0; idx < SIMD_SIZE; idx++) {
          cosinus_back[i + idx] = cosinus[i + idx];
          sinus_back[i + idx] = sinus[i + idx];
        }
      }

#pragma omp master
      {
#pragma omp simd
        for (int i = 0; i < valuesCount; i++) {
          Xreal[k] += values[i] * cosinus_back[i];
          Ximag[k] -= values[i] * sinus_back[i];
        }
      }
    }
  }
}

void decompressParFast(const uint32_t valuesCount, const int accuracy,
                       uint8_t *values, const float *Xreal,
                       const float *Ximag) {
  std::vector<float> rawValues(valuesCount, 0);

  std::vector<float> cosinus(valuesCount, 0);
  std::vector<float> sinus(valuesCount, 0);

  std::vector<float> cosinus_back(valuesCount, 0);
  std::vector<float> sinus_back(valuesCount, 0);

#pragma omp parallel shared(cosinus, sinus, cosinus_back, sinus_back, rawValues)
  {
    for (int k = 0; k < accuracy; k++) {

#pragma omp for
      for (int i = 0; i < valuesCount; i++) {
        float theta = (2 * M_PI * k * i) / valuesCount;
        cosinus[i] = cos(theta);
        sinus[i] = sin(theta);
      }

#pragma omp for schedule(static)
      for (int i = 0; i < valuesCount; i += SIMD_SIZE) {
#pragma omp simd
        for (int idx = 0; idx < SIMD_SIZE; idx++) {
          cosinus_back[i + idx] = cosinus[i + idx];
          sinus_back[i + idx] = sinus[i + idx];
        }
      }

#pragma omp master
      {
#pragma omp simd
        for (int i = 0; i < valuesCount; i++) {
          rawValues[i] += Xreal[k] * cosinus_back[i] + Ximag[k] * sinus_back[i];
        }
      }
    }
  }
#pragma omp simd
  for (int i = 0; i < valuesCount; i++) {
    values[i] = rawValues[i] / valuesCount;
  }
}
