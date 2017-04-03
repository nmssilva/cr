library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity TopTrivial is
    Port ( clk			: in std_logic;
				sw 		: in  STD_LOGIC_VECTOR (15 downto 0);
			  seg			: out std_logic_vector(6 downto 0);
			  an	: out std_logic_vector(7 downto 0);
			  btnU		: in std_logic;
			  btnD		: in std_logic;
			  btnL		: in std_logic;
			  btnR		: in std_logic;
			  btnC		: in std_logic
			  );
end TopTrivial;

architecture Behavioral of TopTrivial is

signal	divided_clk	: std_logic;

type for_seg_disp is array (1 to 5) of std_logic_vector(3 downto 0); 
signal	digits : for_seg_disp;
signal result : std_logic_vector(15 downto 0);

begin

	process(sw, btnU, btnD, btnC, btnL, btnR)
		begin
			if btnU='1' then
				result <="0000000" & (('0' & sw(15 downto 8)) + ('0' & sw(7 downto 0)));
			elsif btnC='1' then
				result <="0000000" & ('0' & sw(15 downto 8)) - ('0' & sw(7 downto 0));
			elsif btnD = '1' then
				result <= sw(15 downto 8) * sw(7 downto 0);
			elsif btnL='1' then
				result <= conv_std_logic_vector((conv_integer(sw(15 downto 8)) / conv_integer(sw(7 downto 0))), result'length);
			elsif btnR = '1' then
				result <= conv_std_logic_vector((conv_integer(sw(15 downto 8)) rem conv_integer(sw(7 downto 0))), result'length);
			else
				result <= "0000000000000000";
			end if;
	end process;

div			:	entity work.clock_divider 
				port map	( 	clk, '0', divided_clk);
				
				
DispCont		:	entity work.EightDisplayControl		
				port map(clk,	digits(1),digits(2),digits(3),digits(4),
									digits(5),"0000","0000","0000",an,seg);

binTO_BCD		: entity work.BinToBCD16
					port map ( clk,'0',open,result,digits(5),digits(4),digits(3),digits(2),digits(1));

end Behavioral;