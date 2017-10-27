library ieee;
use ieee.std_logic_1164.all;

entity seriepara_tb is
end;

architecture bench of seriepara_tb is
signal H				: std_logic;
signal ACQUISITION		: std_logic;
signal RESET   			: std_logic;
signal PRET				:  std_logic;
signal DONNEE			:  std_logic_vector(7 downto 0);
signal StopClock : BOOLEAN;

begin 
	M : entity work.seriepara(arch) port map (
	H				=> H				,	
    ACQUISITION		=> ACQUISITION		,
    RESET   		=> RESET   			,
    PRET			=> PRET				,
    DONNEE			=> DONNEE			
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
	ACQUISITION <='1';
	wait for 5 NS;
	RESET <='1';
	wait for 15 NS;
	RESET <='0';
	wait for 10 NS;
	ACQUISITION <='0';
	wait for 40 NS;
	ACQUISITION <='1';
	wait for 160 NS;
	ACQUISITION <='0';
	wait for 80 NS;
	ACQUISITION <='1';
	wait for 40 NS;
	ACQUISITION <='0';
	wait for 40 NS;
	ACQUISITION <='1';
	wait for 140 NS;
	ACQUISITION <='0';
	wait for 40 NS;
	ACQUISITION <='1';
	wait for 40 NS;
	ACQUISITION <='0';
	wait for 40 NS;
	ACQUISITION <='1';
	wait for 40 NS;
	ACQUISITION <='0';
	wait for 40 NS;
	ACQUISITION <='1';
	wait for 80 NS;
	ACQUISITION <='0';
	wait for 80 NS;
	ACQUISITION <='1';
	wait for 80 NS;
    StopClock <= TRUE;
    wait;
  end process;
end bench;