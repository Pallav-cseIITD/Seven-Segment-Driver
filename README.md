# Seven-Segment-Driver
**Seven Segment Display Driver for Basys3 FPGA Board**

**Introduction**  
This project involves designing and implementing a circuit on the Basys3 FPGA board to display a 4-digit decimal or hexadecimal number using its 4 seven-segment displays. Each digit is represented as a 4-bit number input from the board's switches. The circuit drives all displays simultaneously by cycling through them at a suitable refresh rate.

**Problem Description**

1.  **Seven Segment Decoder**:
    -   Design a combinational circuit to convert a 4-bit binary input into a 7-bit output for the seven-segment display.
    -   The circuit should activate appropriate LEDs on the display to represent the corresponding decimal or hexadecimal digit.
    -   Inputs come from the slider switches on the Basys3 board.
    -   Outputs drive the seven cathode pins of the display.
2.  **Driving Four Displays**:
    -   Extend the design to drive all 4 displays on the Basys3 board.
    -   Only one display is active at a time, controlled via its anode signal, while the cathode signals are shared.
    -   Cycle through the displays at a refresh rate between 1kHz and 60Hz to avoid flickering.
    -   Implement a timing circuit to generate the refresh clock and control anode signals.

**Solution Approach**

1.  **Seven Segment Decoder**:
    -   **Truth Table and Logic Minimization**:
        -   Create a truth table mapping 4-bit inputs to 7-bit outputs.
        -   Use logic minimization techniques to derive equations for the output signals.
    -   **Implementation**:
        -   Write the logic in VHDL using elementary operations (AND, OR, NOT) without case or if-else statements.
2.  **Driving Four Displays**:
    -   **Multiplexer Module**:
        -   Implement a 4:1 multiplexer to select inputs for each display.
    -   **Timing Circuit**:
        -   Divide the 100MHz onboard clock to generate a refresh clock signal.
        -   Use a counter to cyclically activate the anode signals and select the corresponding multiplexer input.
    -   **Implementation in VHDL**:
        -   Write separate process blocks for clock division, anode signal control, and multiplexer select signal generation.

**Key Components**

1.  **Combinational Logic**:
    -   Minimizes logic gates for efficient seven-segment decoding.
2.  **Clock Divider**:
    -   Reduces the 100MHz clock to a suitable frequency (1kHz to 60Hz).
3.  **Multiplexer and Anode Driver**:
    -   Controls which display is active and ensures the correct input is shown.

**Expected Results**

-   Each of the 4 displays shows its respective digit without overlap or flicker.
-   Refresh rate ensures stable and clear display output.

**References**

-   Basys3 Reference Manual
-   IEEE VHDL Reference Manual
-   Online VHDL Simulators
