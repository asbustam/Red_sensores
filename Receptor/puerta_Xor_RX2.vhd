LIBRARY IEEE;
USE ieee.std_logic_1164.all;

ENTITY puerta_Xor_RX2 IS
PORT (A : IN STD_LOGIC_VECTOR(7 downto 0);
		IN2 : IN STD_LOGIC_VECTOR(3 downto 0);
		Qxor : OUT STD_LOGIC_VECTOR(7 downto 0));
END puerta_Xor_RX2;

ARCHITECTURE solucion OF puerta_Xor_RX2 IS
signal B: std_logic_vector(7 downto 0);
BEGIN
	PROCESS(A,IN2)
	BEGIN		
		B<="0000" & IN2;
	END PROCESS;
	Qxor <=(A(7) xor B(7)) & (A(6) xor B(6)) & (A(5) xor B(5)) & (A(4) xor B(4)) & (A(3) xor B(3)) & (A(2) xor B(2)) & (A(1) xor B(1)) & (A(0) xor B(0));

END solucion;