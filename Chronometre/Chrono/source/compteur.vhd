library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------
entity compteur is
------------------
	port (
	
	H, LOADN, CET, RAZN: in std_logic; -- LOADN & RAZN fonctionne à  l'état bas.
	DATA : in std_logic_vector(3  downto 0); -- valeur chargé dans le compteur
	S: out std_logic_vector (3 downto 0) := "0000"; -- sortie	
	RETENUE : out std_logic:='0'
	
	); -- Permet de tranmettre la retenue.
------------------
end compteur;
------------------

architecture arch of compteur is

SIGNAL tmp : std_logic_vector (3 downto 0) := "0000";

begin
	
	process (H, RAZN)
	
		begin
		
		--Remise à 0
		if (RAZN = '0') then
			tmp <= "0000";
		end if;
		
		-- Incrémentation, et reinitialisation des variables de retenue
		if rising_edge(H) then 
		
			if (CET = '1') then
				tmp <= std_logic_vector (unsigned(tmp)+ 1);
			end if;
			
			--Lorsque tmp = 9 on réinitialise, on rajoute la retenue
			if (tmp = "1010") then
				tmp <= "0000";
				RETENUE<='1';
				else 
				RETENUE<='0';
			end if;
			
			-- Chargement de DATA
			if (LOADN = '0') then
				tmp <= DATA;
			end if;
		else 
		tmp<=tmp;
		
		end if;
		
		end process;
		
		S <= tmp;
end arch;

