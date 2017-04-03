library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ex2 is
    Port ( clk : in STD_LOGIC;
           btnR : in STD_LOGIC;
           btnL : in STD_LOGIC;
           btnC : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex2;

architecture Behavioral of Ex2 is
    -- Signals
    signal min, max, number : std_logic_vector(31 downto 0);
    
begin
 
    maxmin : entity work.max_min
             port map(clk, btnR, max, min);
             
    
    process (btnC, btnL, clk)
    begin
        if rising_edge(clk) then
            if btnL = '1' then
                number <= min;
            elsif btnC = '1' then
                number <= max;
            else
                number <= (others => '0');
            end if;
        end if;
    end process;


    disp : entity work.EightDisplayControl
           port map (clk, number(31 downto 28), number(27 downto 24), number(23 downto 20), number(19 downto 16),
                     number(15 downto 12), number(11 downto 8), number(7 downto 4), number(3 downto 0), an, seg);

end Behavioral;
