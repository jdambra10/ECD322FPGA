--------------------------------------
-- Code to test FPGA programming
--
-- Simple code to drive LED1
--------------------------------------

library ieee;
use ieee.std_logic_1164.all;

--------------------------------------

entity led_switch is
port(
	LED1: out std_logic;
	SW: in std_logic
);
end led_switch;

---------------------------------------


architecture Behavioral of led_switch is

COMPONENT SB_IO_OD IS
GENERIC(
PIN_TYPE : std_logic_vector(5 downto 0) := "011000"; --non_registered, with input
IO_STANDARD: string := "SB_LVCMOS"
);
PORT(
PACKAGEPIN : out std_logic;
LATCHINPUTVALUE : in std_logic;
CLOCKENABLE : in std_logic;
INPUTCLK : in std_logic;
OUTPUTCLK : in std_logic;
OUTPUTENABLE : in std_logic;
DOUT0 : in std_logic;
DOUT1 : in std_logic;
DIN0 : out std_logic;
DIN1 : out std_logic
);
END COMPONENT SB_IO_OD;

signal led : std_logic:= '0';
signal switch : std_logic;

begin

process(switch)
  begin
   if switch = '1' then
     led <= '1'; -- turn on the LED
   else
     led <= '0'; -- turn off the LED
   end if;
  end process;

switch <= SW;

LED_COMPONENT: SB_IO_OD port map ( PACKAGEPIN => LED1,
LATCHINPUTVALUE => '0',
CLOCKENABLE => '0',
INPUTCLK => '0',
OUTPUTCLK => '0',
OUTPUTENABLE => '1',
DOUT0 => led,
DOUT1 => '0' --no ddr
);

end Behavioral;
