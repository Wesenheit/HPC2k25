#include <mpi.h>
#include <stdio.h>

int main() {
  MPI_Init(NULL, NULL);
  int N, rank;

  MPI_Comm_size(MPI_COMM_WORLD, &N);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  int send;
  int recive;
  double startTime;
  double endTime;
  MPI_Status status;
  startTime = MPI_Wtime();
  if (rank == 0) {
    printf("Total: %i\n", N);
    send = 1;
    MPI_Send(&send, 1, MPI_FLOAT, rank + 1, 0, MPI_COMM_WORLD);
    MPI_Recv(&recive, 1, MPI_FLOAT, N - 1, 0, MPI_COMM_WORLD, &status);
    endTime = MPI_Wtime();
    printf("%i \n", recive);
    printf("Took %f ms\n", 1000 * (endTime - startTime));
  } else {
    MPI_Recv(&recive, 1, MPI_FLOAT, rank - 1, 0, MPI_COMM_WORLD, &status);
    send = recive * rank;
    MPI_Send(&send, 1, MPI_FLOAT, (rank + 1) % N, 0, MPI_COMM_WORLD);
  }

  MPI_Finalize();
  return 0;
}
