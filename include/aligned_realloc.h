#ifndef INTERFERENCE_GRAPH_GENERATOR_ALIGNED_REALLOC_H
#define INTERFERENCE_GRAPH_GENERATOR_ALIGNED_REALLOC_H

#include "master.h"

bool is_aligned(void* ptr, size_t alignment);

void* aligned_realloc_pessimistic(void* ptr, size_t new_size, size_t old_size, size_t alignment);

void* aligned_realloc_glibc(void* ptr, size_t new_size, size_t alignment, size_t old_size);

#endif //INTERFERENCE_GRAPH_GENERATOR_ALIGNED_REALLOC_H