library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity CNT30 is
    Port (clk : in std_logic;
		   c: inout std_logic;
           h,ph,ifo: out std_logic);
end CNT30;

architecture count of CNT30 is
   signal count : std_logic_vector(0 to 4);
    begin
      process(clk,c)
	  begin 
		  if (c = '1') then
          if (clk'event and clk = '1') then
			  if (count < "11110") then count <= count + 1;
			  elsif(count > "11101") then
				  ph <= '0';
				  ifo <= '0';
				  c <= '0';
				  h <= '0';
				  end if;
				  
          end if; 
		  end if;
         end process;
		 
      end count;