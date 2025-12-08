CXX = g++
override CXXFLAGS := -Wall -std=c++17 -Werror -pedantic -g -fsanitize=undefined $(CXXFLAGS)

# Target executable
TARGET =

# For deleting the target
TARGET_DEL =

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

# Rule to run the executable
run: $(TARGET)
	$(TARGET)

# Clean rule to remove generated files
clean:
	del $(TARGET_DEL) $(OBJS)