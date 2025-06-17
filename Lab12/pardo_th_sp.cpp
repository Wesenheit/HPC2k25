#include "tbb/tbb.h"
#include <tbb/concurrent_priority_queue.h>

#include <functional>
#include <iostream>
#include <map>
#include <math.h>
#include <random>
#include <set>

typedef int node_t;
using DMap = tbb::concurrent_hash_map<node_t, int>;

// Our graph just maps a node onto its neighbors.
typedef std::unordered_map<node_t, std::set<node_t>> graph_t;

// Initialize a DAG with random adjacencies.
void rand_init_DAG_graph(graph_t &graph, int node_count,
                         double edge_probability) {
  std::random_device rd;
  std::mt19937 gen{rd()};
  std::uniform_real_distribution<> dis{0, 1};
  for (int i = 0; i < node_count; ++i) {
    auto neighbors = std::set<node_t>();
    for (int j = i + 1; j < node_count; ++j) {
      if (dis(gen) < edge_probability) {
        neighbors.insert(j);
      }
    }
    graph[i] = neighbors;
  }
}

// Traverse the DAG - may visit a node multiple times.
void seq_traverse(const node_t &node, graph_t &graph, int &edge_count) {
  // std::cout << "Now processing: " << node << "." << std::endl;
  for (const auto &neighbor : graph[node]) {
    // std::cout << "edge: " << node << "->" << neighbor << std::endl;
    edge_count++;
    seq_traverse(neighbor, graph, edge_count);
  }
}

bool Insert_if_lower(DMap &map, int key, int distance) {
  DMap::accessor acc;
  if (map.insert(acc, key)) {
    acc->second = distance;
    return true;
  } else {
    if (distance < acc->second) {
      acc->second = distance;
      return true;
    }
    return false;
  }
}

int main(int argc, char *argv[]) {
  const int node_count = 15;
  graph_t graph;
  rand_init_DAG_graph(graph, node_count, 0.5);
  node_t node = 0;
  int seq_edge_count = 0;
  seq_traverse(node, graph, seq_edge_count);

  using Task = std::pair<node_t, int>;
  tbb::enumerable_thread_specific<int> counters;
  tbb::concurrent_hash_map<node_t, int> distance;
  tbb::concurrent_priority_queue<Task> que;
  node = 0;
  que.push({0, 0});
  tbb::task_group g;
  DMap::accessor acc;
  distance.insert(acc, 0);
  acc->second = 0;
  for (int i = 0; i < tbb::this_task_arena::max_concurrency(); ++i) {
    g.run([&] {
      while (true) {
        Task node = {-1, 0};
        if (!que.try_pop(node))
          break;
        if (node.first >= 0) {
          int pot_dis = node.second + 1;
          for (const auto &neighbor : graph[node.first]) {
            counters.local()++;
            int new_distance;
            if (Insert_if_lower(distance, neighbor, pot_dis)) {
              new_distance = pot_dis;
            } else {
              new_distance = node.second;
            }
            que.push({neighbor, new_distance});
          }
        }
      }
    });
  }
  g.wait();
  int par_edge_count = 0;
  for (const auto &counter : counters) {
    par_edge_count += counter;
  }
  std::cout << "Edges traversed: sequentially: " << seq_edge_count
            << " in parallel: " << par_edge_count << std::endl;
}
