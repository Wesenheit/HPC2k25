cmake_minimum_required (VERSION 4.0)
project (MIMUW-tbb-lab1 CXX)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}")

find_package ( TBB REQUIRED )

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_FLAGS "-g -Wall")

add_executable(pardo pardo.cpp)
target_link_libraries(pardo tbb)

add_executable(pardo_th_sp pardo_th_sp.cpp)
target_link_libraries(pardo_th_sp tbb)

add_executable(nqueens nqueens.cpp)
target_link_libraries(nqueens tbb)
