library ieee;
use ieee.std_logic_1164.all;

entity chronogramme is
	port (A,B,C,H : in std_logic;
					S1,S2,S3: out std_logic;
					B1,B2,B3: buffer std_logic);
end chronogramme;

architecture arch of chronogramme is
begin
-- cas n°1
	process (H)
	begin
		if (rising_edge(H)) then
			B1<=A and B;
			S1<= B1 and C;
		end if;
	end process;

-- cas n°2
	process (H)
	begin
		if (rising_edge(H)) then
			S2<= B2 and C;
			B2<= A and B;
		end if;
	end process;
	
-- cas n°3
	process (H)
	begin
		if (rising_edge(H)) then
			B3<=A and B;
		end if;
	end process;
	S3<= B3 and C;	
end arch;