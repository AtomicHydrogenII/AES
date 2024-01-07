library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

package MyXOR is 
	component XORGAte is
		port (A, B: in std_logic; Y: out std_logic);
	end component XORGate;
	component AndGAte is
		port (A, B: in std_logic; Y: out std_logic);
	end component AndGate;
	component HA is
		port(A, B: in std_logic; S, C: out std_logic);
	end component HA;
	component FA is
		port(A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component FA;
end package MyXOR;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
entity XORGate is
   port (A, B: in std_logic; Y: out std_logic);
end entity XORGate;

architecture Equations of XORGate is
signal X1, X2, X3, X4: std_logic;
begin
   	

		NAND1: NAND_2 port map(A => A, B => A, Y => X1);
		NAND2: NAND_2 port map(A => B, B => B, Y => X2);
		NAND3: NAND_2 port map(A => X1, B => B, Y => X3);
		NAND4: NAND_2 port map(A => X2, B => A, Y => X4);
		NAND5: NAND_2 port map(A => X3, B => X4, Y => Y);
end Equations;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;

entity ANDGate is
	port(A, B: in std_logic; Y: out std_logic);
end entity ANDGate;

architecture Equations of ANDGate is
	signal X: std_logic;
	begin
		NAND1: NAND_2 port map(A => A, B => B, Y => X);
		NAND2: NAND_2 port map(A => X, B => X, Y => Y);
		
end Equations;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.MyXOR.all;


entity HA is
	port(A, B: in std_logic; S, C: out std_logic);
end entity HA;

architecture Equations of HA is
	begin
		XOR1: XORGate port map(A => A, B => B, Y => S);
		AND1: ANDGate port map(A => A, B => B, Y => C);
		
end Equations;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Gates.all;
use work.MyXOR.all;

entity FA is
	port(A, B, Cin: in std_logic; S, Cout: out std_logic);
end entity FA;

architecture Struct of FA is
	signal X1, X2, X3: std_logic;
	begin
		HA1: HA port map(A => A, B => B, S => X1, C => X2  );
		HA2: HA port map(A => X1, B => Cin, S => S, C => X3 );
		OR1: OR_2 port map(A => X3, B => X2, Y => Cout);
end Struct;
