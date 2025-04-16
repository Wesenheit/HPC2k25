#! /bin/bash -l
#SBATCH -J MPI
#SBATCH -p gpu
#SBATCH -N 4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --time=1:00:00
#SBATCH --output="stdout.txt"
#SBATCH --error="stderr.txt"

module purge
module load mpi/mvapich2-x86_64

cd $SLURM_SUBMIT_DIR

mpirun ./ring
