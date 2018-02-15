library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity separador_binario is
   port( ENTRADA: in std_logic_vector(10 downto 0);
			CENTENAS,DECENAS,UNIDADES: OUT STD_LOGIC_VECTOR(3 downto 0));
end separador_binario;
 
architecture solve of separador_binario is
 begin
	CENTENAS <= "0" & ENTRADA(10 downto 8);
	DECENAS <= ENTRADA(7 downto 4);
	UNIDADES <= ENTRADA(3 downto 0);
	
end solve;