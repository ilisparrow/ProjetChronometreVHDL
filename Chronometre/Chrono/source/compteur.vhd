library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------
entity compteur is
------------------
	port (
	
	H, LOADN, CET, RAZN, DECOMPTE: in std_logic; 		-- LOADN & RAZN fonctionne à  l'état bas.
	DATA : in std_logic_vector(3  downto 0); 			-- Valeur à charger dans le compteur.
	S: out std_logic_vector (3 downto 0) := "0000"; 	-- sortie du compteur.
	RETENUE : out std_logic:='0'						
	
	); 
------------------
end compteur;
------------------

--------------------------------
architecture arch of compteur is
--------------------------------

SIGNAL tmp : std_logic_vector (3 downto 0) := "0000";	-- Variable temporaire d'incrémentation du compteur.

begin
	
	process (H, RAZN)
	
		begin
		
		-- Remise à 0.
		
		if (RAZN = '0') then
			tmp <= "0000";
		end if;
		
		-- Incrémentation, et géstion de la retenue sur front montant
		if (rising_edge(H) ) then
		
			if DECOMPTE = '0' then 
				
				-- Si CET est à 1 alors on lance l'incrémentation.
				if (CET = '1') then
					tmp <= std_logic_vector (unsigned(tmp)+ 1);
				end if;
				
				-- Lorsque tmp = 10 on réinitialise sa valeur et on rajoute la retenue.
				if (tmp = "1010") then
					tmp <= "0000";
					RETENUE<='1';
					else 
					RETENUE<='0';		-- Dans les autres cas on s'assure que la retenue est bien à 0.
				end if;
				
				-- Chargement de DATA dans tmp lorsque LOADN est à l'état bas.
				if (LOADN = '0') then
					tmp <= DATA;
				end if;
			
			else 
							-- Si CET est à 1 alors on lance le décomptage.
				if (CET = '1') then
					tmp <= std_logic_vector (unsigned(tmp)- 1);
				end if;
				
				-- Lorsque tmp = 0 on réinitialise sa valeur à 9 et on rajoute la retenue.
				if (tmp = "1111") then
					tmp <= "1001";
					RETENUE<='1';
					else 
					RETENUE<='0';		-- Dans les autres cas on s'assure que la retenue est bien à 0.
				end if;
				
				-- Chargement de DATA dans tmp lorsque LOADN est à l'état bas.
				if (LOADN = '0') then
					tmp <= DATA;
				end if;
			
			end if;
		
		else 
		
			tmp<=tmp;					-- Ligne pour s'assurer que tmp n'est pas défini que sur un front montant.		
			
		end if;
		
		end process;
		
		S <= tmp;					-- On affecte la valeur de la variable temporaire à la sortie du composant.

---------
end arch;
---------

