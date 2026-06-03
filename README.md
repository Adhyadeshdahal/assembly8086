# 8086 Assembly Programs

A collection of beginner-friendly 8086 assembly language programs created for microprocessor lab practice. The programs use DOS and BIOS interrupts for console output, keyboard input, screen clearing, cursor positioning, string handling, ASCII conversion, numeric conversion, sequence calculation, and simple table operations.

## GitHub Repository Description

8086 assembly language lab programs covering DOS interrupts, BIOS screen handling, string operations, ASCII conversion, sequences, tables, and basic input/output.

## About

This repository contains small `.asm` programs written using the classic DOS/TASM-style 8086 assembly format:

- `.model small`
- DOS interrupt `int 21h`
- BIOS video interrupt `int 10h`
- Simple data, stack, and code segment usage

These programs are useful for students learning microprocessor fundamentals, 8086 instruction flow, registers, loops, macros, and interrupt-based input/output.

## Programs

| File | Description |
| --- | --- |
| `helloworld.asm` | Displays `Hello World!` using DOS interrupt `21h`. |
| `print.asm` | Takes user input and prints it at a specific screen position. |
| `text.asm` | Reads text from the user, clears the screen, and displays the text. |
| `highlow.asm` | Converts uppercase letters in a string to lowercase. |
| `lowhigh.asm` | Converts lowercase letters in a string to uppercase. |
| `hexbcd.asm` | Adds array elements and displays the result in decimal format. |
| `sequence.asm` | Calculates the sum of an odd-number sequence for 100 terms. |
| `sequenceuser.asm` | Calculates the sum of an odd-number sequence for a user-entered number of terms. |
| `table.asm` | Adds table elements within the range 50 to 150 and displays the decimal result. |
| `table2.asm` | Adds table elements within the range 30 to 100 and displays the hexadecimal result. |
| `10.asm` | Displays ASCII characters from 32 to 127 using BIOS video services. |
| `11.asm` | Converts array values to decimal ASCII and stores/displays the result. |
| `12.asm` | Counts vowels in a user-entered string and displays the count. |
| `13.asm` | Converts vowels in a user-entered string to uppercase. |
| `14.asm` | Converts a user-entered string to uppercase and displays it in a defined screen window. |
| `15.asm` | Converts a user-entered string to lowercase and displays it in a defined screen window. |
| `16.asm` | Moves a user-entered string across the screen with delay. |
| `17.asm` | Generates and displays the multiplication table of a user-entered digit. |

## Requirements

You can run these programs in a DOS environment or emulator with an 8086 assembler, such as:

- DOSBox
- Turbo Assembler, TASM
- Turbo Linker, TLINK

## How to Run

1. Open DOSBox.
2. Mount the folder containing the assembly files.

```dos
mount c path\to\assembly8086
c:
```

3. Assemble and link a program.

```dos
tasm helloworld.asm
tlink helloworld.obj
helloworld.exe
```

Replace `helloworld.asm` with any other file name from this repository.

## Topics Covered

- 8086 registers and memory addressing
- Loops and conditional jumps
- Macros and procedures
- DOS keyboard and display interrupts
- BIOS screen and cursor interrupts
- String manipulation
- ASCII and decimal conversion
- Hexadecimal output
- Array and table processing
- Basic animation using delay

## Notes

These programs are intended for educational use and microprocessor lab practice. They are written for real-mode DOS-style execution and may not run directly in a modern terminal without DOSBox or a similar emulator.
