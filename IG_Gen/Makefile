CXX = g++
override CXXFLAGS := -Wall -std=c++17 -Werror -pedantic -g -fsanitize=undefined -fsanitize=address $(CXXFLAGS)

INP_DIR = DATASETv2
IR_DIR  = LLVM_IR
OUT_DIR = output_graph

INP_FILES := $(wildcard $(INP_DIR)/*.c)

IR_FILES := $(INP_FILES:$(INP_DIR)/%.c=$(IR_DIR)/%-mem2reg.ll)

OUTPUT_FILES := $(IR_FILES:$(IR_DIR)/%-mem2reg.ll=$(OUT_DIR)/%-mem2reg.txt)

GEN_SRC = generate_IR.cpp
TARGET = $(GEN_SRC:.cpp=)
GEN_EXE = ./$(TARGET)

OBJS = $(GEN_SRC:.cpp=.o)

all: run
.PHONY: clean run genfiles clean_full dirs

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

dirs:
	mkdir -p $(IR_DIR) $(OUT_DIR)

$(IR_DIR)/%-mem2reg.ll: $(INP_DIR)/%.c | dirs
	/bin/bash compile_to_ir.sh $<

genfiles: $(IR_FILES)

$(OUT_DIR)/%-mem2reg.txt: $(IR_DIR)/%-mem2reg.ll $(TARGET) | dirs
	/bin/bash run_generator.sh "$(GEN_EXE)" $<

run: genfiles $(OUTPUT_FILES)

clean:
	rm -f *.o *~ $(TARGET)

clean_ll: clean
	rm -f $(IR_DIR)/*.ll

clean_full: clean_ll
	rm -f $(OUTPUT_FILES)