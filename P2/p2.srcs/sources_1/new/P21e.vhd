----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2017 22:32:33
-- Design Name: 
-- Module Name: P21e - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P2 is
    Port (sw    :in     std_logic_vector(3 downto 0);
      an    :out    std_logic_vector(7 downto 0);
      seg   :out    std_logic_vector(6 downto 0)   
);   
end P2;

architecture Behavioral of P2 is
    type for_test is array (0 to 15) of std_logic_vector(15 downto 0);
    constant for_ex : for_test:=("0000001", "1001111", "0010010", "0000010", "1001100", "0100100", "0100000", "0001101", "0000000", "0000100",  "0001000", "1100000", "0110001", "1000010", "0110000", "0111000");
begin

seg <= for_ex(conv_integer(sw));

end Behavioral;
