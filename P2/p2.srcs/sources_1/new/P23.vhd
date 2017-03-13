library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
--use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P23 is
    generic( how_fast : integer :=26);
    Port(led    :   out std_logic_vector(15 downto 0);
         sw     :   in std_logic_vector(15 downto 0);
         clk, btnC, btnU, btnR, btnL : in std_logic); -- btnR as set, btnC as reset, btnL as clkEnable, btnU as shiftRight
end P23;

architecture Behavioral of P23 is

    signal internal_clock: std_logic_vector(how_fast downto 0);
    signal shift: std_logic_vector(15 downto 0);
begin

led(15 downto 0) <= shift;

sp1: process(clk)
begin
    if rising_edge(clk) then internal_clock <= internal_clock+1;
    end if;
    
    if btnL ='0' then
            if rising_edge(internal_clock(internal_clock'left)) then
                if btnC ='1' then shift<=(others=>'0');
                else
                    if btnR ='1' then shift <= sw;
                    elsif btnU = '1' then
                        shift <= shift(1 downto 0) & shift(15 downto 2);
                    else
                        shift <= shift(13 downto 0) & shift(15 downto 14);
                    end if;
                end if;
            end if;
        end if;
            
end process sp1;

    

end Behavioral;
