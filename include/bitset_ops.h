#ifndef INTERFERENCE_GRAPH_GENERATOR_BITSET_OPS_H
#define INTERFERENCE_GRAPH_GENERATOR_BITSET_OPS_H

#include "master.h"

typedef u_int64_t BITSIZE;

typedef struct {
    short reglines;
    BITSIZE *bits;
} bitReg;

void init_bits(bitReg *regs, int reg_num);

// a - b
inline void bit_diff(bitReg *out, bitReg *a, bitReg *b){
    for (short i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] & ~b->bits[i];
    }
}

inline void bit_union_or(bitReg *out, bitReg *a, bitReg *b){
    for (short i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] | b->bits[i];
    }
}

inline void bit_intersection_and(bitReg *out, bitReg *a, bitReg *b){
    for (short i = 0; i < out->reglines; ++i){
        out->bits[i] = a->bits[i] & b->bits[i];
    }
}

// set register bit to 1
inline void set_reg_live(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    regs->bits[regnum >> 6] |= (1ULL << (regnum & (sz - 1)));
}

// set register bit to 0
inline void kill_reg(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    regs->bits[regnum >> 6] &= ~(1ULL << (regnum & (sz - 1)));
}

// boolean check if register is live
inline int bit_is_active(bitReg *regs, int regnum){
    int sz = sizeof(BITSIZE) << 3;
    return (int)((regs->bits[regnum >> 6] >> (regnum & (sz - 1))) & 1ULL);
}

inline void clear_bits(bitReg *regs){
    memset(regs->bits,0,regs->reglines * sizeof(BITSIZE));
}

#endif //INTERFERENCE_GRAPH_GENERATOR_BITSET_OPS_H