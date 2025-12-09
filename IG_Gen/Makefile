CXX = g++
override CXXFLAGS := -Wall -std=c++17 -Werror -pedantic -g -fsanitize=undefined -fsanitize=address $(CXXFLAGS)

INP_DIR = code_data
IR_DIR = LLVM_IR
OUT_DIR = output_graph

INP_FILES = $(wildcard $(INP_DIR)/*.c)
IR_FILES = $(wildcard $(IR_DIR)/*-mem2reg.ll)
OUTPUT_FILES = $(wildcard $(OUT_DIR)/*.txt)

# Source files
GEN_SRC = generate_IR.cpp
TARGET = $(GEN_SRC:.cpp=)
GEN_EXE = ./$(TARGET)

# Object files
OBJS = $(GEN_SRC:.cpp=.o)

all: run
.PHONY: clean run genfiles clean_full dirs

# Rule to link object files into the target executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Rule to compile .cpp files into .o files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: dirs $(TARGET) genfiles
	/bin/bash run_generator.sh "$(GEN_EXE)" $(IR_FILES)

# Generate all the ir files from the data
genfiles:
	/bin/bash compile_to_ir.sh $(INP_FILES)

dirs:
	mkdir -p $(IR_DIR) $(OUT_DIR)

# Clean rule to remove generated files
clean:
	rm -f *.o *~ $(TARGET)

clean_full: clean
	rm -f $(IR_DIR)/*.ll $(IR_FILES) $(OUTPUT_FILES)