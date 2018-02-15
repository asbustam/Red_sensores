library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
entity contador is
    PORT (
		  Enable : IN  STD_LOGIC;
        clk    : IN  STD_LOGIC;
        areset : IN  STD_LOGIC;		  
        cnt_out: OUT STD_LOGIC_VECTOR(1 DOWNTO 0)
    );
end contador;
 
architecture Behavioral of contador is
    -- Señal temporal para el contador.
    signal cnt_tmp: STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
begin
    proceso_contador: process (areset, clk) begin
        if areset = '0' then
            cnt_tmp <= "00";
        elsif rising_edge(clk) and Enable='1' then
            cnt_tmp <= cnt_tmp + 1;
        end if;
end process;
 
    cnt_out <= cnt_tmp;
end Behavioral;