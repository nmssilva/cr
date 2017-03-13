library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity TopTrivial is
port ( sw : in std_logic_vector (15 downto 0);
led : out std_logic_vector (15 downto 0));
end TopTrivial;
architecture Behavioral of TopTrivial is
begin
led <= sw;
end Behavioral;