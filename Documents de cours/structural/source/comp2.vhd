library ieee;
use ieee.std_logic_1164.all;

entity comp2 is
	port (a,b:in std_logic;
		S:out std_logic);
end comp2;

architecture arch of comp2 is
begin
	S<=(a or not(b));
end arch;