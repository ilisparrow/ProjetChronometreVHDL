library ieee;
use ieee.std_logic_1164.all;

entity parite_tb is
end;
architecture bench of parite_tb is
signal E : std_logic_vector (3 downto 0);
signal S : std_logic_vector (4 downto 0);

begin 
	M: entity work.parite(arch) port map (
	E => E,
    S => S);
	
	process
	begin
	E <= x"0";
	wait for 10 NS;
	E <= x"1";
	wait for 10 NS;
	E <= x"2";
	wait for 10 NS;
	E <= x"3";
	wait for 10 NS;
	E <= x"4";
	wait for 10 NS;
	E <= x"5";
	wait for 10 NS;
	E <= x"6";
	wait for 10 NS;
	E <= x"7";
	wait for 10 NS;
	E <= x"8";
	wait for 10 NS;
	E <= x"9";
	wait for 10 NS;
	E <= x"A";
	wait for 10 NS;
	E <= x"B";
	wait for 10 NS;
	E <= x"C";
	wait for 10 NS;
	E <= x"D";
	wait for 10 NS;
	E <= x"E";
	wait for 10 NS;
	E <= x"F";
	wait for 10 NS;
	wait;
	end process;
end bench;
	