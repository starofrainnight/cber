project(cber-compiler)

cmake_minimum_required(VERSION 3.10)

list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)

