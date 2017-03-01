----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2017 15:46:14
-- Design Name: 
-- Module Name: SDR_P1 - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SDR_P1_3 is

  Port (sw      : in    std_logic_vector(2 downto 0);
        led     : out   std_logic_vector(15 downto 0));
        
end SDR_P1_3;

architecture Behavioral of SDR_P1_3 is

signal temp : std_logic_vector(1 downto 0);

begin
    add: process(temp)
    begin
        temp <= sw(0) + sw(1) + sw(2);
    end process add;
    led <= temp;

        
        
end Behavioral;
