library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity INCALZITOR is
    Port (start,clk,tmp: in std_logic;
           h,ph,ifo: out std_logic);
end INCALZITOR;

architecture count of INCALZITOR is
signal count : std_logic_vector(0 to 4);	
signal ts : std_logic;
    begin
      process(start,clk,tmp)
	  begin	
		  if (start = '1' and ts = '0') then  				  
          	if (clk'event and clk = '1' ) 
				  then count <= count + 1;
				  ph <= '1';
				  h <= '1';
				  if ( tmp = '0' and count > "01001")
					  then ts <= '1';
					  ph <= '0';
					  ifo <= '1';  
				  elsif ( tmp = '1' and count > "10011")
					  then ts <= '1';
					  ph <= '0';
					  ifo <= '1';
			  	  end if;
			  
           end if;
		  end if;
		 
         end process;
		 
      end count;