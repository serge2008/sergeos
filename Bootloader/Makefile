ASM = nasm
SRC_dir = src
BUILD_dir = build

$(BUILD_dir)/main_floppy.img: $(BUILD_dir)/main.bin
		cp $(BUILD_dir)/main.bin $(BUILD_dir)/main_floppy.img
		truncate -s 1440k $(BUILD_dir)/main_floppy.img

$(BUILD_dir)/main.bin: $(SRC_dir)/main.asm
		$(ASM) $(SRC_dir)/main.asm -f bin -o $(BUILD_dir)/main.bin