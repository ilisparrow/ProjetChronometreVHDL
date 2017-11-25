library IEEE;
     use IEEE.std_logic_1164.all;
     use IEEE.numeric_std.all;

-----------------
entity memoire is
-----------------
  port ( 
  
  boutonSauvegarde, boutonAffichage, RAZN_Memoire, stopMemoire : in std_logic;
  
  -- recuperation des valeurs du compteur
  sauvCentieme, sauvDixieme, sauvSEC, sauvDIXSEC : in std_logic_vector (3 downto 0);
  
  -- valeurs affichés en sortie
  sortieCentieme, sortieDixieme, sortieSEC, sortieDIXSEC : out std_logic_vector(3 downto 0)
  
  );
-------------------
end entity memoire;
-------------------

-------------------------------
architecture arch of memoire is
-------------------------------

-- Variables de sauvegardes (Centiemes, Dixiemes, Secondes, Dixaines de secondes pour chaques sauvegardes)

SIGNAL c0,d0, s0, ds0: std_logic_vector(3 downto 0);
SIGNAL c1,d1, s1, ds1: std_logic_vector(3 downto 0);
SIGNAL c2,d2, s2, ds2: std_logic_vector(3 downto 0);
SIGNAL c3,d3, s3, ds3: std_logic_vector(3 downto 0);
SIGNAL c4,d4, s4, ds4: std_logic_vector(3 downto 0);
SIGNAL c5,d5, s5, ds5: std_logic_vector(3 downto 0);
SIGNAL c6,d6, s6, ds6: std_logic_vector(3 downto 0);
SIGNAL c7,d7, s7, ds7: std_logic_vector(3 downto 0);

-- Indices permettant de se reperer dans les sauvegardes et l'affichage des memoires

SIGNAL indiceMemoire : std_logic_vector(2 downto 0) := "000";
SIGNAL indiceAffichage : std_logic_vector(2 downto 0) := "000";

begin

	process (boutonSauvegarde, boutonAffichage, RAZN_Memoire)
	
	begin
		
		-- Remise à 0, on réinitialise l'indiceMemoire et l'indiceAffichage
		if RAZN_Memoire = '0' then 
			
			indiceMemoire 	<= "000";
			indiceAffichage <= "000";
		
		end if;
		
		------------------------------------------------------------------------------------------
		--    							BOUTON SAUVEGARDE  										--
		------------------------------------------------------------------------------------------	
		
		if rising_edge(boutonSauvegarde) then
			
			-- Si on est sur un front montant du bouton et que le chronomètre est actif
			-- Sauvegarde des valeurs en fonction du nombre d'appuis sur le boutonSauvegarde
			
			if(indiceMemoire="000") then 
				 c0<=sauvCentieme;
				 d0<=sauvDixieme;
				 s0<=sauvSEC;
				ds0<=sauvDIXSEC;
			elsif(indiceMemoire="001") then
				 c1<=sauvCentieme;
				 d1<=sauvDixieme;
				 s1<=sauvSEC;
				ds1<=sauvDIXSEC;
			elsif(indiceMemoire="010") then
				 c2<=sauvCentieme;
				 d2<=sauvDixieme;
				 s2<=sauvSEC;
				ds2<=sauvDIXSEC;
			elsif(indiceMemoire="011") then
				 c3<=sauvCentieme;
				 d3<=sauvDixieme;
				 s3<=sauvSEC;
				ds3<=sauvDIXSEC;
			elsif(indiceMemoire="100") then
				 c4<=sauvCentieme;
				 d4<=sauvDixieme;
				 s4<=sauvSEC;
				ds4<=sauvDIXSEC;
			elsif(indiceMemoire="101") then
				 c5<=sauvCentieme;
				 d5<=sauvDixieme;
				 s5<=sauvSEC;
				ds5<=sauvDIXSEC;
			elsif(indiceMemoire="110") then
				 c6<=sauvCentieme;
				 d6<=sauvDixieme;
				 s6<=sauvSEC;
				ds6<=sauvDIXSEC;
			elsif(indiceMemoire="111") then
				 c7<=sauvCentieme;
				 d7<=sauvDixieme;
				 s7<=sauvSEC;
				ds7<=sauvDIXSEC;
			end if;
			
			--Incrémentation indiceMémoire
			indiceMemoire <= std_logic_vector (unsigned(indiceMemoire)+ 1);
			
		else 
		
		indiceMemoire <= indiceMemoire;
		
		end if;
		
		------------------------------------------------------------------------------------------
		--    						FIN BOUTON SAUVEGARDE  										--
		------------------------------------------------------------------------------------------		
		
		------------------------------------------------------------------------------------------
		--    							BOUTON AFFICHAGE  										--
		------------------------------------------------------------------------------------------	
		
		-- si on appui sur le bouton d'affichage quand le chronomètre est arrété.
		if (rising_edge(boutonAffichage) AND stopMemoire='1')	then 
		
			
			if(indiceAffichage="000")	then 
				 sortieCentieme	 <=c0;
				 sortieDixieme	 <=d0;
				 sortieSEC		 <=s0;
				 sortieDIXSEC	<=ds0;
			elsif(indiceAffichage="001") then
				 sortieCentieme	 <=c1;
				 sortieDixieme	 <=d1;
				 sortieSEC		 <=s1;
				 sortieDIXSEC	<=ds1;
			elsif(indiceAffichage="010") then
				sortieCentieme	 <=c2;
				 sortieDixieme	 <=d2;
				 sortieSEC		 <=s2;
				 sortieDIXSEC	<=ds2;
			elsif(indiceAffichage="011") then
				 sortieCentieme	 <=c3;
				 sortieDixieme	 <=d3;
				 sortieSEC		 <=s3;
				 sortieDIXSEC	<=ds3;
			elsif(indiceAffichage="100") then
				 sortieCentieme	 <=c4;
				 sortieDixieme	 <=d4;
				 sortieSEC		 <=s4;
				 sortieDIXSEC	<=ds4;
			elsif(indiceAffichage="101") then
				 sortieCentieme	 <=c5;
				 sortieDixieme	 <=d5;
				 sortieSEC		 <=s5;
				 sortieDIXSEC	<=ds5;
			elsif(indiceAffichage="110") then
				 sortieCentieme	 <=c6;
				 sortieDixieme	 <=d6;
				 sortieSEC		 <=s6;
				 sortieDIXSEC	<=ds6;
			elsif(indiceAffichage="111") then
				 sortieCentieme	 <=c7;
				 sortieDixieme	 <=d7;
				 sortieSEC		 <=s7;
				 sortieDIXSEC	<=ds7;
			end if;
			
		--Incrémentation indiceAffichage
		
		indiceAffichage  <= std_logic_vector (unsigned(indiceAffichage )+ 1);
		
		else 
		
		indiceAffichage  <= indiceAffichage;
		
		end if;
		
		------------------------------------------------------------------------------------------
		--    							FIN BOUTON AFFICHAGE	  								--
		------------------------------------------------------------------------------------------

	end process;

---------------------------
end architecture arch;
---------------------------

