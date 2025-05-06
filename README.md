# Multicycle-Arithmetic-Project

🔢 Multicycle ALU Project for Basys3
This project implements a multicycle Arithmetic Logic Unit (ALU) on the Basys3 FPGA board using Verilog. It supports four arithmetic operations and displays the results using a 4-digit 7-segment display and LED indicators.

📌 Features
Multicycle ALU design with datapath and control FSM.

Supported operations:

00 → Addition

01 → Multiplication

10 → Subtraction

11 → Division

Displays result on 7-segment display in decimal (BCD) format.

Shows remainder (for division) using LEDs [3:0].

LED[4] indicates "done" signal when operation is complete.

Operates with input values A and B (4-bit each).

Includes binary-to-BCD conversion and multiplexed 7-segment display controller.

🧩 Module Breakdown
top_alu.v
Integrates datapath, controller, BCD converter, and display.

Handles input/output routing to/from switches, LEDs, and display.

datapath.v
Performs arithmetic operations based on opcode.

Uses control signals (ld_a, ld_b, ld_out) for operation sequencing.

controller.v
FSM-based control unit that sequences operation steps across multiple clock cycles.

bin_to_bcd.v
Converts 8-bit binary result to four BCD digits for display.

seven_seg_display.v
Displays the BCD digits on 7-segment using refresh-based multiplexing.

⚙️ Usage Instructions
Inputs (from Basys3):

A[3:0], B[3:0]: Operands via switches.

opcode[1:0]: Operation selector (00, 01, 10, 11).

go: Start signal (button).

rst: Reset (button).

Outputs:

7-segment display shows result.

LED[3:0]: Remainder (for division).

LED[4]: Done signal (lights up when result is ready).

🎯 Target Platform
Board: Digilent Basys3

Toolchain: Xilinx Vivado

🛠️ Future Improvements
Extend to support signed operations.

Add overflow/underflow detection.

Display remainder on 7-segment as well.

Optimize control FSM for faster operation.

📷 Demo

https://github.com/user-attachments/assets/92a464f0-fa2a-4129-a98a-03530058e90a
