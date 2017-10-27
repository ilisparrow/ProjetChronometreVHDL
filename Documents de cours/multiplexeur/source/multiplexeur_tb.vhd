library ieee;
use ieee.std_logic_1164.all;

entity multiplexeur_tb is
end;

architecture bench of multiplexeur_tb is
signal IN0 : std_logic_vector(3 downto 0);
signal IN1 : std_logic_vector(3 downto 0);
signal OUT0 : std_logic_vector (3 downto 0);
signal SEL : std_logic;

begin 
	M: entity work.multiplexeur(arch) port map (
	IN0  => IN0,  
	IN1  => IN1,  
	OUT0 => OUT0,
	SEL  => SEL); 
	
	process
	begin
	IN0 <= "0000";
	IN1 <= "0100";
	SEL <= '0';
	wait for 10 NS;
	IN0 <= x"A";
	wait for 2 NS;
	SEL <= '1';
	wait for 8 NS;
	IN1 <= x"3";
	wait for 10 NS;
	IN0 <= x"C";
	wait for 2 NS; 
	SEL <= '0';
	wait for 8 NS;
	IN0 <= x"F";
	wait for 2 NS;
	SEL <= '1';
	wait for 2 NS;
	IN1 <=x"B";
	wait for 2 NS;
	wait;
	end process;
end bench;
	