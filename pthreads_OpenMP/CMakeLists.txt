cmake_minimum_required(VERSION 3.13)
project(pthreads_OpenMP)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
set(CMAKE_CXX_FLAGS -pthread)
set(CMAKE_CXX_STANDARD 17)
set(THREADS_PREFER_PTHREAD_FLAG ON)
set(Boost_USE_STATIC_LIBS ON)
set(Boost_USE_MULTITHREADED ON)
set(Boost_USE_STATIC_RUNTIME OFF)
find_package(Threads REQUIRED)
find_package(OpenMP REQUIRED)

add_executable(pthreads_OpenMP src/sources/main.cpp src/sources/matrix_multiplication.cpp src/sources/Matrix.cpp src/Headers/Matrix.h)