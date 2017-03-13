library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.all;
--use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P24 is

    Port(led    :   out std_logic_vector(15 downto 0);
         sw     :   in std_logic_vector(15 downto 0));
end P24;

architecture Behavioral of P24 is
    signal big_right, big_left, big_final: std_logic_vector(3 downto 0);
begin



process(sw)

variable switch_r, switch_l, switch_f: integer range 0 to 12;

begin
     
    
    --check big right
    if sw(3 downto 0) > sw(7 downto 4) then
        big_right <= sw(3 downto 0);
        switch_r:=0;
    elsif sw(3 downto 0) < sw(7 downto 4) then
        big_right <= sw(7 downto 4);
        switch_r:=4;
    else big_right <= sw(7 downto 4); switch_r := 3;
    end if;
    
    --check big left
    if sw(15 downto 12) > sw(11 downto 8) then
        big_right <= sw(15 downto 12);
        switch_l:=12;
    elsif sw(15 downto 12) < sw(11 downto 8) then
        big_right <= sw(11 downto 8);
        switch_r:=8;
    else big_right <= sw(11 downto 8); switch_l := 3;
    end if;
    
    --check big final
    if big_left > big_right then
        big_final <= big_left;
        switch_f := switch_l;
    elsif big_left < big_right then
        big_final <= big_right;
        switch_f := switch_r;
    else switch_f := 3;
    end if;
            
     if big_left = big_right then
        big_final <= "0000";
     end if;
     
     if big_final = "0000" then
        led <= (others => '0');
     else

        case switch_f is
            when 0 => led <= "0000000000001111"; 
            when 4 => led <= "0000000011110000"; 
            when 8 => led <= "0000111100000000"; 
            when 12 => led <= "1111000000000000"; 
            when others => led <= "0000000000000000"; --F
        end case; 
        
     end if;
    
end process;

end Behavioral;
