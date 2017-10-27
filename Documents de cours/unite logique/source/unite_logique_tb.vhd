library ieee;
use ieee.std_logic_1164.all;

entity unite_logique_tb is
end;

architecture bench of unite_logique_tb is
signal A,B,C, S : std_logic_vector(3 downto 0);
signal fct : std_logic_vector(2 downto 0);
signal H,RAZN : std_logic;
signal StopClock : BOOLEAN;

begin 
	M : entity work.unite_logique(arch) port map (
	A => A,
	B => B,
	C => C,
	fct => fct,
	H => H,
	RAZN => RAZN,
	S => S);
	
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
	A <= "1001";
	B <= "1100";
	C <= "1011";
	RAZN <= '1';
	fct <= "000";
	wait for 30 NS;
	fct <= "001";
	wait for 30 NS;
	fct <= "010";
	wait for 30 NS;
	fct <= "011";
	wait for 30 NS;
	fct <= "100";
	wait for 30 NS;
	fct <= "101";
	wait for 30 NS;
	fct <= "110";
	wait for 30 NS;
	fct <= "111";
	wait for 30 NS;
	fct <= "000";
	wait for 30 NS;
	fct <= "001";
	wait for 7 NS;
	RAZN <= '0';
	wait for 5 NS;
    StopClock <= TRUE;
    wait;
  end process;
end bench;