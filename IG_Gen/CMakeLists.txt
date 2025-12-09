cmake_minimum_required(VERSION 3.22)
project(DLOG-Project)

set(CMAKE_CXX_STANDARD 17)

#set(CMAKE_CXX_FLAGS -fsanitize=address)

add_executable(DLOG-Project
        generate_IR.cpp
        code_data/test2.c
        code_data/parser.c
        code_data/myshell_parser.h)
