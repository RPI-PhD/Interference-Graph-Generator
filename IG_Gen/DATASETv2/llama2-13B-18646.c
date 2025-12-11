//LLAMA2-13B DATASET v1.0 Category: Binary Converter ; Style: grateful
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_INT 2147483647
#define MAX_STRlen 20

// Function to convert binary to decimal
int binaryToDecimal(int binary[], int len) {
  int i, sum = 0;
  for (i = 0; i < len; i++) {
    sum += binary[i] * pow(2, len - i - 1);
  }
  return sum;
}

// Function to convert decimal to binary
int decimalToBinary(int decimal, int len) {
  int i, rem, temp[len];
  for (i = 0; i < len; i++) {
    rem = decimal % 2;
    temp[i] = rem;
    decimal /= 2;
  }
  temp[i] = 0;
  return temp;
}

int main() {
  int binary[MAX_STRlen] = {0};
  int decimal = 0;
  int len = 0;

  // Convert decimal to binary
  decimal = 123;
  len = decimalToBinary(decimal, MAX_STRlen);
  binary[0] = len;
  for (int i = 1; i < len; i++) {
    binary[i] = decimalToBinary(decimal % 2, MAX_STRlen);
    decimal /= 2;
  }

  // Convert binary to decimal
  int result = binaryToDecimal(binary, len);
  printf("Decimal: %d\n", result);

  // Convert binary to string
  char str[MAX_STRlen] = {0};
  for (int i = 0; i < len; i++) {
    str[i] = binary[i] + '0';
  }
  printf("Binary: %s\n", str);

  return 0;
}