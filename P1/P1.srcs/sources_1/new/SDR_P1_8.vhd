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
    port(led    : out std_logic_vector(8 downto 0);
         sw     : in std_logic_vector(15 downto 0);
         btnU,btnD,btnL,btnR,btnC   : in std_logic);
end SDR_P1;

architecture Behavioral of SDR_P1 is
    
    signal result : integer range 0 to 256;
    signal but : std_logic_vector(4 downto 0);

begin
process(but)
begin
but <= btnU & btnD & btnC & btnR & btnL;

case but is

    when "10000" => 
        result <= conv_integer(sw(15 downto 8)) + conv_integer(sw(7 downto 0));
    when "01000" => 
        result <= conv_integer(sw(15 downto 8)) - conv_integer(sw(7 downto 0));
    when "00100" => 
        result <= conv_integer(sw(15 downto 8)) rem conv_integer(sw(7 downto 0));
    when "00010" => 
        result <= conv_integer(sw(15 downto 8)) / conv_integer(sw(7 downto 0));
    when "00001" => 
        result <= conv_integer(sw(15 downto 8)) * conv_integer(sw(7 downto 0));
    when others => 
        result <= 0;
    
end case;

led(8 downto 0) <= conv_std_logic_vector(result, 9);

end process;

end Behavioral;
