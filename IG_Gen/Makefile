CXX = g++
override CXXFLAGS := -Wall -std=c++17 -Werror -pedantic -g -fsanitize=undefined $(CXXFLAGS)

INPUT_DIR = code_data

# Target executable
TARGET =

# For deleting the target
TARGET_DEL =

IR_FILES = $(wildcard $(INPUT_DIR)/*.txt)

# Source files
SRCS = generate_IR.cpp

# Object files
OBJS = $(SRCS:.cpp=.o)

all: run
.PHONY: clean run genfiles

# Rule to link object files into the target executable
$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $(TARGET) $(OBJS)

# Rule to compile .cpp files into .o files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

run: genfiles
	/bin/bash run_generator.sh "$(GEN_EXE)" "$(IR_FILES)"

# Generate all the ir files from the data
genfiles:
	/bin/bash compile_to_ir.sh

# Clean rule to remove generated files
clean:
	rm -f *.o *~ $(TESTDIR)/*.o $(test_files)