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

entity SDR_P1_3 is
    port(sw     :   in std_logic_vector(2 downto 0);
         led    :   out std_logic_vector(1 downto 0));
end SDR_P1_3;

architecture Behavioral of SDR_P1_3 is

    signal a,b,c: integer;
    signal result : integer;

begin

    a <= conv_integer(sw(0 downto 0));
    b <= conv_integer(sw(1 downto 1));
    c <= conv_integer(sw(2 downto 2));
    
    result <= a + b + c ;
    
    led <= conv_std_logic_vector(result, 2);

end Behavioral;
