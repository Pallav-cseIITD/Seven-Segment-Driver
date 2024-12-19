----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/06/2024 12:51:33 PM
-- Design Name: 
-- Module Name: top_module_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity top_module_tb is
end top_module_tb;

architecture Behavioral of top_module_tb is
component top_module
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
    end component;
    signal in1  ,in2  ,in3  ,in4  ,in5  ,in6  ,in7  ,in8  ,in9  ,in10  ,in11  ,in12  ,in13  ,in14  ,in15  ,in16, out1 ,out2 ,out3 ,out4 ,out5 ,out6 ,out7, a1, a2, a3, a4 : STD_LOGIC;
    signal clk_in : std_logic := '0';
    signal pattern : std_logic_vector(15 downto 0); 
    begin
        UUT : top_module port map (clk_in => clk_in, in1 => in1,in2 => in2,in3 => in3,in4 => in4,in5 => in5,in6 => in6,in7 => in7,in8 => in8,in9 => in9,in10 => in10,in11 => in11,in12 => in12,in13 => in13,in14 => in14,in15 => in15,in16 => in16, out1 => out1,out2 => out2,out3 => out3,out4 => out4,out5 => out5,out6 => out6,out7 => out7, anode_select(0) => a1, anode_select(1) => a2, anode_select(2) => a3, anode_select(3) => a4);
    change_clk: process
    begin
        wait for 5 ns;
        clk_in <= not clk_in;
        end process;
        stimulus: process
        begin
            for i in 0 to 65535 loop -- 2^16 - 1 = 65535
                pattern <= std_logic_vector(to_unsigned(i, 16)); -- Convert integer to std_logic_vector

                -- Assign individual bits of the pattern to the input signals
                in1  <= pattern(0);
                in2  <= pattern(1);
                in3  <= pattern(2);
                in4  <= pattern(3);
                in5  <= pattern(4);
                in6  <= pattern(5);
                in7  <= pattern(6);
                in8  <= pattern(7);
                in9  <= pattern(8);
                in10 <= pattern(9);
                in11 <= pattern(10);
                in12 <= pattern(11);
                in13 <= pattern(12);
                in14 <= pattern(13);
                in15 <= pattern(14);
                in16 <= pattern(15);

                -- Wait to observe the pattern
                wait for 10 ns;
            end loop;
            
            -- End the simulation
            wait;
        end process;
--        in1 <= '0';
--        in2 <= '0';
--        in3 <= '0';
--        in4 <= '1';
--        in5 <= '0';
--        in6 <= '0';
--        in7 <= '1';
--        in8 <= '0';
--        in9 <= '0';
--        in10 <= '0';
--        in11 <= '1';
--        in12 <= '1';
--        in13 <= '0';
--        in14 <= '1';
--        in15 <= '0';
--        in16 <= '0';
    
end Behavioral;
