----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/28/2024 02:46:52 PM
-- Design Name: 
-- Module Name: Four_Bit_1_Digit_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Four_Bit_1_Digit_tb is
--  Port ( );
end Four_Bit_1_Digit_tb;

architecture tb of Four_Bit_1_Digit_tb is
    component Four_Bit_1_Digit
        Port(s1: in STD_LOGIC;
         s2: in STD_LOGIC;
         s3: in STD_LOGIC;
         s4: in STD_LOGIC;
         A: out STD_LOGIC;
         B: out STD_LOGIC;
         C: out STD_LOGIC;
         D: out STD_LOGIC;
         E: out STD_LOGIC;
         F: out STD_LOGIC;
         G: out STD_LOGIC);  
    end component;
    signal s1:  STD_LOGIC := '0' ;
    signal s2:  STD_LOGIC := '0';
    signal s3:  STD_LOGIC := '0';
    signal s4:  STD_LOGIC := '0';
    signal a, b, c, d, e, f,g : std_logic;
begin
    UUT: Four_Bit_1_Digit PORT MAP ( 
    s1 =>s1,
    s2 =>s2,
    s3 => s3,
    S4 => S4,
    A => A ,
    B => B,
    C => C,
    D => D,
    E => E,
    F => F,
    G => G
    );
    S1 <= NOT S1 AFTER 80 NS;
    S2 <= NOT S2 AFTER 40 NS;
    S3 <= NOT S3 AFTER 20 NS;
    S4 <= NOT S4 AFTER 10 NS;
end tb;
