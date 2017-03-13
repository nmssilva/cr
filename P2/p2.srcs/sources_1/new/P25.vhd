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

entity P25 is

    Port(led    :   out std_logic_vector(15 downto 0);
         sw     :   in std_logic_vector(15 downto 0);
         an     :   out std_logic_vector(7 downto 0);
         seg    :   out std_logic_vector(6 downto 0);
         clk,btnL,btnC,btnR    :   in std_logic);
end P25;

architecture Behavioral of P25 is

    signal internal_clock : std_logic_vector (26 downto 0);
    signal but  : std_logic_vector(2 downto 0);
    signal sel  : std_logic_vector(1 downto 0);
    
    function bin_to_seg (input : std_logic_vector(3 downto 0)) return std_logic_vector is
    variable segments : std_logic_vector(6 downto 0);
    begin
    case(input) is
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
    end case;
    return segments;
    end bin_to_seg;
    
begin

process(clk)

    variable result: integer;
    
begin

    but <= btnL & btnC & btnR;
    
    if rising_edge(clk) then
        internal_clock <= internal_clock + 1;
    end if;
    
    if rising_edge(internal_clock(17)) then
        if but = "100" then
            result := conv_integer(sw(15 downto 8)) mod conv_integer(sw(7 downto 0));
        end if;
        
        if but = "010" then
            result := abs conv_integer(sw(7 downto 0));
        end if;
        
        if but = "001" then
            result := conv_integer(sw(15 downto 8)) rem conv_integer(sw(7 downto 0));
        end if;
        
        led <= conv_std_logic_vector(result,16);
        
        sel <= sel + 1;
        
        if sel = "00" then
            an <= "11111110";
        elsif sel = "01" then
            an <= "11111101";
        elsif sel = "10" then
            an <= "11111011";
        elsif sel = "11" then
            an <= "11110111";
        end if;
        
    end if;
    
        
end process;

seg <= bin_to_seg(sw(conv_integer(sel)*4+3 downto conv_integer(sel)*4));

end Behavioral;
