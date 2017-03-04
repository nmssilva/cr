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


library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
--use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SDR_P1 is
    port(led    :   out std_logic_vector(15 downto 0);
         sw     :   in std_logic_vector(1 downto 0);
         clk, btnC : in std_logic); -- btnC as reset
end SDR_P1;

architecture Behavioral of SDR_P1 is
    signal internal_clock : std_logic_vector (26 downto 0);
begin
process(clk)
begin
if sw(0)='1' then
    if rising_edge(clk) then
        if btnC = '1' then 
                internal_clock <= (others => '0');
        else    
            if sw(1) = '0' then
                internal_clock <= internal_clock+1;
            else
                internal_clock <= internal_clock-1;
            end if;                
        end if;
    end if;
end if;
end process;
led(15 downto 0) <= internal_clock(26 downto 11) ;
end Behavioral;
