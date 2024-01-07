library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.MyXOR.all;

entity FourBitAdder is
	port(A, B: in std_logic_vector (7 downto 0); S: out std_logic_vector (7 downto 0));
end entity FourBitAdder;

architecture Struct of FourBitAdder is
	signal C: std_logic_vector (7 downto 0);
	begin
		adder: for i in 0 to 7 generate
			if (i = 0) then
				assign: FA port map(A => A(i), B => B(i), Cin => '0', S => S(i), Cout =>
		
end Struct;