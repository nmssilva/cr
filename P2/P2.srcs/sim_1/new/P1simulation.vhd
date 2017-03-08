library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library xil_defaultlib;

entity P1simulation is
end P1simulation;

architecture Behavioral of P1simulation is
    signal sw : std_logic_vector(3 downto 0);
    signal seg : std_logic_vector(6 downto 0);
begin
div: entity xil_defaultlib.HW
port map (  sw,
            seg );

stim_proc: process
begin
sw <= (others => '0'); wait for 100 ns;
sw <= "0001"; wait for 100 ns;
sw <= "0010"; wait for 100 ns;
sw <= "0011"; wait for 100 ns;
sw <= "0100"; wait for 100 ns;
sw <= "0101"; wait for 100 ns;
sw <= "0110"; wait for 100 ns;
sw <= "0111"; wait for 100 ns;
sw <= "1000"; wait for 100 ns;
sw <= "1001"; wait for 100 ns;
sw <= "1010"; wait for 100 ns;
sw <= "1011"; wait for 100 ns;
sw <= "1100"; wait for 100 ns;
sw <= "1101"; wait for 100 ns;
sw <= "1110"; wait for 100 ns;
sw <= "1111"; wait for 100 ns;
end process;

end Behavioral;
