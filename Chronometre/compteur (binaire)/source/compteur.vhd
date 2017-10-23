library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur is
	port (
	H, LOADN, CET, RAZN: in std_logic;
	DATA : in std_logic_vector(3  downto 0);
	S: out std_logic_vector (3 downto 0) := "0000");	
end compteur;

architecture arch of compteur is

SIGNAL tmp : std_logic_vector (3 downto 0) := "0001";

begin

	process (H, RAZN)
		begin
		
		if (RAZN = '0') then
			tmp <= "0000";
		end if;
		
		if (tmp = "1010") then
			tmp <= "0000";
		end if;
 
		if (CET = '1' AND rising_edge(H)) then
		
			tmp <= std_logic_vector (unsigned(tmp)+ 1);
			S<=tmp;
		
		end if;

		if (LOADN = '0') then
			S <= DATA;
			tmp <= DATA;
		end if;
		
	end process;
end arch;

