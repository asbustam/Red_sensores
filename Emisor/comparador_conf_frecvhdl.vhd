library ieee;
use ieee.std_logic_1164.all;

Entity comparador_conf_frecvhdl is
	Port(	w1: in std_logic_vector(7 downto 0);
			--w2: in std_logic_vector(3 downto 0);
			--en: in std_logic;
			igual: out std_logic);
end comparador_conf_frecvhdl;

Architecture sol of comparador_conf_frecvhdl is
Signal F: std_logic_vector(7 downto 0);
Begin
	F<="00000010";
	--menor<='1' when w1<F else '0';
	igual<='1' when w1=F else '0';
end sol;