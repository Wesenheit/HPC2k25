#include <mpi.h>
#include <stdio.h>

int main() {
  MPI_Init(NULL, NULL);
  int N, rank;
  static int size = 1000;
  MPI_Comm_size(MPI_COMM_WORLD, &N);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  int send[size];
  int recive[size];
  double startTime;
  double endTime;
  MPI_Status status;
  startTime = MPI_Wtime();

  if (rank == 0)
    MPI_Send(&send, size, MPI_INT, 1, 0, MPI_COMM_WORLD);
  if (rank == 1)
    MPI_Recv(&recive, size, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);

  endTime = MPI_Wtime();
  if (rank == 0)
    printf("%f ms\n", 1000 * (endTime - startTime));
  MPI_Finalize();
  return 0;
}
