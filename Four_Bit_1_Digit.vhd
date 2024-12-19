----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/28/2024 02:25:39 PM
-- Design Name: 
-- Module Name: Four_Bit_1_Digit - Behavioral
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

entity Four_Bit_1_Digit is
    Port(S1: in STD_LOGIC;
         S2: in STD_LOGIC;
         S3: in STD_LOGIC;
         S4: in STD_LOGIC;
         A: out STD_LOGIC;
         B: out STD_LOGIC;
         C: out STD_LOGIC;
         D: out STD_LOGIC;
         E: out STD_LOGIC;
         F: out STD_LOGIC;
         G: out STD_LOGIC);           
end Four_Bit_1_Digit;

architecture Behavioral of Four_Bit_1_Digit is
    signal NS1, NS2, NS3, NS4:STD_LOGIC;
begin
    NS1 <= NOT S1;
    NS2 <= NOT S2;
    NS3 <= NOT S3;
    NS4 <= NOT S4;
    A <= (NS1 AND NS2 AND NS3 AND S4) OR (NS1 AND S2 AND NS3 AND NS4) OR (S1 AND S2 AND NS3 AND S4) OR (S1 AND NS2 AND S3 AND S4);
    B <= (NS1 AND S2 AND NS3 AND S4) OR (S1 AND S2 AND NS3 AND NS4) OR (S2 AND S3 AND NS4) OR (S1 AND S3 AND S4);
    C <= (NS1 AND NS2 AND S3 AND NS4) OR ( S1 AND S2 AND NS3 AND NS4) OR (S1 AND S2 AND S3);
    D <= (NS1 AND NS2 AND NS3 AND S4) OR (NS1 AND S2 AND NS3 AND NS4) OR (S2 AND S3 AND S4) OR (S1 AND NS2 AND S3 AND NS4);
    E <= (NS1 AND S4) OR (NS1 AND S2 AND NS3) OR (NS2 AND NS3 AND S4);
    F <= (NS1 AND NS2 AND S3) OR (NS1 AND NS2 AND S4) OR (NS1 AND S3 AND S4) OR (S1 AND S2 AND NS3 AND S4);
    G <= (NS1 AND NS2 AND NS3 ) OR (NS1 AND S2 AND S3 AND S4) OR ( S1 AND S2 AND NS3 AND NS4);

end Behavioral;