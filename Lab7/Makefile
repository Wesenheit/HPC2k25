#
# A template for the 2016 MPI lab at the University of Warsaw.
# Copyright (C) 2016, Konrad Iwanicki.
# Further modifications by Krzysztof Rzadca 2018
#

CC          := mpicc   # use cc on okeanos
CFLAGS      := -O3 -c -Wall
LFLAGS      := -O3
# Add new targets below:
ALL         := hello-world-seq.c

all:
	$(CC) $(LFLAGS) -o band test_band.c
	$(CC) $(LFLAGS) -o ring ring.c
