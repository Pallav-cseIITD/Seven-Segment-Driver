----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 10:23:00 AM
-- Design Name: 
-- Module Name: timing_circuit - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity timing_circuit is
    Port (
        clk_in : in STD_LOGIC; -- 100 MHz input clock
        mux_select : out STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
        anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
    );
end timing_circuit;

architecture Behavioral of timing_circuit is
    constant N : integer := 500000;
    signal counter : integer := 0;
    signal new_clk : STD_LOGIC := '0';
    signal copy_mux : STD_LOGIC_VECTOR (1 downto 0) := "00";
 
begin
new_clock: process(clk_in)
  begin  
    if rising_edge(clk_in) then
        counter <= counter + 1;
        if counter > (N / 2) then
            counter <= 0;
            new_clk <= not new_clk;
        end if;
    end if;
  end process;

-- Process 2: Generate multiplexer select signal
  MUX_selection: process(new_clk)
  begin
        if rising_edge(new_clk) then
            copy_mux <= copy_mux + 1;
        end if;
        mux_select <= copy_mux;

  end process;
  
  
  ANODE_select: process(copy_mux)
  begin
    case copy_mux is
      when "00" =>
            anodes <= "1110";
      when "01" =>
            anodes <= "1101";
      when "10" =>
            anodes <= "1011";
      when others =>
            anodes <= "0111";
    end case;
    
  end process;
end Behavioral;
