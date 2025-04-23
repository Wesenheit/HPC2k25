/*
 * A template for the 2019 MPI lab at the University of Warsaw.
 * Copyright (C) 2016, Konrad Iwanicki.
 * Refactoring 2019, Łukasz Rączkowski
 */

#include <cassert>
#include <mpi.h>
#include "graph-base.h"
#include "graph-utils.h"
#include <algorithm>
#include <iostream>
int getFirstGraphRowOfProcess(int numVertices, int numProcesses, int myRank) {
    int base = numVertices / numProcesses;
    int extra = numVertices % numProcesses;
    if (myRank < extra) {
        return myRank * (base + 1);
    } else {
        return extra * (base + 1) + (myRank - extra) * base;
    }
}

Graph* createAndDistributeGraph(int numVertices, int numProcesses, int myRank) {
    assert(numProcesses >= 1 && myRank >= 0 && myRank < numProcesses);
    int low = getFirstGraphRowOfProcess(numVertices, numProcesses, myRank);
    int high = getFirstGraphRowOfProcess(numVertices, numProcesses, myRank + 1);

    auto graph = allocateGraphPart(
            numVertices,
            low,
            high);

    if (graph == nullptr) {
        return nullptr;
    }

    assert(graph->numVertices > 0 && graph->numVertices == numVertices);
    assert(graph->firstRowIdxIncl >= 0 && graph->lastRowIdxExcl <= graph->numVertices);
    if (myRank == 0)
    {
        int *buffer;
        buffer = new int[graph->numVertices];
        for (int i = 0;i < high-low;i++) initializeGraphRow(graph->data[i], i, graph->numVertices);
        int RankToSend = 1;
        
        while (RankToSend < numProcesses)
        {
            int low_rank = getFirstGraphRowOfProcess(numVertices, numProcesses, RankToSend);
            int high_rank = getFirstGraphRowOfProcess(numVertices, numProcesses, RankToSend + 1);
            for (int i = low_rank;i < high_rank;i++)
            {
                initializeGraphRow(buffer, i, graph->numVertices);
                MPI_Send(buffer,graph->numVertices,MPI_INT,RankToSend,0,MPI_COMM_WORLD);
            }
            RankToSend++;
        }
        delete[] buffer;
    }
    else
    {
        MPI_Status stat;
        for (int i = 0; i < high-low;i++)
        {
            MPI_Recv(graph->data[i],graph->numVertices,MPI_INT,0,0,MPI_COMM_WORLD,&stat);
        }
    }
    for (int i = 0; i < high-low; i++) {
    }
    return graph;
}

void collectAndPrintGraph(Graph* graph, int numProcesses, int myRank) {
    assert(numProcesses >= 1 && myRank >= 0 && myRank < numProcesses);
    assert(graph->numVertices > 0);
    assert(graph->firstRowIdxIncl >= 0 && graph->lastRowIdxExcl <= graph->numVertices);

    int low = getFirstGraphRowOfProcess(graph -> numVertices, numProcesses, myRank);
    int high = getFirstGraphRowOfProcess(graph -> numVertices, numProcesses, myRank + 1);
    int dummy = 0;
    MPI_Status stat;
    if (myRank == 0)
    {
        for (int i = 0; i < high-low; i++) {
            printGraphRow(graph->data[i], i, graph->numVertices);
        }
        MPI_Send(&dummy,1,MPI_INT,myRank+1,0,MPI_COMM_WORLD);
        MPI_Recv(&dummy,1,MPI_INT,numProcesses-1,0,MPI_COMM_WORLD,&stat);
    }
    else
    {
        MPI_Recv(&dummy,1,MPI_INT,myRank-1,0,MPI_COMM_WORLD,&stat);
        for (int i = 0; i < high-low; i++) {
            printGraphRow(graph->data[i], i, graph->numVertices);
        }
        MPI_Send(&dummy,1,MPI_INT,(myRank+1) % numProcesses,0,MPI_COMM_WORLD);
    }
}

void destroyGraph(Graph* graph, int numProcesses, int myRank) {
    freeGraphPart(graph);
}
