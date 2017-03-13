----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08.03.2017 23:46:52
-- Design Name: 
-- Module Name: P2 - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity P2 is
	Port (
    btnD,btnU,btnC :in std_logic;
    sw :in std_logic_vector(15 downto 0);
    led:out std_logic_vector(15 downto 0)
);
end P2;

architecture Behavioral of P2 is
    Port (
        btnC,btnR,btnD,btnU,btnL :in std_logic;
        sw :in std_logic_vector(15 downto 0);
        led :out std_logic_vector(15 downto 0)
);
begin
    signal mult :std_logic_vector(15 downto 0);
    signal add  :std_logic_vector(8 downto 0);
    signal sub  :std_logic_vector(7 downto 0);
    signal div  :std_logic_vector(7 downto 0);
    signal res  :std_logic_vector(7 downto 0);
begin
    process(sw,btnC,btnR,btnD,btnU,btnL)
        begin
        if btnU='1' then
            led(8 downto 0)<=  conv_std_logic_vector(conv_integer(sw(7 downto 0)) mod conv_integer(sw(15 downto 8)),9);
            --led(8 downto 0)<=mod;
        elsif btnD='1' then
            led(8 downto 0)<=conv_std_logic_vector(abs(conv_integer(sw(7 downto 0))),9);
            --led(8 downto 0)<=abs;
        elsif btnC='1' then
            led(8 downto 0)<=conv_std_logic_vector(conv_integer(sw(7 downto 0)) rem conv_integer(sw(15 downto 8)),9);
            --led(8 downto 0)<=res;
        end if;
	end process;
end Behavioral;
