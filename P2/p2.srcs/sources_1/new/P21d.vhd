----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2017 21:54:48
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
    if sw = "0000" then seg <= "1000000"; --0
    elsif sw = "0001" then seg <= "1111001"; --1
    elsif sw = "0010" then seg <= "0100100"; --2
    elsif sw = "0011" then seg <= "0110000"; --3
    elsif sw = "0100" then seg <= "0011001"; --4
    elsif sw = "0101" then seg <= "0010010"; --5
    elsif sw = "0110" then seg <= "0000010"; --6
    elsif sw = "0111" then seg <= "1111000"; --7
    elsif sw = "1000" then seg <= "0000000"; --8
    elsif sw = "1001" then seg <= "0001000"; --9
    elsif sw = "1010" then seg <= "0001000"; --A
    elsif sw = "1011" then seg <= "0000011"; --B
    elsif sw = "1100" then seg <= "1000110"; --C
    elsif sw = "1101" then seg <= "0100001"; --D
    elsif sw = "1110" then seg <= "0000110"; --E
    elsif sw = "1111" then seg <= "0001110"; --F
    else seg <= "1111111"; -- desligado
    end if;
end process; 

end Behavioral;