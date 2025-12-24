//
// Created by haven on 12/23/25.
//

#include "../include/aligned_realloc.h"

bool is_aligned(void* ptr, size_t alignment)
{
    return !(((size_t) ptr) % alignment);
}

void* aligned_realloc_pessimistic(void* ptr, size_t new_size, size_t old_size, size_t alignment)
{
    void* aligned = aligned_alloc(alignment, new_size);
    memcpy(aligned, ptr, old_size);
    free(ptr);
    return aligned;
}

void* aligned_realloc_glibc(void* ptr, size_t new_size, size_t alignment, size_t old_size)
{
    return old_size >= new_size && is_aligned(ptr, alignment)
        ? ptr
        : aligned_realloc_pessimistic(ptr, new_size, old_size, alignment);
}