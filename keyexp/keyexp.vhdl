library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyexp is
	port (key: in std_logic_vector(127 downto 0); i_bits: in std_logic_vector(5 downto 0); wprev: in std_logic_vector(63 downto 0) wi:out std_logic_vector (31 downto 0));
end keyexp;

architecture behav of keyexp is
	component rotword is
		port(inp : in  std_logic_vector(31 downto 0);
			outp: out std_logic_vector(31 downto 0));
	end component; 
	component subword is
		port(inp : in  std_logic_vector(31 downto 0);
			outp: out std_logic_vector(31 downto 0));
	end component; 
	component rcon is
		port(inp : in  std_logic_vector(31 downto 0);
			outp: out std_logic_vector(31 downto 0));
			
	
	
	begin
		
		
		expand: process (in, w)
			variable i : INTEGER := to_integer(unsigned(i_bits));
			variable temp: std_logic_vector (31 downto 0):= temp(63 downto 32);
			begin
				if (i rem 4 = 0) then
				
	

