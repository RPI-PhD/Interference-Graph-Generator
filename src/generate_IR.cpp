
#include "../include/generate_IR.h"

void compute_use_def_block(Function &blocks, const Register_mapping &regMap, const int num_regs){

    int reg_ID;
    size_t reg, i;

    for (Function::value_type &block : blocks){

        Block *bl = &block.second;

        init_bits(&bl->use_block,num_regs);
        init_bits(&bl->def_block,num_regs);

        for (i = 0; i < bl->num_instr; ++i){
            Instruct in = bl->instrcts[i];

            for (reg = 0; reg < in.size_use; ++reg){
                reg_ID = regMap.find(in.use[reg])->second;

                if (!bit_is_active(&bl->def_block,reg_ID))
                    set_reg_live(&bl->use_block,reg_ID);
            }

            for (reg = 0; reg < in.size_def; ++reg){
                reg_ID = regMap.find(in.def[reg])->second;

                set_reg_live(&bl->def_block,reg_ID);
            }

        }

    }
}

void compute_use_def_block_phis(Function &blocks,Register_mapping &regMap){
    int reg_ID, jmp;
    size_t i;

    Block *pred_block;

    for (Function::value_type &block : blocks){

        Block *bl = &block.second;

        for (i = 0; i < bl->num_Phi; ++i){

            Phi phi = bl->phis[i];

            for (jmp = 0; jmp < phi.num_pred; ++jmp){
                reg_ID = regMap.find(phi.use[jmp])->second;
                pred_block = &blocks.find(phi.predecessors[jmp])->second;

                if (!bit_is_active(&pred_block->def_block,reg_ID))
                    set_reg_live(&pred_block->use_block,reg_ID);
            }
        }
    }
}


// https://www.geeksforgeeks.org/compiler-design/liveliness-analysis-in-compiler-design/
void compute_in_out(Function &blocks, int num_regs){
    int in_diff, out_diff;
    size_t i;

    bitReg in_copy, out_copy, tmp;

    init_bits(&in_copy,num_regs);
    init_bits(&out_copy,num_regs);
    init_bits(&tmp,num_regs);

    for (Function::value_type &block : blocks){
        Block *bl = &block.second;

        init_bits(&bl->in_block,num_regs);
        init_bits(&bl->out_block,num_regs);

    }

    do {

        in_diff = out_diff = FALSE_;

        for (Function::value_type &block : blocks){

            Block *bl = &block.second;
            bitReg *in = &bl->in_block;
            bitReg *out = &bl->out_block;

            for (i = 0; i < bl->num_succ; ++i){
                size_t s = bl->successors[i];

                bit_union_or(&out_copy,&out_copy,&blocks[s].in_block);
            }

            bit_diff(&tmp,&out_copy,&bl->def_block);
            bit_union_or(&in_copy,&bl->use_block,&tmp);

            in_diff = memcmp(in->bits,in_copy.bits,in->reglines * sizeof(BITSIZE)) != FALSE_;
            out_diff = memcmp(out->bits,out_copy.bits,out->reglines * sizeof(BITSIZE)) != FALSE_;

            if (in_diff || out_diff){
                memcpy(in->bits,in_copy.bits,in_copy.reglines * sizeof(BITSIZE));
                memcpy(out->bits,out_copy.bits,out_copy.reglines * sizeof(BITSIZE));
            }
        }


    } while (in_diff || out_diff);


    free(tmp.bits);
    free(in_copy.bits);
    free(out_copy.bits);
}

void free_heap_alloc(Function &blocks){
    for (Function::value_type &block : blocks){

        Block *bl = &block.second;

        for (int i = 0; i < (int)bl->num_instr; i++) {
            if (bl->instrcts[i].func_name != NULL)
                free(bl->instrcts[i].func_name);
        }

        free(bl->instrcts);
        free(bl->successors);
        free(bl->use_block.bits);
        free(bl->def_block.bits);
        free(bl->in_block.bits);
        free(bl->out_block.bits);
        free(bl->phis);

    }
}

void analyze_registers(FILE *fp, char fl_name[], int file_size, int recursive, int coloring){

    size_t len = 0, block_idx = 2;
    int reg_idx = 0;
    char *line = NULL;
    int in_func = FALSE_, in_block = FALSE_;
    LINE_TYPE loc;
    int num_funcs = file_size / BYTES_PER_FUNCTION;
    IRFuncs block_map;

    block_map.func_size = 0;
    block_map.funcs = (Function*) malloc(num_funcs * sizeof(Function));
    block_map.regs = (Register_mapping*) malloc(num_funcs * sizeof(Register_mapping));
    block_map.func_names = (char*) malloc(num_funcs * sizeof(char) * PATH_MAX);


    while (getline(&line, &len, fp) != -1) {
        if (!in_func){
            if (strncmp(line,"define",6) == 0) {

                if (block_map.func_size < (size_t)num_funcs) {
                    new (&block_map.funcs[block_map.func_size]) Function();
                    new (&block_map.regs[block_map.func_size]) Register_mapping();

                    block_map.funcs[block_map.func_size].reserve(MAX_NUM_BLOCKS); // This is really dumb | TODO: We really need to speed up + make hashing safe
                    block_map.regs[block_map.func_size].reserve(MAX_NUM_REGS);

                } else {
                    fprintf(stderr, "Exceeded allocated function capacity. Please edit BYTES_PER_FUNCTION\n");
                    exit(EXIT_FAILURE);
                }

                in_func = TRUE_;
                const char * func_tok_ptr = line;
                long func_tok_len = 0;
                func_tok_ptr = func_machine(func_tok_ptr, func_tok_len);

                const char * reg_tok_ptr = line;
                long reg_tok_len = 0;
                reg_tok_ptr = reg_machine(reg_tok_ptr, reg_tok_len);
                int num_args = 0;
                for (; reg_tok_ptr != NULL; reg_tok_ptr = reg_machine(++reg_tok_ptr, reg_tok_len))
                {
                    num_args++;
                }

                block_idx = num_args;
                in_block = TRUE_;

                if (func_tok_ptr == NULL) {
                    fprintf(stderr,"Could not compute name of function you entered. How did you get here?\n");
                    exit(EXIT_FAILURE);
                }

                char * nameptr = block_map.func_names + PATH_MAX * block_map.func_size;

                snprintf(nameptr, PATH_MAX,
                         "%.*s",
                         (int) func_tok_len - 1,
                         func_tok_ptr + 1);


            } else { continue; }
        }

        if (!in_block){

            if (strchr(line, ':') != NULL){
                in_block = TRUE_;
                block_idx = atoi(line);
            }

            if (line[0] == '}'){

                in_func = FALSE_;
                in_block = FALSE_;

                /* Core liveness tracking. All this will have to change for multiple funcs */
                compute_use_def_block(block_map.funcs[block_map.func_size],block_map.regs[block_map.func_size], reg_idx);
                compute_use_def_block_phis(block_map.funcs[block_map.func_size],block_map.regs[block_map.func_size]);

                compute_in_out(block_map.funcs[block_map.func_size], reg_idx);

                /* Here we make the edge list given we have populated all necessary structures */

                block_map.func_size++;

                reg_idx = 0;

            }

            continue;
        }

        /* Interesting stuff in here */
        loc = set_up_blocks(line,
                            block_map.funcs[block_map.func_size],
                            block_idx,
                            block_map.regs[block_map.func_size],
                            reg_idx,fp,len);
        in_block = (loc != LINE_TYPE::BRANCH) ? TRUE_ : FALSE_;

    }

    fclose(fp);
    if (line)
        free(line);

    generate_all_edge_lists(block_map, fl_name, recursive, coloring);

    for (int i = 0; i < (int)block_map.func_size; i++)
    {
        free_heap_alloc(block_map.funcs[i]);
        block_map.funcs[i].~Function();
        block_map.regs[i].~Register_mapping();
    }

    free(block_map.func_names);
    free(block_map.funcs);
    free(block_map.regs);

}