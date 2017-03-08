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
    when "0000" => segments := "1000000"; -- 0
    when "0001" => segments := "1111001"; -- 1
    when "0010" => segments := "0100100"; -- 2
    when "0011" => segments := "0110000"; -- 3
    when "0100" => segments := "0011001"; -- 4
    when "0101" => segments := "0010010"; -- 5
    when "0110" => segments := "0000010"; -- 6
    when "0111" => segments := "1111000"; -- 7
    when "1000" => segments := "0000000"; -- 8
    when "1001" => segments := "0010000"; -- 9
    when "1010" => segments := "0001000"; -- a
    when "1011" => segments := "0000011"; -- b
    when "1100" => segments := "1000110"; -- c
    when "1101" => segments := "0100001"; -- d
    when "1110" => segments := "0000110"; -- e
    when "1111" => segments := "0001110"; -- f
    when others => segments := "1111111"; -- todos os segmentos estão desligados
end case
; 
end process
; 

end Behavioral;
