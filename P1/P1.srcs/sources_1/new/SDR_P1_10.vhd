
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
    port(led    : out std_logic_vector(1 downto 0);
         sw     : in std_logic_vector(2 downto 0));
end SDR_P1;

architecture Behavioral of SDR_P1 is

function hamming ( sw: std_logic_vector(15 downto 0)) return integer is
    variable ham : integer;
begin
    ham := 0;
    for i in sw'range loop
        if sw(i) = '1' then
            ham := ham+1;
        end if;
    end loop;
    return ham;
end hamming;

begin
process(sw)
begin
    led <= conv_std_logic_vector(hamming(sw),2);
end process;
end Behavioral;
