# SystemVerilog Caesar Cipher: RTL Design & Verification

![Language](https://img.shields.io/badge/Language-SystemVerilog-blue) ![Tool](https://img.shields.io/badge/Tool-Xilinx_Vivado-orange) ![Status](https://img.shields.io/badge/Status-Simulation_Verified-success)

An RTL implementation of the classic Caesar cipher, written in SystemVerilog. This project demonstrates foundational digital logic design concepts, focusing on combinational logic, ASCII encoding, modular arithmetic, and behavioral simulation.

##  Overview
This project was developed and verified using the Xilinx Vivado simulation environment. It models a complete transmit-receive pipeline where data is encrypted, passed over a bus, and decrypted using reusable hardware logic. 

##  Features
* **Logic Reusability:** Employs modular arithmetic ($26 - shift$) to use the exact same combinational logic module for both encryption and decryption, demonstrating efficient hardware design.
* **ASCII Bounds Checking:** Intelligently isolates uppercase letters (ASCII `0x41` to `0x5A`). Non-alphabetic characters (spaces, punctuation, lowercase letters) are bypassed unaltered to prevent data corruption.
* **Efficient Wrap-around Logic:** Handles alphabet overflow natively using simple addition and subtraction rather than expensive modulo division operators.
* **Comprehensive Testbench:** Includes a robust SystemVerilog testbench (`tb_encoder.sv`) that verifies dynamic shift changes, boundary conditions, alphabet wrap-arounds, and ignored character handling.

##  Architecture & Modules

* `encoder.sv` (Core Logic)
  * The main functional block. Evaluates the incoming 8-bit ASCII character and applies the shift. Incorporates bounds checking and wrap-around handling.
* `top.sv` (System Wrapper)
  * A top-level module instantiating two `encoder` modules (one acting as the encryptor, the other as the receiver/decryptor) to prove data integrity.
* `encoder_tb.sv` (Verification)
  * The simulation testbench providing structured stimulus. Uses `$monitor` to log real-time transformations of characters as they pass through the logic gates.

##  Tools & Technologies
* **Language:** SystemVerilog
* **Environment:** Xilinx Vivado (Behavioral Simulation)
* **Concepts:** RTL Design, Combinational Logic, Testbench Creation, Hardware Verification

##  Simulation Output
The included testbench successfully verifies the following behaviors in simulation:
1. **Standard Shift:** 'A' with shift 3 encrypts to 'D'.
2. **Alphabet Wrap-around:** 'Z' with shift 3 correctly wraps around to 'C'.
3. **Dynamic Shift Adjustment:** Handles mid-operation key changes.
4. **Data Integrity:** Spaces and out-of-bounds characters are safely ignored.
