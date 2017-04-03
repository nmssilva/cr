library IEEE;	-- greatest common divider of two positive integers	
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;	-- additional libraries	 
use IEEE.STD_LOGIC_UNSIGNED.ALL;	-- for conversion functions

entity Ex5 is   -- circuit with synchronization by one clock edge
	generic(number_of_bits	: integer := 16);
	port (	clk   	: in  STD_LOGIC;
			btnC   	: in  STD_LOGIC;
			sw		: in std_logic_vector(number_of_bits-1 downto 0);  
			led 	: out std_logic_vector(7 downto 0);
			an      : out std_logic_vector(7 downto 0);
			seg     : out std_logic_vector(6 downto 0)
		);
end Ex5;

architecture Behavioral of Ex5 is
	signal A,B,FSM_A, FSM_B, FSM_A_next, FSM_B_next 	: integer range 0 to 255;
	type state_type is (init, run_state); 
	signal C_S, N_S 						: state_type;
	signal Res, Res_next 					: integer range 0 to 255;
	signal result : std_logic_vector(15 downto 0);
	type for_seg_disp is array (1 to 5) of std_logic_vector(3 downto 0); 
    signal digits : for_seg_disp;

begin
A <= conv_integer(sw(15 downto 8));   B <= conv_integer(sw(7 downto 0));
process (clk)  		
	begin						
	if rising_edge(clk) then 
		if (btnC = '1') then 	C_S <= init;
		else		C_S <= N_S;
				FSM_A <= FSM_A_next;
				FSM_B <= FSM_B_next;
				Res <= Res_next;
		end if;
	end if;
end process;

process (C_S, A, B, FSM_A, FSM_B, Res)  -- this is a combinational process    
	begin
		N_S <= C_S;
		FSM_A_next <= FSM_A;
		FSM_B_next <= FSM_B;  
		Res_next <= Res;
	case C_S is
		when init => 
			if ((A = 0) or (B = 0)) then 	Res_next <= 0; 
						N_S <= init;
			else 			FSM_A_next <= A; 
						FSM_B_next <= B; 
						N_S <= run_state;	
			end if;
		when run_state => 
			if (FSM_B>0) then 		N_S <= run_state;
					if (FSM_B>FSM_A) then 	FSM_A_next <= FSM_B; 
							FSM_B_next <= FSM_A;                
					else			FSM_A_next <= FSM_B; 
							FSM_B_next <= FSM_A rem FSM_B;
					end if;
			else 			Res_next <= FSM_A; 
						N_S <= init; 
			end if;
		when others => N_S <= init;
	end case;
end process;

led <= conv_std_logic_vector(Res,8);
result <= conv_std_logic_vector(Res, 16);

-- Display

disp_cont: entity work.EightDisplayControl 
           port map(clk,digits(1),digits(2),digits(3),digits(4),
		            digits(5),"0000","0000","0000",an,seg);


BCD_dec:    entity work.BinToBCD16  
            port map (clk,'0',open,result,digits(5),digits(4),
                      digits(3),digits(2),digits(1));

end Behavioral;