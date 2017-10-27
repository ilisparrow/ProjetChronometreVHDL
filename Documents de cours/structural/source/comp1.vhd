library ieee;
use ieee.std_logic_1164.all;

entity comp1 is
	port (a,b,c:in std_logic;
		S:out std_logic);
end comp1;

architecture arch of comp1 is
begin
	S<=(a and b)or c;
end arch;