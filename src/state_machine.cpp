//
// Created by haven on 12/23/25.
//

#include "../include/state_machine.h"

const char * phi_machine(const char *p, long &len)
{
    const char * start_tok = NULL;
    len = 0;
    // ex %.01 = phi i32 [ 0, %4 ], [ %40, %39 ], ...
    while(*p != '\n')
    {
        if (*p == '[' || (*p == ',' && *(p-1) != ']'))
        {
            start_tok = p + 2;
            p = start_tok;
            // if it reaches here, it found a start character
            break;
        }
        p++;
    }
    // if it didn't find a start char, it skips this loop
    if (*p != '\n')
    {
        while (*p != ',' && *p != ' ')
        {
            p++;
        }
    }

    if (start_tok != NULL) len = p - start_tok;
    return start_tok;
}

const char * reg_machine(const char *p, long &len)
{
    const char * start = NULL;
    len = 0;

    for (; *p != '%' && *p != '\n'; ++p) { if (*p == '(') p += 2; } // need to check for edge case '(%'

    while (*p != '\n' && *p != ',' && *p != ' ' && *p != ')'){
        if (*p == '%'){
            start = p;
        }

        p++;
    }

    len = (start != NULL) ? p - start : 0;
    return start;
}

const char * func_machine(const char *p, long &len){

    const char * start = NULL;
    len = 0;

    for (; *p != '@' && *p != '\n'; ++p){}

    while (*p != '('){
        if (*p == '@'){
            start = p;
        }

        p++;
    }

    len = (start != NULL) ? p - start : 0;
    return start;
}