----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.03.2017 15:39:57
-- Design Name: 
-- Module Name: P21c - Behavioral
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
    Port (sw    :in     std_logic_vector(3 downto 0);
          an    :out    std_logic_vector(7 downto 0);
          seg   :out    std_logic_vector(6 downto 0)   
    );
    
end P2;

architecture Behavioral of P2 is

begin

an<="11111110";
-- an <=(7=>'0', others=>'1');

process (sw)
begin
case sw is
    when "0000" => seg <= "0000001"; --0
    when "0001" => seg <= "1001111"; --1
    when "0010" => seg <= "0010010"; --2
    when "0011" => seg <= "0000010"; --3
    when "0100" => seg <= "1001100"; --4
    when "0101" => seg <= "0100100"; --5
    when "0110" => seg <= "0100000"; --6
    when "0111" => seg <= "0001101"; --7
    when "1000" => seg <= "0000000"; --8
    when "1001" => seg <= "0000100"; --9
    when "1010" => seg <= "0001000"; --A
    when "1011" => seg <= "1100000"; --B
    when "1100" => seg <= "0110001"; --C
    when "1101" => seg <= "1000010"; --D
    when "1110" => seg <= "0110000"; --E
    when others => seg <= "0111000"; --F
end case; 
end process; 

end Behavioral;
