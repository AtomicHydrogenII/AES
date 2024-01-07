library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mux is
	port(i : in  std_logic_vector(7 downto 0); sel: in std_logic;
		  o: out std_logic);
end mux;
	  
architecture bhv of mux is	
	signal output: std_logic;
	begin
	o <= output;
	output <= ((not sel) and i(0)) or (sel and i(1)); 
	
end bhv;