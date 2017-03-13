----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2017 22:05:45
-- Design Name: 
-- Module Name: P21a - Behavioral
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

entity P2a is
    Port (sw    :in     std_logic_vector(3 downto 0);
          an    :out    std_logic_vector(7 downto 0);
          seg   :out    std_logic_vector(6 downto 0)   
    );
    
end P2a;

architecture Behavioral of P2a is
begin

an<="11111110";
-- an <=(7=>'0', others=>'1');

seg <=  "1000000"   when sw="0000" else 
        "1111001"   when sw="0001" else 
        "0100100"   when sw="0010" else 
        "0110000"   when sw="0011" else 
        "0011001"   when sw="0100" else 
        "0010010"   when sw="0101" else 
        "0000010"   when sw="0110" else 
        "1111000"   when sw="0111" else 
        "0000000"   when sw="1000" else 
        "0010000"   when sw="1001" else 
        "0001000"   when sw="1010" else
        "0000011"   when sw="1011" else
        "1000110"   when sw="1100" else
        "0100001"   when sw="1101" else
        "0000110"   when sw="1110" else 
        "0001110"   when sw="1111" else 
        "1111111";

end Behavioral;