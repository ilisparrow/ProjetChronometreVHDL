library ieee;
use ieee.std_logic_1164.all;

-------------------
entity chrono_tb is 
-------------------
-------------------
end chrono_tb;
-------------------

----------------------------------
architecture bench of chrono_tb is
----------------------------------

--Variables qui gereront les incrementations temporels
--Signal CENT,Dix,SEC,SecDix : std_logic_vector (3 downto 0) ;

-- Variables de test des temps.
Signal TEST,TESTDeux,testTrois,testQuatre,ADATA : std_logic_vector(3  downto 0);

-- Variables de gestion affichage.
signal aff_CENTIEMES, aff_DIXIEMES, aff_SEC, aff_DIX_SEC : std_logic_vector (6 downto 0);

-- Variables que l'on souhaite modifier pour la simulation.
signal CHRONO_RAZN,CHRONO_LOADN,CHRONO_H,testTick : std_logic;

-- Arret de la boucle infinie controlant l'horloge.
signal stopclock : boolean;

begin

	-- Mapping/Liaison des valeurs entre testbench et description principale.
	M: entity work.chrono(arch) port map (

		aff_CENTIEMES => aff_CENTIEMES,
		aff_DIXIEMES => aff_DIXIEMES,
		aff_SEC => aff_SEC,
		aff_DIX_SEC => aff_DIX_SEC,
		CHRONO_RAZN => CHRONO_RAZN,
		CHRONO_LOADN => CHRONO_LOADN,
		TEST => TEST,
		testTrois=>testTrois,
		testQuatre=>testQuatre,
		testdeux=>testDeux,
		testTick=>testTick,
		CHRONO_H => CHRONO_H

	);

	-- Gestion de l'horloge.
	process
		begin
		
			while not stopclock loop
			  CHRONO_H <= '0';
			  wait for 5 ns;
			  CHRONO_H <= '1';
			  wait for 5 ns;
			end loop;
		wait;
	end process;
	
	-- Process principal du testbench (initialisation des valeurs, timing ...)
	process
		begin

			--CHRONO_CET <= '1';
			CHRONO_RAZN <= '1';
			CHRONO_LOADN <= '1';
			--ADATA <="0111";

			wait for 200000 NS;
			stopclock <= TRUE;
		wait;
	end process;

----------
end bench;
----------