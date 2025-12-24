#ifndef INTERFERENCE_GRAPH_GENERATOR_STATE_MACHINE_H
#define INTERFERENCE_GRAPH_GENERATOR_STATE_MACHINE_H

#include "master.h"

/*
 * String search state machines
 * phi_machine = std::regex re(R"(\[\s*([^,\]]+)\s*,\s*([^]\]]+)\])");
 * reg_machine = std::regex re("(%[A-Za-z0-9._]+)");
 * func_machine = std::regex re("(@[A-Za-z0-9._]+)");
 */

const char * phi_machine(const char *p, long &len);

const char * reg_machine(const char *p, long &len);

const char * func_machine(const char *p, long &len);

#endif //INTERFERENCE_GRAPH_GENERATOR_STATE_MACHINE_H