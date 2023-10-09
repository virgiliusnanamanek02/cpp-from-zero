OUTPUT_DIR = output
SRC_DIR = src
CPP_FILES = $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES = $(CPP_FILES:$(SRC_DIR)/%.cpp=$(OUTPUT_DIR)/%.o)
EXECUTABLE = $(OUTPUT_DIR)/main

all: $(EXECUTABLE)

$(EXECUTABLE): $(OBJ_FILES) | $(OUTPUT_DIR)
	g++ $(OBJ_FILES) -o $(EXECUTABLE)

$(OUTPUT_DIR)/%.o: $(SRC_DIR)/%.cpp | $(OUTPUT_DIR)
	g++ -c $< -o $@

$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

clean:
	rm -rf $(OUTPUT_DIR)

