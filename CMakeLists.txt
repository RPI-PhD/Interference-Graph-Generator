cmake_minimum_required(VERSION 3.22)
project(DLOG-Project)

set(CMAKE_CXX_STANDARD 17)

#set(CMAKE_CXX_FLAGS -fsanitize=address)

add_executable(DLOG-Project
        IG_Gen/generate_IR.cpp
        IG_Gen/code_data/test2.c
        IG_Gen/code_data/parser.c
        IG_Gen/code_data/myshell_parser.h)
