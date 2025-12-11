//GPT-4o-mini DATASET v1.0 Category: Digital signal processing ; Style: energetic
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <complex.h>

#define SAMPLE_RATE 1024
#define FREQUENCY_1 50
#define FREQUENCY_2 120
#define SIGNAL_LENGTH 512

typedef struct {
    double real;
    double imag;
} Complex;

void generate_signal(double *signal, int length) {
    for (int n = 0; n < length; n++) {
        signal[n] = sin(2 * M_PI * FREQUENCY_1 * n / SAMPLE_RATE) +
                     0.5 * sin(2 * M_PI * FREQUENCY_2 * n / SAMPLE_RATE);
    }
}

void fft(Complex *x, int N) {
    if (N <= 1) return;

    Complex *even = (Complex *)malloc(N / 2 * sizeof(Complex));
    Complex *odd = (Complex *)malloc(N / 2 * sizeof(Complex));

    for (int k = 0; k < N / 2; k++) {
        even[k] = x[k * 2];
        odd[k] = x[k * 2 + 1];
    }

    fft(even, N / 2);
    fft(odd, N / 2);

    for (int k = 0; k < N / 2; k++) {
        Complex t = {cos(-2 * M_PI * k / N) * odd[k].real - sin(-2 * M_PI * k / N) * odd[k].imag,
                      sin(-2 * M_PI * k / N) * odd[k].real + cos(-2 * M_PI * k / N) * odd[k].imag};

        x[k] = (Complex){even[k].real + t.real, even[k].imag + t.imag};
        x[k + N / 2] = (Complex){even[k].real - t.real, even[k].imag - t.imag};
    }

    free(even);
    free(odd);
}

void print_frequency_spectrum(Complex *fft_result, int length) {
    printf("Frequency Spectrum:\n");
    for (int i = 0; i < length; i++) {
        double magnitude = sqrt(fft_result[i].real * fft_result[i].real + fft_result[i].imag * fft_result[i].imag);
        int bars = (int)(magnitude / 10);  // Scale down for visualization

        printf("%3d: ", i);
        for (int j = 0; j < bars; j++) {
            printf("#");
        }
        printf("\n");
    }
}

int main() {
    double signal[SIGNAL_LENGTH];
    generate_signal(signal, SIGNAL_LENGTH);

    Complex *fft_result = (Complex *)malloc(SIGNAL_LENGTH * sizeof(Complex));
    for (int i = 0; i < SIGNAL_LENGTH; i++) {
        fft_result[i] = (Complex){signal[i], 0};
    }

    fft(fft_result, SIGNAL_LENGTH);

    print_frequency_spectrum(fft_result, SIGNAL_LENGTH / 2);

    free(fft_result);
    return 0;
}