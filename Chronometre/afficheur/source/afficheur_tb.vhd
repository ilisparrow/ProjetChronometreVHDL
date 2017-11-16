library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity afficheur_tb is 
end afficheur_tb;

architecture arch of afficheur_tb is

signal A : std_logic_vector(3 downto 0);
signal b0, b1, b2, b3, b4, b5, b6 : std_logic;



begin

M : entity work.afficheur(arch) port map(
A=>A,
b0=>B0,
b1=>B1,
b2=>B2,
b3=>B3,
b4=>B4,
b5=>B5,
b6=>B6
);

process 
begin

	A<="0000";
		wait for 50 NS;
	A<="0001";
		wait for 50 NS;
	A<="0010";
		wait for 50 NS;
	A<="0011";
		wait for 50 NS;
	A<="0100";
		wait for 50 NS;
	A<="0101";
		wait for 50 NS;
	A<="0110";
		wait for 50 NS;
	A<="0111";
		wait for 50 NS;
	A<="1000";
		wait for 50 NS;
	A<="1001";
		wait for 50 NS;

end process;


end arch;