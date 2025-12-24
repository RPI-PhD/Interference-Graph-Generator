//
// Created by haven on 12/23/25.
//

#include "bitset_ops.h"

#include <stdlib.h>

/*
 * Helper bitwise funcs
 */

void init_bits(bitReg *regs, int reg_num){
    int sz = sizeof(BITSIZE) << 3;
    regs->reglines = (reg_num + sz - 1) / sz;
    regs->bits = (BITSIZE*)calloc(regs->reglines, sizeof(BITSIZE));
}