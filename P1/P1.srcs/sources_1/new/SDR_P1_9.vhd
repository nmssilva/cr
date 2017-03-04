

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
--use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SDR_P1 is
    port(led    : out std_logic_vector(15 downto 0);
         sw     : in std_logic_vector(15 downto 0);
         clk,btnU,btnD,btnL,btnR,btnC   : in std_logic); --btnU = clk_ena, btnD = set, btnC = reset
end SDR_P1;

architecture Behavioral of SDR_P1 is
    signal internal_clock : std_logic_vector (26 downto 0);
begin

process(clk)
    variable value : std_logic_vector (15 downto 0);
begin

if btnC = '1' then 
    internal_clock <= (others => '0');
    value := (others => '0');
    led <= value;
end if;

if btnD = '1' then -- set
    value := sw;
    led <= value;
end if;

if btnU='0' then

    if rising_edge(clk) then
                
        internal_clock <= internal_clock+1;
        
    end if;
    
end if;

if rising_edge(internal_clock(26)) then
        
        if btnL = '1' then -- shift left
            value := value(14 downto 0) & '0';
            led <= value;
        end if;
        
        if btnR = '1' then -- shift left
            value := '0' & value(15 downto 1);
            led <= value;
        end if;
        
    end if;

end process;


end Behavioral;
