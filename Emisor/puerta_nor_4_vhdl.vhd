LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY puerta_nor_4_vhdl IS

PORT (x : IN STD_LOGIC_VECTOR(2 downto 0);
		f : OUT STD_LOGIC);
END puerta_nor_4_vhdl;

ARCHITECTURE solve OF puerta_nor_4_vhdl IS
BEGIN

f <= '1' WHEN x="000" ELSE '0';
END solve;