library ieee;
use ieee.std_logic_1164.all;

entity chrono_tb is 
end chrono_tb;

architecture bench of chrono_tb is

--Variables qui gereront les incrementations temporels
--Signal CENT,Dix,SEC,SecDix : std_logic_vector (3 downto 0) ;

--Variables mémoire
Signal TEST,TESTDeux,testTrois,testQuatre,ADATA : std_logic_vector(3  downto 0);

--Variable gestion affichaque
signal aff_CENTIEMES, aff_DIXIEMES, aff_SEC, aff_DIX_SEC : std_logic_vector (6 downto 0);

--LOADN : gestion chargemenet valeur; CET : gestion départ/arret, H : Horloge
signal CHRONO_RAZN,CHRONO_LOADN,CHRONO_CET,CHRONO_H : std_logic;

--Arret boucle infinie
signal stopclock : boolean;

begin

	M: entity work.chrono(arch) port map (

		aff_CENTIEMES => aff_CENTIEMES,
		aff_DIXIEMES => aff_DIXIEMES,
		aff_SEC => aff_SEC,
		aff_DIX_SEC => aff_DIX_SEC,
		CHRONO_RAZN => CHRONO_RAZN,
		CHRONO_LOADN => CHRONO_LOADN,
		CHRONO_CET => CHRONO_CET,
		TEST => TEST,
		testTrois=>testTrois,
		testQuatre=>testQuatre,
		testdeux=>testDeux,
		CHRONO_H => CHRONO_H

	);

	process
		begin
		
			while not stopclock loop
			  CHRONO_H <= '0';
			  wait for 10 ns;
			  CHRONO_H <= '1';
			  wait for 10 ns;
			end loop;
		wait;
	end process;

	process
		begin

			CHRONO_CET <= '1';
			CHRONO_RAZN <= '1';
			CHRONO_LOADN <= '1';
			ADATA <="0111";

			wait for 20000 NS;
			stopclock <= TRUE;
		wait;
	end process;


end bench;
