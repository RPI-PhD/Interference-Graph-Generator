//
// Created by haven on 12/23/25.
//

#ifndef INTERFERENCE_GRAPH_GENERATOR_ALIGNED_REALLOC_H
#define INTERFERENCE_GRAPH_GENERATOR_ALIGNED_REALLOC_H
#include <stddef.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

bool is_aligned(void* ptr, size_t alignment);

void* aligned_realloc_pessimistic(void* ptr, size_t new_size, size_t old_size, size_t alignment);

void* aligned_realloc_glibc(void* ptr, size_t new_size, size_t alignment, size_t old_size);

#endif //INTERFERENCE_GRAPH_GENERATOR_ALIGNED_REALLOC_H