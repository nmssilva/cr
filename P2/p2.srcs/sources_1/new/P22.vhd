----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2017 22:28:37
-- Design Name: 
-- Module Name: P22 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;

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
          seg   :out    std_logic_vector(6 downto 0);
          mclk, clr : in std_logic;
    );
end P2;

architecture Behavioral of P2 is
    signal q : std_logic_vector (26 downto 0);
begin
process (mclk, clr)
begin
    if clr = '1' then
        q <= X"000000";
    elsif mclk'event and mclk = '1' then
        q <= q + 1;
    end if;
end process;



an<="11111110";
-- an <=(7=>'0', others=>'1');

with q(4 downto 0) select seg <=  "0000001" when "0000", 
                                  "1001111" when "0001", 
                                  "0010010" when "0010", 
                                  "0000010" when "0011", 
                                  "1001100" when "0100", 
                                  "0100100" when "0101", 
                                  "0100000" when "0110", 
                                  "0001101" when "0111", 
                                  "0000000" when "1000", 
                                  "0000100" when "1001", 
                                  "0001000" when "1010",
                                  "1100000" when "1011",
                                  "0110001" when "1100",
                                  "1000010" when "1101",
                                  "0110000" when "1110", 
                                  "0111000" when others;

end Behavioral;
