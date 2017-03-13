library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library xil_defaultlib;

entity P1simulation is
end P1simulation;

architecture Behavioral of P1simulation is
    signal sw_in : std_logic_vector(3 downto 0);
    signal seg_in : std_logic_vector(6 downto 0);

component TopTrivial
port (  sw  : in std_logic_vector (3 downto 0);
        seg : out std_logic_vector (6 downto 0));
end component;
begin

uut: TopTrivial
port map (sw => sw_in, led => led_out);

stim_proc: process
begin
    sw_in <= (others => '0'); wait for 100 ns;
    sw_in <= "0001"; wait for 100 ns;
    sw_in <= "0010"; wait for 100 ns;
    sw_in <= "0011"; wait for 100 ns;
    sw_in <= "0100"; wait for 100 ns;
    sw_in <= "0101"; wait for 100 ns;
    sw_in <= "0110"; wait for 100 ns;
    sw_in <= "0111"; wait for 100 ns;
    sw_in <= "1000"; wait for 100 ns;
    sw_in <= "1001"; wait for 100 ns;
    sw_in <= "1010"; wait for 100 ns;
    sw_in <= "1011"; wait for 100 ns;
    sw_in <= "1100"; wait for 100 ns;
    sw_in <= "1101"; wait for 100 ns;
    sw_in <= "1110"; wait for 100 ns;
    sw_in <= "1111"; wait for 100 ns;
end process;

end Behavioral;
