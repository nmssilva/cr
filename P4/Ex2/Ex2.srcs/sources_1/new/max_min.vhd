library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity max_min is
   port( clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          max_result : out STD_LOGIC_VECTOR (31 downto 0);
          min_result : out STD_LOGIC_VECTOR (31 downto 0));
end max_min;

architecture Behavioral of max_min is
     -- Lut component
   -- signal clk_in : std_logic;
       --   signal number : std_logic_vector(31 downto 0);
         -- signal address :  STD_LOGIC_VECTOR(8 DOWNTO 0);
          signal write : std_logic_vector(31 downto 0);
  
   -- Types
   type state is (run, final);    
   
   -- Signals
   signal C_S, N_S : state;
   signal address, next_address : std_logic_vector(8 DOWNTO 0);--aqui nao deveria ser 8 downto 0 ??? são 512 palavras
   signal max, next_max : std_logic_vector(31 downto 0);
   signal min, next_min : std_logic_vector(31 downto 0);
   signal max_res, min_res, next_max_res, next_min_res : std_logic_vector(31 downto 0);
   signal number : std_logic_vector(31 downto 0);
   
   
   COMPONENT blk_mem_gen_0
                   PORT (
                     clka : IN STD_LOGIC;
                     ena : IN STD_LOGIC;
                     wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
                     addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
                     dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
                     douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
                   );
                 END COMPONENT;
                 

   
begin
    -- Read value from lut
    
     lut : blk_mem_gen_0
       PORT MAP (
         clka => clk,
         ena => '1',
         wea => "0",
         addra => address,
         dina => write,
         douta => number
       );

    -- Sequential process
    process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                C_S <= run;
                address <= (others=> '0');
                max <= (others=> '0');
                min <= (others=> '1');
                max_res <= (others=> '0');
                min_res <= (others=> '1');
            else
                C_S <= N_S;
                address <= next_address;
                max <= next_max;
                min <= next_min;
                max_res <= next_max_res;
                min_res <= next_min_res;
            end if;
        end if;
    end process;

    -- Combinatory process
    process (C_S, address, max, min, max_res, min_res) 
    begin
        -- Initial step
        N_S <= C_S;
        next_address <= address;
        next_max <= max;
        next_min <= min;
        next_max_res <= max_res;
        next_min_res <= min_res;
        
        -- Evaluate state
        case C_S is 
            when run =>
                N_S <= run;
                next_address <= address + 1;
                
                if number > max then
                    next_max <= number;
                end if;
                
                if number < min then
                    next_min <= number;
                end if;
                
                if address = "1111" then
                    N_S <= final;
                end if;
                
            when final =>
                next_max_res <= max;
                next_min_res <= min;
                N_S <= run;
                next_address <= (others=> '0');
                next_max <= (others=> '0');
                next_min <= (others=> '1');
            when others =>
                N_S <= run;
        end case;
    end process;

    -- Put results in the outputs
    max_result <= max_res;
    min_result <= min_res;


end Behavioral;
