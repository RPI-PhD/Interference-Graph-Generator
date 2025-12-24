#
# NOTE: we have all these safety flags appended because this is not meant to be the fast way
#
# Use build.ninja for large jobs
#

CXX = g++
override CXXFLAGS := -std=c++17 -Wall -Werror -Wextra -fsanitize=address -pedantic -g $(CXXFLAGS)

#INP_DIR = data/DATASETv2
IR_DIR  = data/LLVM_IR
OUT_DIR = data/output_graph

PY_ENV = src/environment.yaml
PY_ENV_NAME = Interference-Graph-Generator
PY_SCRIPT = src/get_graph_stats.py
PY_ENV_STAMP := ./build/.conda_env_$(PY_ENV_NAME).stamp

INP_FILES := $(wildcard $(INP_DIR)/*.c)

IR_FILES := $(INP_FILES:$(INP_DIR)/%.c=$(IR_DIR)/%-mem2reg.ll)

OUTPUT_FILES := $(IR_FILES:$(IR_DIR)/%-mem2reg.ll=$(OUT_DIR)/%-mem2reg.txt)

FILES = aligned_realloc bitset_ops generate_IR graph_algs io_ops state_machine
SRCS := $(addsuffix .cpp,$(FILES))
SRCS := $(addprefix src/,$(SRCS))
OBJS := $(addsuffix .o,$(FILES))
OBJS := $(addprefix build/,$(OBJS))
TARGET = bin/generate_IR
GEN_EXE = ./$(TARGET)

all_stats: run run_py
.PHONY: clean run genfiles clean_full dirs pyenv run_py

all: run

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

build/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

dirs:
	mkdir -p $(IR_DIR) $(OUT_DIR) build bin

$(IR_DIR)/%-mem2reg.ll: $(INP_DIR)/%.c | dirs
	/bin/bash build/compile_to_ir.sh "$<" "$@"

genfiles: $(IR_FILES)

$(OUT_DIR)/%-mem2reg.txt: $(IR_DIR)/%-mem2reg.ll $(TARGET) | dirs
	/bin/bash build/run_generator.sh "$(GEN_EXE)" $<

$(PY_ENV_STAMP): $(PY_ENV)
	@conda env update -n $(PY_ENV_NAME) -f $(PY_ENV) --prune || \
	  conda env create -n $(PY_ENV_NAME) -f $(PY_ENV)
	@touch $@

pyenv: $(PY_ENV_STAMP)

run_py: $(PY_ENV_STAMP) $(PY_SCRIPT)
	@conda run -n $(PY_ENV_NAME) python $(PY_SCRIPT) $(OUT_DIR)

run: genfiles $(OUTPUT_FILES)

clean_pyenv:
	@rm -f $(PY_ENV_STAMP)

clean:
	rm -f build/*.o *~ $(TARGET)

clean_ll: clean
	rm -f $(IR_DIR)/*.ll

clean_full: clean_ll
	rm -f $(OUTPUT_FILES)