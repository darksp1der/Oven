library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity cuptor is
	port(
	CLK: in std_logic;
	TS: in std_logic;
	START: in std_logic;
	TMP: in std_logic; 
	H: out std_logic;
	LED: inout std_logic_vector (2 downto 0)
	);
end entity;

architecture structural of cuptor is

component CNT5
	Port(
	start: in STD_LOGIC;
	clk: in STD_LOGIC;
	ifo: inout STD_LOGIC;
	c: out STD_LOGIC
	);
end component;

component CNT30
	Port(
	clk: in STD_LOGIC;
	h: out STD_LOGIC;
	ph: out STD_LOGIC;
	ifo: out STD_LOGIC;
	c: inout STD_LOGIC
	);
end component; 
 

component INCALZITOR
	Port(
	start: in STD_LOGIC;
	clk: in STD_LOGIC;
	tmp: in STD_LOGIC;
	h: out STD_LOGIC;
	ph: out STD_LOGIC;
	ifo: out STD_LOGIC
	);
end component;


begin	

TEMP: INCALZITOR
port map ( start => START, clk => CLK, tmp => TMP, h => H, ph => LED(0), ifo => LED(1));	

NR30: CNT30
port map ( clk => CLK, h => H, ph => LED(0), ifo => LED(1), c => LED(2));

NR5: CNT5
port map ( start => START, clk => CLK, ifo => LED(1), c => LED(2));



end structural;
	
	

