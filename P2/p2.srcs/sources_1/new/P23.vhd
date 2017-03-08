----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2017 22:49:30
-- Design Name: 
-- Module Name: P2 - Behavioral
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

entity P2 is
    Port(led    :   out std_logic_vector(15 downto 0);
         sw     :   in std_logic_vector(1 downto 0);
         clk, btnC, btnU, btnR : in std_logic); -- btnC as reset
end P2;

architecture Behavioral of P2 is

begin


end Behavioral;
