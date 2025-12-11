//Falcon-180B DATASET v1.0 Category: Network Packet Monitoring ; Style: modular
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <pcap.h>
#include <arpa/inet.h>
#include <netinet/ip.h>
#include <netinet/tcp.h>
#include <netinet/udp.h>

#define SNAPLEN 65535
#define TRUE 1
#define FALSE 0

pcap_t *handle;
char *dev;
pcap_handler callback;

struct packet_data {
    u_char *data;
    int size;
};

void packet_handler(u_char *args, const struct pcap_pkthdr *header, const u_char *packet) {
    struct packet_data *data = (struct packet_data*)args;
    data->data = (u_char*)malloc(header->caplen);
    data->size = header->caplen;
    memcpy(data->data, packet, header->caplen);
}

int main() {
    char errbuf[PCAP_ERRBUF_SIZE];
    char filter_expr[100];
    bpf_u_int32 mask;
    bpf_u_int32 net;
    struct bpf_program fp;
    int ret = 0;

    // Open the device
    dev = "eth0";
    handle = pcap_open_live(dev, SNAPLEN, 1, 0, errbuf);
    if(handle == NULL) {
        fprintf(stderr, "Error opening device: %s\n", errbuf);
        exit(1);
    }

    // Compile and set the filter
    sprintf(filter_expr, "tcp port 80");
    ret = pcap_compile(handle, &fp, filter_expr, 0, mask);
    if(ret!= 0) {
        fprintf(stderr, "Error compiling filter: %s\n", pcap_geterr(handle));
        exit(1);
    }
    ret = pcap_setfilter(handle, &fp);
    if(ret!= 0) {
        fprintf(stderr, "Error setting filter: %s\n", pcap_geterr(handle));
        exit(1);
    }

    // Register the callback function
    callback = packet_handler;
    ret = pcap_loop(handle, -1, callback, NULL);
    if(ret!= 0) {
        fprintf(stderr, "Error during packet capture: %s\n", pcap_geterr(handle));
        exit(1);
    }

    // Close the device
    pcap_close(handle);

    return 0;
}