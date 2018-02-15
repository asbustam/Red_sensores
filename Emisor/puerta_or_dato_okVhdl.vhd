LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY puerta_or_dato_okvhdl IS

PORT (x : IN STD_LOGIC_VECTOR(7 downto 0);
		f : OUT STD_LOGIC);
END puerta_or_dato_okvhdl;

ARCHITECTURE solve OF puerta_or_dato_okvhdl IS
BEGIN

f <= '0' WHEN x="00000000" ELSE '1';
END solve;