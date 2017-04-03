library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Iterative_Sorter_FSM is
    Generic (N : integer := 8;
             M : integer := 32);
    Port ( data_in : in STD_LOGIC_VECTOR (N*M-1 downto 0);
           reset : in std_logic;
           clk : in std_logic;
           data_out : out STD_LOGIC_VECTOR (N*M-1 downto 0);
           cont : out STD_LOGIC_VECTOR(15 downto 0));
end Iterative_Sorter_FSM;

architecture Behavioral of Iterative_Sorter_FSM is

    -- Types
    type in_data is array(N-1 downto 0) of std_logic_vector(M-1 downto 0);
    type state is (initial, even, odd, completed);
    
    -- Signals
    signal C_S, N_S : state;
    signal arr, next_arr : in_data;
    signal even_odd, next_even_odd : std_logic;
    signal sorting_completed, next_sorting_completed : std_logic;
    signal counter, next_counter : integer;

begin

    -- Sequential process
    process (clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                C_S <= initial;
                arr <= (others => (others => '0'));
                even_odd <= '0';
                sorting_completed <= '0';
                counter <= 0;
            else
                C_S <= N_S;
                arr <= next_arr;
                even_odd <= next_even_odd;
                sorting_completed <= next_sorting_completed;
                counter <= next_counter;
            end if;
        end if;
    end process;

    -- Combinatory process
    process (arr, even_odd, data_in, sorting_completed, counter)
    begin
        -- Initial step
        N_S <= C_S;
        next_arr <= arr;
        next_even_odd <= even_odd;
        next_sorting_completed <= sorting_completed;
        next_counter <= counter;
        
        -- Evaluate state
        case C_S is 
            when initial =>
                for i in N-1 downto 0 loop
                    next_arr(i) <= data_in(M*(i+1)-1 downto M*i);
                end loop;
                next_sorting_completed <= '0';     
                next_counter <= 0;
                next_even_odd <= '0';
                if even_odd = '0' then
                    N_S <= even;
                else
                    N_S <= odd;
                end if;
                
            when even =>
                N_S <= odd;
                next_even_odd <= '1';
                
                if sorting_completed = '0' then
                    next_counter <= counter + 1;
                    next_sorting_completed <= '1';
                
                    for i in 0 to N/2-1 loop
                        if arr(2*i) < arr(2*i+1) then
                            next_sorting_completed <= '0';
                            next_arr(2*i) <= arr(2*i+1);
                            next_arr(2*i+1) <= arr(2*i);
                        end if;
                    end loop;
                else
                    N_S <= completed;
                end if;
                
            when odd =>
                N_S <= even;
                next_even_odd <= '0';
                
                if sorting_completed = '0' then
                    next_counter <= counter + 1;
                    next_sorting_completed <= '1';
                
                    for i in 0 to N/2-2 loop
                        if arr(2*i+1) < arr(2*i+2) then
                            next_sorting_completed <= '0';
                            next_arr(2*i+1) <= arr(2*i+2);
                            next_arr(2*i+2) <= arr(2*i+1);
                        end if;
                    end loop;
                else
                    N_S <= completed;
                end if;
            
            when completed =>
                N_S <= completed;
            when others =>
                N_S <= initial;
        end case;
    end process;

    process (arr)
    begin
        for i in N-1 downto 0 loop
            data_out(M*(i+1)-1 downto M*i) <= arr(i);
        end loop;
    end process;

    cont <= conv_std_logic_vector(counter, 16);

end Behavioral;
