CXX = clang++
CC = clang
CXXFLAGS = -g -std=c++17 -Iinclude -I/opt/homebrew/Cellar/glfw/3.4/include
LDFLAGS = -L/opt/homebrew/Cellar/glfw/3.4/lib -lglfw.3.4 -framework OpenGL -framework Cocoa

TARGET = voxel-engine.exe

CXX_SRC = src/main.cpp
C_SRC = src/core/glad.c
OBJ_CXX = $(CXX_SRC:.cpp=.o)
OBJ_C = $(C_SRC:.c=.o)

all: $(TARGET)

$(OBJ_CXX): $(CXX_SRC)
	$(CXX) $(CXXFLAGS) -c $(CXX_SRC) -o $(OBJ_CXX)

$(OBJ_C): $(C_SRC)
	$(CC) -g -std=c99 -Iinclude -I/opt/homebrew/Cellar/glfw/3.4/include -c $(C_SRC) -o $(OBJ_C)

$(TARGET): $(OBJ_CXX) $(OBJ_C)
	$(CXX) $(OBJ_CXX) $(OBJ_C) $(LDFLAGS) -o $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	rm -f $(OBJ_CXX) $(OBJ_C) $(TARGET)
