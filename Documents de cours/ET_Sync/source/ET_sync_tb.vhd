library ieee;
use ieee.std_logic_1164.all;

entity ET_sync_tb is
end;

architecture bench of ET_sync_tb is 
signal E1, E2, CLK, S : std_logic;
begin 

	M: entity work.ET_sync(arch) port map (
	E1  => E1, 
	E2  => E2,
	CLK => CLK,
	S   => S
	);
	
	process
	begin
	E1 <= '0';
	E2 <= '0';
	CLK <= '0';
	wait for 10 NS;
	E1 <= '1';
	wait for 1 NS;
	CLK <= '1';
	wait for 9 NS;
	E2 <= '1';
	E1 <= '0';
	wait for 2 NS;
	CLK <= '0';
	wait for 8 NS;
	E1 <= '1';
	wait for 4 NS; 
	CLK <= '1';
	wait for 6 NS;
	E2 <= '0';
	E1 <= '0';
	wait for 6 NS;
	CLK <= '0';
	wait for 12 NS;
	CLK <= '1';
	wait for 2 NS;
	wait;
	end process;
end bench;
