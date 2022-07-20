
# Copyright (c) 2022 ozforester. All rights reserved.
# Use of this source code is goverened by a MIT license
# that can be found in the LICENSE file.

TARGET	 = main
OBJECTS  = $(SOURCES:.S=.o)
OPT = -Os -no-pie -fno-stack-protector -fno-pic -Wall -flto -DF_CPU=8000000LL -mmcu=atmega328p

all:
	avr-gcc -c ${OPT} -o ${TARGET}.o ${TARGET}.S
	avr-gcc  ${OPT} -o ${TARGET} ${TARGET}.o
	avr-objcopy -O ihex ${TARGET} ${TARGET}.hex
	avr-size ${TARGET}.hex

flash:
	avrdude -c usbasp -p atmega328p -B 3 -U flash:w:${TARGET}.hex

clean:
	rm -f $(OBJECTS) $(TARGET) $(TARGET).hex $(TARGET).o
