LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY puerta_Xor_nentradasvhdl IS
--GENERIC (n : INTEGER := 4);
PORT (x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		f : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END puerta_Xor_nentradasvhdl;

ARCHITECTURE solucion OF puerta_Xor_nentradasvhdl IS

BEGIN
	f(0) <= '0' when x(0)='0' else '1';
	f(1) <= '0' when x(1)='1' else '1';
	f(2) <= '0' when x(2)='1' else '1';
	f(3) <= '0' when x(3)='0' else '1';
	f(4) <= '0' when x(4)='0' else '1';
	f(5) <= '0' when x(5)='1' else '1';
	f(6) <= '0' when x(6)='0' else '1';
	f(7) <= '0' when x(7)='0' else '1';
END solucion;