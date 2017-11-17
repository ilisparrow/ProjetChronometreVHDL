
library IEEE;
     use IEEE.std_logic_1164.all;
     use IEEE.numeric_std.all;

---------------------------------
entity memoire is
---------------------------------
  port ( 
  boutonSauvegarde : in std_logic;
  
  
  sauvCentieme, sauvDixieme, sauvSEC, sauvDIXSEC : in std_logic_vector;
  sortieCentieme, sortieDixieme, sortieSEC, sortieDIXSEC : out std_logic_vector(3 downto 0)
  
  
      );
end entity memoire;

--------------------------------------
architecture arch of memoire is
--------------------------------------
SIGNAL c0,d0, s0, ds0: std_logic_vector(3 downto 0);
SIGNAL c1,d1, s1, ds1: std_logic_vector(3 downto 0);
SIGNAL c2,d2, s2, ds2: std_logic_vector(3 downto 0);
SIGNAL c3,d3, s3, ds3: std_logic_vector(3 downto 0);
SIGNAL c4,d4, s4, ds4: std_logic_vector(3 downto 0);
SIGNAL c5,d5, s5, ds5: std_logic_vector(3 downto 0);
SIGNAL c6,d6, s6, ds6: std_logic_vector(3 downto 0);
SIGNAL c7,d7, s7, ds7: std_logic_vector(3 downto 0);


SIGNAL indiceMemoire std_logic_vector(2 downto 0) := "000";


-----------
begin
-----------
	process (boutonSauvegarde)
		begin
		
		if (rising_edge(boutonSauvegarde)) then
			if(indiceMemoire="000") then 
				 c7<=sauvCentieme;
				 d7<=sauvDixieme;
				 s7<=sauvSEC;
				ds7<=sauvDIXSEC;
			elsif(indiceMemoire="001") then
				 c0<=sauvCentieme;
				 d0<=sauvDixieme;
				 s0<=sauvSEC;
				ds0<=sauvDIXSEC;
			elsif(indiceMemoire="010") then
				 c1<=sauvCentieme;
				 d1<=sauvDixieme;
				 s1<=sauvSEC;
				ds1<=sauvDIXSEC;
			elsif(indiceMemoire="011") then
				 c2<=sauvCentieme;
				 d2<=sauvDixieme;
				 s2<=sauvSEC;
				ds2<=sauvDIXSEC;
			elsif(indiceMemoire="100") then
				 c3<=sauvCentieme;
				 d3<=sauvDixieme;
				 s3<=sauvSEC;
				ds3<=sauvDIXSEC;
			elsif(indiceMemoire="101") then
				 c4<=sauvCentieme;
				 d4<=sauvDixieme;
				 s4<=sauvSEC;
				ds4<=sauvDIXSEC;
			elsif(indiceMemoire="110") then
				 c5<=sauvCentieme;
				 d5<=sauvDixieme;
				 s5<=sauvSEC;
				ds5<=sauvDIXSEC;
			elsif(indiceMemoire="111") then
				 c6<=sauvCentieme;
				 d6<=sauvDixieme;
				 s6<=sauvSEC;
				ds6<=sauvDIXSEC;
			
			end if;
			
			
			
			indiceMemoire <= std_logic_vector (unsigned(indiceMemoire)+ 1);
		end if;
		
		
	end process;

---------------------------
end architecture arch;
---------------------------

