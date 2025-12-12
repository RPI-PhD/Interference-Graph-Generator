CXX = g++
override CXXFLAGS := -Wall -std=c++17 -Werror -pedantic -g -fsanitize=undefined -fsanitize=address $(CXXFLAGS)

GEN_SRC = generate_IR.cpp
TARGET = $(GEN_SRC:.cpp=)
OBJS = $(GEN_SRC:.cpp=.o)
IR_DIR  = LLVM_IR
OUT_DIR = output_graph

.PHONY: all clean clean_ll clean_full

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f *.o $(TARGET)

clean_ll: clean
	rm -f $(IR_DIR)/*.ll

clean_full: clean_ll
	rm -f $(OUT_DIR)/*.txt

