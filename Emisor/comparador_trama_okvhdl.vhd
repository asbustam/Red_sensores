library ieee;
use ieee.std_logic_1164.all;

Entity comparador_trama_okvhdl is
	Port(	w1: in std_logic_vector(7 downto 0);
			w2: in std_logic_vector(7 downto 0);
			--en: in std_logic;
			igual: out std_logic);
end comparador_trama_okvhdl;

Architecture sol of comparador_trama_okvhdl is

Begin
	
	--menor<='1' when w1<F else '0';
	igual<='1' when w1=W2 else '0';
end sol;