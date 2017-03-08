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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P2 is
    generic( how_fast : integer :=30);
    Port(led    :   out std_logic_vector(15 downto 0);
         sw     :   in std_logic_vector(1 downto 0);
         clk, btnC, btnU, btnR, btnL : in std_logic); -- btnC as reset
end P2;

architecture Behavioral of P2 is
    signal internal_clock   :unsigned(how_fast downto 0);
    signal divided_clk      :std_logic;
    signal right            :std_logic := btnU;
    signal positive_reset   :std_logic := btnC;
    signal load_enable      :std_logic := btnR;
    signal clock_enable     :std_logic := btnL;
    signal shift            :std_logic_vector(14 downto 0);
begin

led(15 downto 0) <= shift;

sp1: process(clk)
begin
    if rising_edge(clk) then internal_clock <= internal_clock+1;
    end if;
    if falling_edge(clk) then divided_clk <= internal_clock(internal_clock'left);
    end if;
end process sp1;

sp3: process (divided_clk)
begin
    if clock_enable ='1' then
        if rising_edge(divided_clk) then
            if positive_reset ='1' then shift<=(others=>'0');
            else
                if load_enable ='1' then shift <=sw;
                elsif right = '1' then
                    shift <= shift(2 downto 0) & shift(14 downto 2);
                else
                    shift <= shift(12 downto 0) & shift(14 downto 13);
                end if;
            end if;
        end if;
    end if;
end process sp3;

end Behavioral;
