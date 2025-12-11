//GPT-4o-mini DATASET v1.0 Category: Website Uptime Monitor ; Style: complex
#include <stdio.h>
#include <curl/curl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <time.h>

#define MAX_URLS 100
#define URL_LENGTH 256
#define TIMEOUT 5
#define CHECK_INTERVAL 60

// Function to initialize the CURL library
void initialize_curl() {
    curl_global_init(CURL_GLOBAL_DEFAULT);
}

// Function to perform the HTTP HEAD request
int check_url(const char *url) {
    CURL *curl;
    CURLcode res;

    curl = curl_easy_init();
    if(curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url);
        curl_easy_setopt(curl, CURLOPT_NOBODY, 1L);  // We only need the headers
        curl_easy_setopt(curl, CURLOPT_TIMEOUT, TIMEOUT);

        // Perform the request
        res = curl_easy_perform(curl);
        
        // Cleanup
        curl_easy_cleanup(curl);

        // Check the result of the request
        if(res == CURLE_OK) {
            return 1; // URL is up
        } else {
            return 0; // URL is down
        }
    }
    return 0; // CURL initialization failed
}

// Function to read the URLs from a file
int load_urls(const char *filename, char urls[MAX_URLS][URL_LENGTH]) {
    FILE *file = fopen(filename, "r");
    if (!file) {
        perror("Failed to open URL file");
        return -1;
    }

    int count = 0;
    while (count < MAX_URLS && fgets(urls[count], URL_LENGTH, file) != NULL) {
        // Remove newline character from the end if present
        urls[count][strcspn(urls[count], "\n")] = 0;
        count++;
    }
    
    fclose(file);
    return count;
}

// Function to log the results to a file
void log_result(const char *url, int status) {
    FILE *log_file = fopen("uptime_log.txt", "a");
    if (log_file != NULL) {
        time_t now = time(NULL);
        struct tm *tm_info = localtime(&now);
        char time_buffer[30];
        strftime(time_buffer, sizeof(time_buffer), "%Y-%m-%d %H:%M:%S", tm_info);
        fprintf(log_file, "[%s] %s is %s\n", time_buffer, url, status ? "UP" : "DOWN");
        fclose(log_file);
    }
}

// Main function
int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <url_file>\n", argv[0]);
        return EXIT_FAILURE;
    }

    char urls[MAX_URLS][URL_LENGTH];
    int url_count = load_urls(argv[1], urls);
    
    if (url_count < 0) {
        return EXIT_FAILURE;
    }

    initialize_curl();

    while (1) {
        for (int i = 0; i < url_count; i++) {
            int status = check_url(urls[i]);
            log_result(urls[i], status);
        }
        sleep(CHECK_INTERVAL);
    }

    curl_global_cleanup();
    return EXIT_SUCCESS;
}