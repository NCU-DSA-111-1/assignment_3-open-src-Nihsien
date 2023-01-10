CC		= gcc
LD		= gcc
HUFFMAN_PROG	= huffman
ARCD_PROG	= arcd


SRC_DIR		=./src
INC_DIR		=./inc
OBJ_DIR		=./build
BIN_DIR		=./bin

ARCD_INC        = $(INC_DIR)/arcd
HUFFMAN_INC     = $(INC_DIR)/huffman
ARCD_SRC        = $(SRC_DIR)/arcd
HUFFMAN_SRC     = $(SRC_DIR)/huffman
ARCD_INC_LIST   = $(wildcard $(ARCD_INC)/*.h)
HUFFMAN_INC_LIST= $(wildcard $(HUFFMAN_INC)/*.h)
ARCD_SRC_LIST	= $(wildcard $(ARCD_SRC)/*.c)
HUFFMAN_SRC_LIST= $(wildcard $(HUFFMAN_SRC)/*.c)
ARCD_OBJ 	= $(OBJ_DIR)/arcd
HUFFMAN_OBJ	= $(OBJ_DIR)/huffman
ARCD_OBJ_LIST	= $(wildcard $(ARCD_OBJ)/*.o)
HUFFMAN_OBJ_LIST= $(wildcard $(HUFFMAN_OBJ)/*.o)


#INC_LIST  = $(wildcard $(INC_DIR)/*.h)
#SRC_LIST	= $(wildcard $(SRC_DIR)/*.c)
#OBJ_LIST	= $(wildcard $(OBJ_DIR)/*.o)


.PHONY : all clean $(ARCD_PROG) $(HUFFMAN_PROG) compile

all: $(ARCD_PROG) $(HUFFMAN_PROG)

compile:
	$(CC)  $(ARCD_SRC_LIST)  -I $(ARCD_INC) -c
	$(CC)  $(HUFFMAN_SRC_LIST) -I $(HUFFMAN_INC) -c

copy: compile
	@mv $(notdir $(ARCD_SRC_LIST:.c=.o)) $(ARCD_OBJ)/
	@mv $(notdir $(HUFFMAN_SRC_LIST:.c=.o)) $(HUFFMAN_OBJ)/

$(ARCD_PROG): copy
	$(LD) $(ARCD_OBJ_LIST) -o $(BIN_DIR)/$@

$(HUFFMAN_PROG): copy
	$(LD) $(HUFFMAN_OBJ_LIST) -o $(BIN_DIR)/$@

clean:
	rm -f $(BIN_DIR)/$(ARCD_PROG) $(ARCD_OBJ)/*.o
	rm -f $(BIN_DIR)/$(HUFFMAN_PROG) $(HUFFMAN_OBJ)/*.o
