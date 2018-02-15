library ieee;
use ieee.std_logic_1164.all;

Entity mux2a1 is

PORT(	A: IN std_logic_vector(7 downto 0);
		B: IN std_logic_vector(7 downto 0);
		SLECT: IN std_logic;
		Q: OUT std_logic_vector(7 downto 0));
end mux2a1;

Architecture sol of mux2a1 is
begin
process(SLECT,A,B)
	begin
	case SLECT is
		when '0' => Q <= A;		
		when others => Q <= B; 
	end case; 
end process;

end sol;