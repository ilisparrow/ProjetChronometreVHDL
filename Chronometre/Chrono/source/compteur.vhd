library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur is
	port (
	H, LOADN, CET, RAZN: in std_logic; -- LOADN & RAZN fonctionne à  l'état bas.
	DATA : in std_logic_vector(3  downto 0); -- valeur chargé dans le compteur
	S: out std_logic_vector (3 downto 0) := "0000"; -- sortie	
	RETENUE : out std_logic:='0'); -- Permet de tranmettre la retenue.
end compteur;

architecture arch of compteur is

SIGNAL tmp : std_logic_vector (3 downto 0) := "0001";
SIGNAL retenueEnCours:BOOLEAN :=FALSE;
SIGNAL AHUIT :BOOLEAN :=FALSE;--Permet de s'assurer qu'on ne fait qu'un passage d'impulssion lors de l'incrementation 9

begin
	--S <= "1111";
	
	process (H, RAZN)
		begin
		
		--Remise à 0
		if (RAZN = '0') then
			tmp <= "0000";
		end if;
		
		if tmp = "1001" then 
		AHUIT <= TRUE;
		end if;
		
		--Lorsque tmp = 9 on réinitialise, on rajoute la retenue
		if (tmp = "1010" AND AHUIT) then
		
			tmp <= "0000";
			RETENUE<='1';
			retenueEnCours<=TRUE;
			AHUIT <= FALSE;
			
			if(retenueEnCours=TRUE)then 
			retenueEnCours<=False;
			end if;
			
		end if;
 
		-- Incrémentation, et reinitialisation des variables de retenue
		if (CET = '1' AND rising_edge(H)) then
		
			--if(not retenueEnCours) then
				tmp <= std_logic_vector (unsigned(tmp)+ 1);
				S<=tmp;
				RETENUE<='0';
				--retenueEnCours<=FALSE;
			--end if;
			
		
		end if;
		
		-- Chargement de DATA
		if (LOADN = '0') then
			S <= DATA;
			tmp <= DATA;
		end if;
		end process;
end arch;

