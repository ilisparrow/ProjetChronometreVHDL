library ieee;
use ieee.std_logic_1164.all;

--Faire une description structurale du chronomètre

entity chrono is 
port(

--Declaration des E/S
--Variables de débuggage

--test,testDeux,testTrois,testQuatre : out std_logic_vector (3 downto 0) := "0000";			testTick : out std_logic;



--Variables affichage 7 segment

aff_CENTIEMES, aff_DIXIEMES, aff_SEC, aff_DIX_SEC : out std_logic_vector (6 downto 0);

--Variables compteurs
--CHRONO_LOADN : gestion chargement valeur
--CHRONO_CET : gestion départ/arret
--CHRONO_H : Horloge

CHRONO_H, CHRONO_LOADN,CHRONO_RAZN,STOP: in std_logic

);

--process avec H de T=10 ms
end chrono;

architecture arch of chrono is
--Variables qui gereront les incrementations temporels
Signal CENTIEMES,DIXIEMES,SEC,DIX_SEC : std_logic_vector (3 downto 0) ;
--Variables mémoire
Signal ADATA : std_logic_vector(3  downto 0);

--Variables intérmediaire de retenue
SIGNAL RETENUE_CENTIEMES_TMP : std_logic:='0';
SIGNAL RETENUE_DIXIEMES_TMP : std_logic:='0';
SIGNAL RETENUE_SEC_TMP : std_logic:='0';
SIGNAL RETENUE_DIX_SEC_TMP : std_logic:='0';
SIGNAL CHRONO_CET : std_logic;

SIGNAL  TICK1US,         TICK10US ,       TICK1MS,         TICK1S : std_logic; 



--Déclaration des composants, afficheur et compteur

component afficheur port (	
A: in std_logic_vector (3 downto 0);	
B0, B1, B2, B3, B4, B5, B6 : out std_logic); 
end component;

component fdiv   port ( 
		 CLK      : in  std_logic;         -- System Clock
         RST      : in  std_logic;         -- Asynchronous Reset Active High
         TICK1US  : out std_logic;         -- Tick every  1 us
         TICK10US : out std_logic;         -- Tick every 10 us
         TICK1MS  : out std_logic;         -- Tick every  1 ms
		 TICK10MS : out std_logic;         -- Tick every  10 ms
         TICK1S   : out std_logic          -- Tick every  1 sec
      );
end component;
	  
component compteur	port (	
		H, LOADN, CET, RAZN: in std_logic;	
		DATA : in std_logic_vector(3  downto 0);	
		S: out std_logic_vector (3 downto 0);
		RETENUE : out std_logic); 
end component;

begin
	
			horloge : fdiv port map (CLK=>CHRONO_H, RST=>STOP,TICK1US=>TICK1US,TICK10US=>TICK10US,TICK1MS=>TICK1MS, TICK10MS=>CHRONO_CET, TICK1S=>TICK1S);
			
			
			compteurCENTIEMES : compteur port map (H=>CHRONO_H, RAZN=>CHRONO_RAZN, LOADN=>CHRONO_LOADN, CET=>CHRONO_CET, DATA=>ADATA, RETENUE=>RETENUE_CENTIEMES_TMP, S=>CENTIEMES);
			
			compteurDIXIEMES :  compteur port map (H=>CHRONO_H, RAZN=>CHRONO_RAZN, LOADN=>CHRONO_LOADN, CET=>RETENUE_CENTIEMES_TMP, DATA=>ADATA, RETENUE=>RETENUE_DIXIEMES_TMP, S=>DIXIEMES);
			
			compteurSEC :       compteur port map (H=>CHRONO_H, RAZN=>CHRONO_RAZN, LOADN=>CHRONO_LOADN, CET=>RETENUE_DIXIEMES_TMP, DATA=>ADATA, RETENUE=>RETENUE_SEC_TMP, S=>SEC);
			
			compteurSEC_DIX :   compteur port map (H=>CHRONO_H, RAZN=>CHRONO_RAZN, LOADN=>CHRONO_LOADN, CET=>RETENUE_SEC_TMP, DATA=>ADATA, RETENUE=>RETENUE_DIX_SEC_TMP, S=>DIX_SEC);
			
			
			--AFFICHAGE des valeurs avec en entree la valeur pour A (en bus), qu'on trouve en sortie de compteur, et en B l'assignation necessaire sur le FPGA.
			
			afficheur_CENTIEME : afficheur port map(A=>CENTIEMES,B0=>aff_CENTIEMES(0),
														         B1=>aff_CENTIEMES(1),
														         B2=>aff_CENTIEMES(2),
														         B3=>aff_CENTIEMES(3),
														         B4=>aff_CENTIEMES(4),
														         B5=>aff_CENTIEMES(5),
														         B6=>aff_CENTIEMES(6));
														         
			afficheur_DIXIEME : afficheur port map(A=>DIXIEMES,  B0=>aff_DIXIEMES(0),
															     B1=>aff_DIXIEMES(1),
															     B2=>aff_DIXIEMES(2),
															     B3=>aff_DIXIEMES(3),
															     B4=>aff_DIXIEMES(4),
															     B5=>aff_DIXIEMES(5),
															     B6=>aff_DIXIEMES(6));	
															   
			afficheur_SEC : afficheur port map(A=>SEC,           B0=>aff_SEC(0),
															     B1=>aff_SEC(1),
															     B2=>aff_SEC(2),
															     B3=>aff_SEC(3),
															     B4=>aff_SEC(4),
															     B5=>aff_SEC(5),
															     B6=>aff_SEC(6));
																 
			afficheur_DIX_SEC : afficheur port map(A=>DIX_SEC,   B0=>aff_DIX_SEC(0),
															     B1=>aff_DIX_SEC(1),
															     B2=>aff_DIX_SEC(2),
															     B3=>aff_DIX_SEC(3),
															     B4=>aff_DIX_SEC(4),
															     B5=>aff_DIX_SEC(5),
															     B6=>aff_DIX_SEC(6));
																 
			
			                                                  
			
			
			
			--testTick<=TICK1US;			--test <= CENTIEMES;			testDeux<=DIXIEMES;			testTrois<=SEC;			testQuatre<=DIX_SEC;

end arch;
