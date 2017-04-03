library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Ex1 is
    Port ( clk : in STD_LOGIC;
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0));
end Ex1;

architecture Behavioral of Ex1 is

    -- Signals
    signal divided_clk : std_logic;
    signal address : std_logic_vector(8 downto 0);
    signal number : std_logic_vector(31 downto 0);
    
    -- LUT component
    component blk_mem_gen_0
        PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
    end component;

begin

    -- Divide clk
    div : entity work.clock_divider
          generic map (26)
          port map (clk, divided_clk);
          
    -- Increment address
    address <= address + 1 when rising_edge(divided_clk);
    
    -- Get value from LUT
    lut : blk_mem_gen_0
          port map (clk, address, number);
          
    -- Show result in displays
    disp : entity work.EightDisplayControl
           port map (clk, number(31 downto 28), number(27 downto 24), number(23 downto 20), number(19 downto 16),
                     number(15 downto 12), number(11 downto 8), number(7 downto 4), number(3 downto 0), an, seg);

end Behavioral;
