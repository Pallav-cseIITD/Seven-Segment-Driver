----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 11:35:02 AM
-- Design Name: 
-- Module Name: timing_circuit_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;


entity timing_circuit_tb is
end timing_circuit_tb;

architecture Behavioral of timing_circuit_tb is
    component timing_circuit 
       Port (
        clk_in : in STD_LOGIC; -- 100 MHz input clock
        mux_select : out STD_LOGIC_VECTOR (1 downto 0); -- Signal for the mux
        anodes : out STD_LOGIC_VECTOR (3 downto 0) -- Anodes signal for display
    );
    end component;
 
    signal clk_in: std_logic := '0';
    signal a : std_logic ;
    signal b : std_logic ;
      signal  c, d, e, f : STD_LOGIC;
      --signal pattern : std_logic_vector(1 downto 0) := "00";
begin
    UUT : timing_circuit port map (clk_in => clk_in , mux_select(0) => a, mux_select(1) => b, anodes(0) => c, anodes(1) => d, anodes(2) => e, anodes(3) => f );
     change_clk: process
        begin
            wait for 5 ns;
            clk_in <= not clk_in;
    end process;
    
end Behavioral;
