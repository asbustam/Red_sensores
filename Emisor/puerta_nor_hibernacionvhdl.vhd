LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY puerta_nor_hibernacionvhdl IS

PORT (x : IN STD_LOGIC_VECTOR(7 downto 0);
		f : OUT STD_LOGIC);
END puerta_nor_hibernacionvhdl;

ARCHITECTURE solve OF puerta_nor_hibernacionvhdl IS
BEGIN

f <= '1' WHEN x="00000000" ELSE '0';
END solve;