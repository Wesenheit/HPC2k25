#include <time.h>
#include <stdio.h>

#define RADIUS        16
#define NUM_ELEMENTS  262144 

static void handleError(cudaError_t err, const char *file, int line ) {
  if (err != cudaSuccess) {
    printf("%s in %s at line %d\n", cudaGetErrorString(err), file, line);
    exit(EXIT_FAILURE);
  }
}
#define cudaCheck( err ) (handleError(err, __FILE__, __LINE__ ))

__global__ void stencil_1d(int *in, int *out) {
    int i = threadIdx.x + blockIdx.x * blockDim.x; 

    if (i > RADIUS && i < NUM_ELEMENTS - RADIUS)
    {
        for (int idx = -RADIUS; idx <= RADIUS;idx++)
        {
            out[i] += in[i+idx];
        }
    }
}

void cpu_stencil_1d(int *in, int *out) {

    for (int i = RADIUS; i < NUM_ELEMENTS - RADIUS; i++)
    {
        for (int idx = -RADIUS; idx <= RADIUS;idx++)
        {
            out[i] += in[i+idx];
        }
        
    }
}

int main() {
    int *in,*out;
    int *in_gpu,*out_gpu;
    int *in_prim,*out_prim;
    in = new int[NUM_ELEMENTS];
    out = new int[NUM_ELEMENTS];
    in_prim = new int[NUM_ELEMENTS];
    out_prim = new int[NUM_ELEMENTS];
    
    cudaCheck(cudaMalloc(&in_gpu,sizeof(int)*NUM_ELEMENTS));
    cudaCheck(cudaMalloc(&out_gpu,sizeof(int)*NUM_ELEMENTS));

    cudaEvent_t start, stop;
    cudaEventCreate(&start);
    cudaEventCreate(&stop);
   


    // time 1
    cudaEventRecord( start, 0 );
    
    cudaCheck(cudaMemcpy(in,in_gpu,sizeof(int)*NUM_ELEMENTS,cudaMemcpyDeviceToHost));
    cudaCheck(cudaMemcpy(out,out_gpu,sizeof(int)*NUM_ELEMENTS,cudaMemcpyDeviceToHost));
    
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    
    float elapsedTime;
    cudaEventElapsedTime( &elapsedTime, start, stop);
    printf("GPU transfer time (in):  %3.4f ms\n", elapsedTime);

    const int thread_num = 256;
    dim3 thread(thread_num);
    dim3 block(NUM_ELEMENTS/thread_num);
    
    //Warmup
    
    cudaEventRecord( start, 0 );
    stencil_1d<<<block,thread>>>(in_gpu,out_gpu);
    cudaCheck(cudaPeekAtLastError());
  
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    cudaEventElapsedTime( &elapsedTime, start, stop);
    printf("GPU execution time:  %3.4f ms\n", elapsedTime);
    
    cudaEventRecord( start, 0 );
    
    cudaCheck(cudaMemcpy(in_gpu,in_prim,sizeof(int)*NUM_ELEMENTS,cudaMemcpyHostToDevice));
    cudaCheck(cudaMemcpy(out_gpu,out_prim,sizeof(int)*NUM_ELEMENTS,cudaMemcpyHostToDevice));
    
    cudaEventRecord(stop, 0);
    cudaEventSynchronize(stop);
    cudaEventElapsedTime( &elapsedTime, start, stop);
    printf("GPU transfer time (back):  %3.4f ms\n", elapsedTime);
    
    cudaEventDestroy(start);
    cudaEventDestroy(stop);


    struct timespec cpu_start, cpu_stop;
    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &cpu_start);

    cpu_stencil_1d(in, out);

    clock_gettime(CLOCK_PROCESS_CPUTIME_ID, &cpu_stop);
    double result = (cpu_stop.tv_sec - cpu_start.tv_sec) * 1e3 + (cpu_stop.tv_nsec - cpu_start.tv_nsec) / 1e6;
    printf( "CPU execution time:  %3.4f ms\n", result);
    delete[] out;
    delete[] in;
    delete[] out_prim;
    delete[] in_prim;
    cudaCheck(cudaFree(in_gpu));
    cudaCheck(cudaFree(out_gpu));
    return 0;
}


