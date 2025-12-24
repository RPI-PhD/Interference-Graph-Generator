//GEMINI-pro DATASET v1.0 Category: Cryptography Implementation ; Style: protected
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <openssl/evp.h>

int main() {
    // The key and IV should be generated randomly and kept secret
    unsigned char key[] = "0123456789abcdef";
    unsigned char iv[]  = "0123456789abcdef";

    // The data to be encrypted should be null-terminated
    unsigned char data[] = "Hello, world!";

    // The encrypted data will be stored in this buffer
    unsigned char encrypted_data[1024];

    // The size of the encrypted data
    int encrypted_data_size;

    // Create a new cipher context
    EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();
    if (ctx == NULL) {
        fprintf(stderr, "Could not create cipher context\n");
        return EXIT_FAILURE;
    }

    // Initialize the cipher context with the key, IV, and cipher algorithm
    if (EVP_CipherInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv, 1) != 1) {
        fprintf(stderr, "Could not initialize cipher context\n");
        EVP_CIPHER_CTX_free(ctx);
        return EXIT_FAILURE;
    }

    // Encrypt the data
    if (EVP_CipherUpdate(ctx, encrypted_data, &encrypted_data_size, data, strlen(data)) != 1) {
        fprintf(stderr, "Could not encrypt data\n");
        EVP_CIPHER_CTX_free(ctx);
        return EXIT_FAILURE;
    }

    // Finalize the encryption process
    if (EVP_CipherFinal_ex(ctx, encrypted_data + encrypted_data_size, &encrypted_data_size) != 1) {
        fprintf(stderr, "Could not finalize encryption\n");
        EVP_CIPHER_CTX_free(ctx);
        return EXIT_FAILURE;
    }

    // Print the encrypted data
    printf("Encrypted data: ");
    for (int i = 0; i < encrypted_data_size; i++) {
        printf("%02x", encrypted_data[i]);
    }
    printf("\n");

    // Decrypt the data
    unsigned char decrypted_data[1024];
    int decrypted_data_size;

    // Reinitialize the cipher context for decryption
    if (EVP_CipherInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv, 0) != 1) {
        fprintf(stderr, "Could not reinitialize cipher context\n");
        EVP_CIPHER_CTX_free(ctx);
        return EXIT_FAILURE;
    }

    // Decrypt the data
    if (EVP_CipherUpdate(ctx, decrypted_data, &decrypted_data_size, encrypted_data, encrypted_data_size) != 1) {
        fprintf(stderr, "Could not decrypt data\n");
        EVP_CIPHER_CTX_free(ctx);
        return EXIT_FAILURE;
    }

    // Finalize the decryption process
    if (EVP_CipherFinal_ex(ctx, decrypted_data + decrypted_data_size, &decrypted_data_size) != 1) {
        fprintf(stderr, "Could not finalize decryption\n");
        EVP_CIPHER_CTX_free(ctx);
        return EXIT_FAILURE;
    }

    // Print the decrypted data
    printf("Decrypted data: %s\n", decrypted_data);

    // Clean up
    EVP_CIPHER_CTX_free(ctx);

    return EXIT_SUCCESS;
}