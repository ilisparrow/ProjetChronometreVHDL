library ieee;
use ieee.std_logic_1164.all;

entity structural_tb is
end;

architecture bench of structural_tb is
signal a,b,c,d,e,f,S : std_logic;

begin
	M: entity work.structural(arch) port map (
	a => a ,
	b => b ,
	c => c ,
	d => d ,
	e => e ,
	f => f ,
	S => S );
	
	process
	begin
	a <= '0';
	b <= '0';
	c <= '0';
	d <= '0';
	e <= '0';
	f <= '0';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	wait for 10 NS;
	a <= '0';
	b <= '1';
	wait for 10 NS;
	a <= '1';
	wait for 10 NS;
	a <= '0';
	b <= '0';
	c <= '1';
	wait for 10 NS;
	a <= '1';
	wait for 10 NS;
	a <= '0';
	b <= '1';
	wait for 10 NS;
	a <= '1';
	wait for 10 NS;
	a <= '0';
	b <= '0';
	c <= '0';
	d <= '1';
	wait for 10 NS;
	a <= '1';
	wait for 10 NS;
	a <= '0';
	b <= '1';
	wait for 10 NS;
	a <= '1';
	wait for 10 NS;
	a <= '0';
	b <= '0';
	c <= '1';
	wait for 10 NS;
	a <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '0';
	c <= '0';
	d <= '0';
	e <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '0';
	c <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '0';
	c <= '0';
	d <='1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	a <= '1';
	b <= '0';
	c <= '1';
	wait for 10 NS;
	a <= '0';
	wait for 10 NS;
	wait;
	end process;
end bench;