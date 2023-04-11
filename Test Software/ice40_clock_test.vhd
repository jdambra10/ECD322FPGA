--------------------------------------
-- Code to test FPGA programming
--
-- Simple code to output the clock on a GPIO pin
--------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------

entity LED_on is
port(
	PMOD1: out std_logic;
	CLK2: in std_logic
);
end LED_on;

---------------------------------------



architecture Behavioral of LED_on is


signal pmod : std_logic:= '1';

begin

process(CLK2)
begin
if rising_edge(CLK2) then
	pmod <= not pmod;
end if;
end process;

PMOD1 <= pmod;

end Behavioral;
