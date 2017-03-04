----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.02.2017 15:46:14
-- Design Name: 
-- Module Name: SDR_P1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.STD_LOGIC_ARITH.all;
--use ieee.numeric_std.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SDR_P1 is
    port(led    : out std_logic_vector(0 downto 0);
         sw     : in std_logic_vector(15 downto 0));
end SDR_P1;

architecture Behavioral of SDR_P1 is

function is_par ( sw: std_logic_vector(15 downto 0)) return std_logic is
    variable par : std_logic;
begin
    for i in sw'range loop
        par := par xor sw(i);
    end loop;
    return par;
end is_par;

begin
process(sw)
begin
    led <= conv_std_logic_vector(is_par(sw),1);
end process;
end Behavioral;
