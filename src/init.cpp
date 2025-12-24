#include "../include/init.h"
#include "../include/state_machine.h"

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
