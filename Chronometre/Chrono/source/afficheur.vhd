library ieee;
use ieee.std_logic_1164.all;

--------------------------
--		AFFICHEUR		--
--------------------------
--			B0   		--
--		 -------- 		--
--		|		 |		--
--	B5	|		 |  B1	--
--		|	B6	 |		--
--		 -------- 		--
--		|		 |		--
--	B4	|		 |  B2	--
--		|		 |		--
--		 -------- 		--
--			B3   		--
--------------------------

-------------------
entity afficheur is
-------------------	
	port (
	A: in std_logic_vector (3 downto 0);
	B0, B1, B2, B3, B4, B5, B6 : out std_logic
	);
--------------	
end afficheur;
--------------

---------------------------------
architecture arch of afficheur is
---------------------------------

begin

-- Traduction de la table de Karnaugh :
	
	B0 <= '1' when (A= "0001" OR A= "0100")
	else '0';
	
	B1 <= '1' when (A= "0101" OR A= "0110")
	else '0';

	B2 <= '1' when (A= "0010")
	else '0'; 	
	
	B3 <= '1' when (A= "0001" OR A= "0100" OR A="0111")
	else '0';
	
	B4 <= '0' when (A= "0000" OR A= "0010" OR A="0110" OR A="1000")
	else '1';
	
	B5 <= '1' when (A= "0001" OR A= "0010" OR A="0011" OR A= "0111")
	else '0';
	
	B6 <= '1' when (A="0000" OR A= "0001" OR A= "0111")
	else '0'; 	

---------
end arch;
---------

