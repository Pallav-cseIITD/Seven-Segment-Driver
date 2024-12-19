----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 11:29:50 AM
-- Design Name: 
-- Module Name: top_module - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
  Port (
        clk_in : in STD_LOGIC;
        in1 : in STD_LOGIC;
        in2 : in STD_LOGIC;
        in3 : in STD_LOGIC;
        in4 : in STD_LOGIC;
        in5 : in STD_LOGIC;
        in6 : in STD_LOGIC;
        in7 : in STD_LOGIC;
        in8 : in STD_LOGIC;
        in9 : in STD_LOGIC;
        in10 : in STD_LOGIC;
        in11 : in STD_LOGIC;
        in12 : in STD_LOGIC;
        in13 : in STD_LOGIC;
        in14 : in STD_LOGIC;
        in15 : in STD_LOGIC;
        in16 : in STD_LOGIC;
        

        out1 : out STD_LOGIC := '0';
        out2 : out STD_LOGIC := '0';
        out3 : out STD_LOGIC := '0';
        out4 : out STD_LOGIC := '0';
        out5 : out STD_LOGIC := '0';
        out6 : out STD_LOGIC := '0';
        out7 : out STD_LOGIC := '0';
        anode_select : out STD_LOGIC_VECTOR (3 downto 0) := "0000"
    );
end top_module;

architecture Behavioral of top_module is
    component timing_circuit
            Port (
                clk_in : in STD_LOGIC; -- 100 MHz input clock
                mux_select : out STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
                anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
        );
    end component;
    
    component Four_Bit_1_Digit
            Port(    S1: in STD_LOGIC;
                     S2: in STD_LOGIC;
                     S3: in STD_LOGIC;
                     S4: in STD_LOGIC;
                     A: out STD_LOGIC;
                     B: out STD_LOGIC;
                     C: out STD_LOGIC;
                     D: out STD_LOGIC;
                     E: out STD_LOGIC;
                     F: out STD_LOGIC;
                     G: out STD_LOGIC
          );     
    end component;
    
    component fourXone
         Port (
                    sel     : in STD_LOGIC_VECTOR (1 downto 0);
                    d0      : in STD_LOGIC_VECTOR (3 downto 0);
                    d1      : in STD_LOGIC_VECTOR (3 downto 0);
                    d2      : in STD_LOGIC_VECTOR (3 downto 0);
                    d3      : in STD_LOGIC_VECTOR (3 downto 0);
                    mux_out : out STD_LOGIC_VECTOR (3 downto 0)
          );
    end component;
    signal selector : STD_LOGIC_VECTOR (1 downto 0);
    signal curr_num : STD_LOGIC_VECTOR (3 downto 0);
    signal dig1 : STD_LOGIC_VECTOR (3 downto 0) := in1 & in2 & in3 & in4;
    signal dig2 : STD_LOGIC_VECTOR (3 downto 0) := in5 & in6 & in7 & in8;
    signal dig3 : STD_LOGIC_VECTOR (3 downto 0) := in9 & in10 & in11 & in12;
    signal dig4 : STD_LOGIC_VECTOR (3 downto 0) := in13 & in14 & in15 & in16;
begin
    dig1 <= in1 & in2 & in3 & in4;
    dig2 <= in5 & in6 & in7 & in8;
    dig3 <= in9 & in10 & in11 & in12;
    dig4 <= in13 & in14 & in15 & in16; 
    DUT1 : timing_circuit port map (clk_in => clk_in, mux_select => selector, anodes => anode_select);
    DUT2 : fourXone port map (d0 => dig1, d1 => dig2, d2 => dig3, d3 => dig4, sel => selector, mux_out => curr_num);
    DUT3 : Four_Bit_1_Digit port map (S1 => curr_num(0), S2 => curr_num(1), S3 => curr_num(2), S4 => curr_num(3), A => out1, B => out2, C => out3, D => out4, E => out5, F => out6, G => out7);

end Behavioral;
