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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SDR_P1 is
  Port (sw      : in    std_logic_vector(15 downto 0);
        btnD    : in    std_logic;
        btnU    : in    std_logic;
        btnL    : in    std_logic;
        btnR    : in    std_logic;
        btnC    : in    std_logic;
        led     : out   std_logic_vector(15 downto 0));
        
end SDR_P1;

architecture Behavioral of SDR_P1 is

begin

led (15 downto 5) <= sw (15 downto 5);
LED(0) <= BTNR; 
LED(1) <= BTND; 
LED(2) <= BTNC; 
LED(3) <= BTNU; 
LED(4) <= BTNL;
end Behavioral;
