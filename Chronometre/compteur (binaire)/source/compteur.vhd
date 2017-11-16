library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur is
	port (
	H, LOADN, CET, RAZN: in std_logic;
	DATA : in std_logic_vector(3  downto 0);
	S: out std_logic_vector (3 downto 0) := "0000";
	RETENUE : out std_logic:='0');	
end compteur;

architecture arch of compteur is

SIGNAL tmp : std_logic_vector (3 downto 0) := "0000";
SIGNAL retenueEnCours: BOOLEAN :=FALSE;

begin

	process (H, RAZN)
		begin
		
		if (RAZN = '0') then
			tmp <= "0000";
		end if;
		
		if rising_edge(H) then 
		
			if (LOADN = '0') then
				S <= DATA;
				tmp <= DATA;
			end if;
			
			if retenueEnCours then
				RETENUE<='0';
				retenueEnCours<=FALSE;
			end if;
		
			if (tmp = "1001") then
				tmp <= "0000";
				RETENUE <= '1';
				retenueEnCours <= TRUE;
			end if;
			
			if (CET = '1') then
				tmp <= std_logic_vector (unsigned(tmp)+ 1);
				S<=tmp;
			end if;
			
		end if;
		
	end process;
end arch;

