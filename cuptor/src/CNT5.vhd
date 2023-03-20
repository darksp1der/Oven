library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity CNT5 is
    Port (start,clk : in std_logic;
	ifo: inout std_logic;
	c: out std_logic
	);
	
end CNT5;

architecture count of CNT5 is
signal count : std_logic_vector(0 to 2);
    begin
      process(ifo,start,clk)
	  begin
		  if(ifo = '1' and start = '0') then
			  ifo <= '0';
			  c <= '1';
		  elsif (ifo = '1' and start = '1') then
          if (clk'event and clk = '1') then 
			  if(count < "101") then
			  count <= count + 1;
			  elsif( count > "100") then 
				  ifo <= '0';
          	  end if;
		  end if; 
		  end if;
	  end process; 
	  
	 
      end count;