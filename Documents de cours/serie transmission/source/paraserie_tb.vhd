library ieee;
use ieee.std_logic_1164.all;

entity paraserie_tb is
end;

architecture bench of paraserie_tb is
signal H 		: std_logic;
signal ENVOIE  	: std_logic;
signal RESET   	: std_logic;
signal S		: std_logic;
signal DONNEE	: std_logic_vector(7 downto 0);
signal StopClock : BOOLEAN;

begin 
	M : entity work.paraserie(arch) port map (
	H		=> H		,	
    ENVOIE	=> ENVOIE	,
    RESET 	=> RESET 	,
    S		=> S		,
    DONNEE	=> DONNEE	
	);
	
 process
  begin
    while not StopClock loop
      H <= '0';
      wait for 5 ns;
      H <= '1';
      wait for 5 ns;
    end loop;
    wait;
  end process;
  
 process
begin
	RESET <='0';
	ENVOIE <='0';
	DONNEE <=x"4F";
	wait for 10 NS;
	ENVOIE <='1';
	wait for 10 NS;
	DONNEE <=x"35";
	wait for 15 NS;
	ENVOIE <='0';
	wait for 15 NS;
	ENVOIE <='1';
	wait for 10 NS;
	ENVOIE <='0';
	wait for 80 NS;
	ENVOIE <='1';
	wait for 10 NS;
	ENVOIE <='0';
	wait for 110 NS;
    StopClock <= TRUE;
    wait;
  end process;
end bench;