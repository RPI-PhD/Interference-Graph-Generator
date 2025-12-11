//GPT-4o-mini DATASET v1.0 Category: Cryptographic hash function ; Style: surprised
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>

// Constants for the hash function
#define HASH_SIZE 32
#define BLOCK_SIZE 64
#define ROUNDS 32

// Function prototypes
void initialize_state(uint32_t state[HASH_SIZE]);
void process_block(uint32_t state[HASH_SIZE], const uint8_t block[BLOCK_SIZE]);
void finalize_hash(uint32_t state[HASH_SIZE], uint8_t hash[HASH_SIZE]);
void print_hash(const uint8_t hash[HASH_SIZE]);
void hash_message(const uint8_t *message, size_t length, uint8_t hash[HASH_SIZE]);

// The main function to run the hashing example
int main() {
    const char *message = "Surprise! Welcome to the world of cryptographic hash functions!";
    uint8_t hash[HASH_SIZE];

    hash_message((const uint8_t *)message, strlen(message), hash);
    print_hash(hash);

    return 0;
}

// Initialize the hash state
void initialize_state(uint32_t state[HASH_SIZE]) {
    for (int i = 0; i < HASH_SIZE / sizeof(uint32_t); i++) {
        state[i] = i ^ 0xABCD1234; // Some arbitrary initialization
    }
}

// Process a block of data
void process_block(uint32_t state[HASH_SIZE], const uint8_t block[BLOCK_SIZE]) {
    for (int i = 0; i < BLOCK_SIZE; i++) {
        state[i % (HASH_SIZE / sizeof(uint32_t))] ^= block[i] * (i + 1);
        for (int r = 0; r < ROUNDS; r++) {
            state[i % (HASH_SIZE / sizeof(uint32_t))] = (state[i % (HASH_SIZE / sizeof(uint32_t))] << 5) | 
                                                         (state[i % (HASH_SIZE / sizeof(uint32_t))] >> 27);
        }
    }
}

// Finalize the hash computation
void finalize_hash(uint32_t state[HASH_SIZE], uint8_t hash[HASH_SIZE]) {
    for (int i = 0; i < HASH_SIZE / sizeof(uint32_t); i++) {
        hash[i * sizeof(uint32_t)] = (state[i] >> 24) & 0xFF;
        hash[i * sizeof(uint32_t) + 1] = (state[i] >> 16) & 0xFF;
        hash[i * sizeof(uint32_t) + 2] = (state[i] >> 8) & 0xFF;
        hash[i * sizeof(uint32_t) + 3] = state[i] & 0xFF;
    }
}

// Print the hash value
void print_hash(const uint8_t hash[HASH_SIZE]) {
    printf("Hash: ");
    for (int i = 0; i < HASH_SIZE; i++) {
        printf("%02x", hash[i]);
    }
    printf("\nSurprise! That's the hash of the input message above!\n");
}

// Main hashing function
void hash_message(const uint8_t *message, size_t length, uint8_t hash[HASH_SIZE]) {
    uint32_t state[HASH_SIZE / sizeof(uint32_t)];
    uint8_t block[BLOCK_SIZE];

    // Initialize the hash state
    initialize_state(state);

    // Process the input message in blocks
    size_t offset = 0;
    while (length > 0) {
        size_t block_size = (length < BLOCK_SIZE) ? length : BLOCK_SIZE;
        memcpy(block, message + offset, block_size);
        memset(block + block_size, 0, BLOCK_SIZE - block_size); // Pad the rest with zeros

        // Process the current block
        process_block(state, block);

        offset += block_size;
        length -= block_size;
    }

    // Finalize the hash
    finalize_hash(state, hash);
}