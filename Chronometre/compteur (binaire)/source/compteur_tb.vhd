library ieee;
use ieee.std_logic_1164.all;

entity compteur_tb is
end;

architecture bench of compteur_tb is
signal 	H, LOADN, CET, RAZN : std_logic;
signal	S,DATA : std_logic_vector (3 downto 0);
signal  StopClock : BOOLEAN;

begin 

	M : entity work.compteur(arch) port map (
	H => H,
	LOADN => LOADN,
	DATA=>DATA,
	CET => CET,
	RAZN => RAZN,
	S => S);

--Gestion des valeurs de la clock (switch toute les 25 ns)
	
 process
  begin
    while not StopClock loop
      H <= '0';
      wait for 25 ns;
      H <= '1';
      wait for 25 ns;
    end loop;
    wait;
  end process;
  
  process
	begin
		--Valeurs initiales
		CET <= '1';
		RAZN <= '1';
		LOADN <= '1';
		DATA <= "0111";
		
		--Changements de valeurs pour tests
		wait for 500 NS;
		StopClock <= TRUE;
		wait;
	end process;
  
end bench;
