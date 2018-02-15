LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY puerta_Xor_nentradas_checkvhdl IS
--GENERIC (n : INTEGER := 4);
PORT (x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		y : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		f : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END puerta_Xor_nentradas_checkvhdl;

ARCHITECTURE solucion OF puerta_Xor_nentradas_checkvhdl IS

BEGIN
	f(0) <= '0' when x(0)=y(0) else '1';
	f(1) <= '0' when x(1)=y(1) else '1';
	f(2) <= '0' when x(2)=y(2) else '1';
	f(3) <= '0' when x(3)=y(3) else '1';
	f(4) <= '0' when x(4)=y(4) else '1';
	f(5) <= '0' when x(5)=y(5) else '1';
	f(6) <= '0' when x(6)=y(6) else '1';
	f(7) <= '0' when x(7)=y(7) else '1';
END solucion;