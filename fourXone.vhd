----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 11:32:35 AM
-- Design Name: 
-- Module Name: fourXone - Behavioral
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

entity fourXone is
    Port (
        sel     : in STD_LOGIC_VECTOR (1 downto 0);
        d0      : in STD_LOGIC_VECTOR (3 downto 0);
        d1      : in STD_LOGIC_VECTOR (3 downto 0);
        d2      : in STD_LOGIC_VECTOR (3 downto 0);
        d3      : in STD_LOGIC_VECTOR (3 downto 0);
        mux_out : out STD_LOGIC_VECTOR (3 downto 0)
    );
end fourXone;

architecture Behavioral of fourXone is
begin
    process(sel, d0, d1, d2, d3)
    begin
        case sel is
            when "00" => mux_out <= d0;
            when "01" => mux_out <= d1;
            when "10" => mux_out <= d2;
            when "11" => mux_out <= d3;
            when others => mux_out <= "0000";
        end case;
    end process;
end Behavioral;
