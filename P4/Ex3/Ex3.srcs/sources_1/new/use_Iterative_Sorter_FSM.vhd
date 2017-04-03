library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity use_Iterative_Sorter_FSM is
    Port ( clk : in STD_LOGIC;
           btnC : in STD_LOGIC;
           sw : in std_logic_vector(2 downto 0);
           an : out STD_LOGIC_VECTOR (7 downto 0);
           seg : out STD_LOGIC_VECTOR (6 downto 0);
           led : out std_logic_vector(15 downto 0));
end use_Iterative_Sorter_FSM;

architecture Behavioral of use_Iterative_Sorter_FSM is
    
    -- Types
    
    -- Component
    component blk_mem_gen_0
      PORT (
        clka : IN STD_LOGIC;
        addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
        douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
      );
    END component;
    
    -- Signals
    signal addr : STD_LOGIC_VECTOR(8 DOWNTO 0);
    signal big_number, res : std_logic_vector(32*8-1 downto 0);
    signal number_display : std_logic_vector(31 downto 0);
    signal number : std_logic_vector(31 downto 0);
    signal cont : std_logic_vector(15 downto 0);
    
begin

    -- Build big data
    lut : blk_mem_gen_0
          port map (clk, addr, number);
          
    process (clk)
    begin
        if rising_edge(clk) then
            big_number(32*(conv_integer(addr)+1)-1 downto 32*conv_integer(addr)) <= number;
            addr <= addr + 1;
        end if;
    end process;

    -- Sort
    sort : entity work.Iterative_Sorter_FSM
           generic map (8, 32)
           port map (big_number, btnC, clk, res, cont);
           
    -- Choose number to see in displays
    process (sw)
    begin   
        case sw is
            when "000" => number_display <= res(255 downto 224);
            when "001" => number_display <= res(223 downto 192);
            when "010" => number_display <= res(191 downto 160);
            when "011" => number_display <= res(159 downto 128);
            when "100" => number_display <= res(127 downto 96);
            when "101" => number_display <= res(95 downto 64);
            when "110" => number_display <= res(63 downto 32);
            when "111" => number_display <= res(31 downto 0);
            when others => number_display <= (others => '0');
        end case;
    end process;

    -- Disp
    disp : entity work.EightDisplayControl
           port map (clk, number_display(31 downto 28), number_display(27 downto 24), number_display(23 downto 20), number_display(19 downto 16),
                          number_display(15 downto 12), number_display(11 downto 8), number_display(7 downto 4), number_display(3 downto 0), an, seg);

    led <= cont;

end Behavioral;
