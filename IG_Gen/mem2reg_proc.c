#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define READ_LINE_LEN 1000

void remove_str(char* buffer, const char* find, unsigned long lfind) {
    char* p = strstr(buffer, find);
    if (p) {
        remove_str(p + lfind, find, lfind);
        // shift everything left
        do { *p = *(p + lfind); } while (*(++p));
    }
}

int main(int argc, char **argv){

    char *fl_name, fl_temp_name[30];
    FILE *fp1, *fp2;
    char a[READ_LINE_LEN];
    const char *rem = "optnone";  // We want to get rid of all instances of this guy

    if (argc != 2){
        fprintf(stderr,"Invalid number of arguments\n");
        return EXIT_FAILURE;
    }

    fl_name = argv[1];
    snprintf(fl_temp_name, sizeof(fl_temp_name), "%s.tmp", fl_name);

    fp1 = fopen(fl_name,"r");

    if (fp1 == NULL){
        fprintf(stderr,"Could not open file %s\n",fl_name);
        return EXIT_FAILURE;
    }

    fp2 = fopen(fl_temp_name,"w");

    if (fp2 == NULL){
        fprintf(stderr,"Could not open file %s\n",fl_name);
        return EXIT_FAILURE;
    }

    /* LLVM does something really stupid by default and I don't know how to shut it off.
     * We're going to manually remove all opt blockers
     */
    while (fgets(a, sizeof(a),fp1)){
        remove_str(a,rem,strlen(rem));
        fputs(a,fp2);
    }

    if (remove(fl_name) != 0) {
        return EXIT_FAILURE;
    }

    if (rename(fl_temp_name, fl_name) != 0) {
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}