library ieee;
use ieee.std_logic_1164.all;

entity chronogramme_tb is
end;

architecture bench of chronogramme_tb is

signal A,B,C,H,S1,S2,S3,B1,B2,B3 : std_logic;
signal StopClock : BOOLEAN;

begin 
	M : entity work.chronogramme(arch) port map (
	A  => A,
	B  => B,
	C  => C,
	H  => H,
	S1 => S1,
	S2 => S2,
	S3 => S3,
	B1 => B1,
	B2 => B2,
	B3 => B3);
process
  begin
    while not StopClock loop
      H <= '0';
      wait for 20 ns;
      H <= '1';
      wait for 20 ns;
    end loop;
    wait;
  end process;
 
process
	begin
	A <= '0';
	B <= '0';
	C <= '1';
	wait for 160 NS;
	A <= '1';
	B <= '1';
	wait for 480 NS;
	C <= '0';
	wait for 200 NS;
	B <= '0';
	wait for 40 NS;
	A <= '0';
	wait for 120 NS;
    StopClock <= TRUE;	
	wait;
	end process;

end bench;
