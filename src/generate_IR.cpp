
#include "generate_IR.h"

#include "graph_algs.h"

static inline const char *skip_whitespace(const char *p){
    for (; *p == ' ' || *p == '\t'; ++p);
    return p;
}

/*
 * Other methods
 */

void compute_use_def_block(Function &blocks,Register_mapping &regMap, int num_regs){

    int reg_ID;
    size_t reg, i;

    for (std::pair<const size_t,Block> &block : blocks){

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

    for (std::pair<const size_t,Block> &block : blocks){

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

void compute_use_def_instr(const char *line,
                           Block *block,
                           Register_mapping &regMap,
                           int &reg_idx,
                           int is_phi){

    size_t instr_idx, *sz_use, *sz_def, phi_idx;
    short *num_pred;
    int *predecessors;
    long tok_len;
    const char *eq, *rhs, *lhs, *token, *callcheck;
    Instruct *instr;
    Phi *phis;

    instr_idx = block->num_instr;
    phi_idx = block->num_Phi;

    instr = &block->instrcts[instr_idx];
    phis = &block->phis[phi_idx];

    sz_def = &instr->size_def;
    sz_use = &instr->size_use;

    callcheck = strstr(line, "call ");

    if (callcheck == NULL)
    {
        instr->func_name = NULL;
    }
    else
    {
        const char* first = strchr(callcheck, '@');
        const char* last = strchr(first, '(');
        int name_size = last - first;
        instr->func_name = (char *) malloc(name_size);
        strncpy(instr->func_name, first+1, name_size - 1);
        instr->func_name[name_size-1] = '\0';
    }

    *sz_def = 0, *sz_use = 0;

    eq = strchr(line, '=');

    rhs = eq == NULL ? line : eq + 1;
    lhs = eq == NULL ? line : eq - 1;

    token = line;

    token = reg_machine(token,tok_len);
    for (; token != NULL && token < lhs; token = reg_machine(++token,tok_len)){

        snprintf(block->instrcts[instr_idx].def[*sz_def], tok_len + 1,"%.*s",(int)tok_len,token);
        std::string map_token(block->instrcts[instr_idx].def[*sz_def],tok_len);

        if (regMap.find(map_token) == regMap.end()){
            regMap[map_token] = reg_idx;

            reg_idx++;
        }

        (*sz_def)++;
    }

    token = rhs;
    if (is_phi){

        num_pred = &phis->num_pred;
        predecessors = phis->predecessors;
        *num_pred = 0;

        token = phi_machine(token,tok_len);
        for (; token != NULL; token = phi_machine(token,tok_len)){
            if (token[0] != '%'){
                token = phi_machine(token,tok_len);
                continue;
            }

            snprintf(phis->use[*num_pred], tok_len + 1,"%.*s",(int)tok_len,token);

            token = phi_machine(token,tok_len);

            predecessors[*num_pred] = atoi(token + 1);

            (*num_pred)++;
        }

        if (*num_pred != 0){
            block->num_Phi++;
        }

    } else {

        token = reg_machine(token,tok_len);
        for (; token != NULL; token = reg_machine(++token,tok_len)){
            snprintf(block->instrcts[instr_idx].use[*sz_use], tok_len + 1,"%.*s",(int)tok_len,token);
            std::string map_token(block->instrcts[instr_idx].use[*sz_use],tok_len);

            if (regMap.find(map_token) == regMap.end()){
                regMap[map_token] = reg_idx;

                reg_idx++;
            }

            (*sz_use)++;
        }

    }

    block->num_instr++;
}

void compute_successors(const char *line,
                        Block *block,
                        Register_mapping &regMap,
                        int &reg_idx){

    const char *p;
    size_t instr_idx;
    size_t original_num_succ, old_succ_len;

    instr_idx = block->num_instr - 1;

    // First separate out the sub-instructions in the branch line

    char token[256];

    long tok_len = 0;
    const char * tok_ptr = line;
    tok_ptr = reg_machine(tok_ptr, tok_len);
    original_num_succ = block->num_succ;

    for (; tok_ptr != NULL; tok_ptr = reg_machine(++tok_ptr, tok_len))
    {
        block->num_succ++;
    }

    old_succ_len = block->succ_len;
    while (block->succ_len <= block->num_succ){
        block->succ_len <<= 1;
    }

    if (old_succ_len != block->succ_len){

        block->successors = (int *) realloc(block->successors,block->succ_len * sizeof(int));

        if (block->successors == NULL){
            fprintf(stderr,"Realloc of block->successors failed\n");
            exit(EXIT_FAILURE);
        }
    }

    tok_ptr = line;
    tok_ptr = reg_machine(tok_ptr, tok_len);

    for (; tok_ptr != NULL; tok_ptr = reg_machine(++tok_ptr, tok_len)){

        snprintf(token, tok_len + 1, "%s", tok_ptr);
        p = token;

        /* I'm assuming it will always be "label %{register}",
         * so walk back 6 steps and check for "label " */

        if (tok_ptr - 6 >= line && strncmp(tok_ptr - 6,"label ",6) == 0) {
            block->successors[original_num_succ] = atoi(p + 1);
            original_num_succ++;
        }
        else {

            block->instrcts[instr_idx].size_use++;
            size_t sz = block->instrcts[instr_idx].size_use;

            if (regMap.find(p) == regMap.end()){
                regMap[p] = reg_idx;

                reg_idx++;
            }
            strcpy(block->instrcts[instr_idx].use[sz - 1],p);

        }
    }
    block->num_succ = original_num_succ;
}

static inline LINE_TYPE handle_switch(char *&line,
                            Block *block,
                            Register_mapping &regMap,
                            int &reg_idx,
                            FILE *fp,
                            size_t &len){

    block->num_succ = 0;
    block->succ_len = 4;

    block->successors = (int*)malloc(block->succ_len * sizeof(int));

    while (line[2] != ']'){

        compute_successors(line,block,regMap,reg_idx);
        getline(&line, &len, fp);

    }

    return LINE_TYPE::BRANCH;

}

static inline LINE_TYPE handle_br(const char *line,
                            Block *block,
                            Register_mapping &regMap,
                            int &reg_idx){
    block->num_succ = 0;
    block->succ_len = 2;

    block->successors = (int*)malloc(block->succ_len * sizeof(int));

    compute_successors(line,block,regMap,reg_idx);
    return LINE_TYPE::BRANCH;
}

// Note to self: Function will be on the stack...only need 1
LINE_TYPE set_up_blocks(char *&line, Function &blocks,
                        size_t block_idx,
                        Register_mapping &regMap,
                        int &reg_idx,
                        FILE *fp,
                        size_t &len){

    Block *block;
    int is_phi = FALSE_;

    /* Dynamic resizing of data structures cuz I started this in c :C */

    /* Focus in on a specific block */
    block = &blocks[block_idx];

    if (block->label == 0){
        block->label = block_idx;
    }

    if (block->num_instr >= block->instr_len){

        if (block->instr_len == 0){
            block->instrcts = (Instruct*) calloc(1, sizeof(Instruct));
            block->num_instr = 0;
            block->instr_len = 1;
        } else {
            const size_t resize_i = 2 * block->instr_len;
            block->instrcts = (Instruct*) realloc(block->instrcts, resize_i * sizeof(Instruct));
            block->instr_len = resize_i;
        }

        if (block->instrcts == NULL){
            fprintf(stderr, "Control flow graph construction failed: Reallocation error\n");
            exit(EXIT_FAILURE);
        }
    }

    // If the line is a phi node
    if (strstr(line, " phi ") != NULL){

        if (block->num_Phi >= block->Phi_len){

            if (block->Phi_len == 0){
                block->phis = (Phi*) calloc(2, sizeof(Instruct));
                block->num_Phi = 0;
                block->Phi_len = 2;
            } else {
                const size_t resize_i = 2 * block->Phi_len;
                block->phis = (Phi*) realloc(block->phis, resize_i * sizeof(Phi));
                block->Phi_len = resize_i;
            }

            if (block->phis == NULL){
                fprintf(stderr, "Control flow graph construction failed: Reallocation error\n");
                exit(EXIT_FAILURE);
            }


        }

        is_phi = TRUE_;
    }


    const char *no_space = skip_whitespace(line);

    /*
     * Below we handle all the different terminator instructions. We are following LLVM standard here:
     * https://llvm.org/docs/LangRef.html
     *
     * Very ugly but quite fast | I dare you to come up with something cleaner but same speed
     *
     */
    switch (no_space[0]) {

        // 'switch' instruction
        case 's':

            if (strncmp(no_space,"switch", 6) == 0){

                return handle_switch(line,
                                     block,
                                     regMap,
                                     reg_idx,
                                     fp,
                                     len);

            }
            goto default_case;
            
            
        // 'br' instruction
        case 'b':

            if (strncmp(no_space,"br", 2) == 0){
                return handle_br(no_space,block,regMap,reg_idx);
            }
            goto default_case;

        // 'ret' instruction
        case 'r':

            if (strncmp(no_space,"ret",3) == 0){
                return LINE_TYPE::BRANCH;
            }
            goto default_case;

        // 'unreachable' instruction
        case 'u':

            if (strncmp(no_space,"unreachable",11) == 0){
                return LINE_TYPE::BRANCH;
            }
            goto default_case;

        // non-terminator
        default:
        default_case:
            compute_use_def_instr(no_space,block,regMap,reg_idx,is_phi);
            return LINE_TYPE::INTERMEDIATE;
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

    for (std::pair<const size_t,Block> &block : blocks){
        Block *bl = &block.second;

        init_bits(&bl->in_block,num_regs);
        init_bits(&bl->out_block,num_regs);

    }

    do {

        in_diff = out_diff = FALSE_;

        for (std::pair<const size_t,Block> &block : blocks){

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
    for (std::pair<const size_t,Block> &block : blocks){

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

/*
 * Currently only works with 1 function.
 * TODO: make work with multiple functions. I already have the struct above
 */
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

                // Make file name for edge list
                if (recursive)
                    snprintf(nameptr, PATH_MAX,
                             "%.*s",
                             (int) func_tok_len - 1,
                             func_tok_ptr + 1);
                else
                    snprintf(nameptr, PATH_MAX,
                         "%s_%.*s.txt",                        // {file}_{function}.txt
                         fl_name,
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

int main(int argc, char **argv){

    int recursive = TRUE_;
    int coloring = FALSE_;

    char *fl_name;
    FILE *fp;
    char graph_file_ttl[PATH_MAX];
    size_t len_ll, size_noll;

    if (argc != 2){
        fprintf(stderr,"Invalid number of arguments\n");
        return EXIT_FAILURE;
    }

    fl_name = argv[1];

    fp = fopen(fl_name,"r");

    if (fp == NULL){
        fprintf(stderr,"Could not open file %s\n",fl_name);
        return EXIT_FAILURE;
    }

    struct stat st;
    stat(fl_name, &st);
    int size = st.st_size;

    char * last = strrchr(fl_name,'/');
    *last = 'a';
    char * second_last = strrchr(fl_name,'/');
    *last = '/';
    int pathname_len = second_last - fl_name;

    len_ll = 3; // ".ll"
    size_noll = strlen(last) - len_ll - 1;

    strncpy(graph_file_ttl,fl_name,pathname_len);
    graph_file_ttl[pathname_len] = '\0';
    strcat(graph_file_ttl,"/output_graph/");
    strncat(graph_file_ttl,last+1,size_noll);

    analyze_registers(fp,graph_file_ttl ,size, recursive, coloring);

    return EXIT_SUCCESS;

}