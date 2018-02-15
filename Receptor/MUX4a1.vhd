library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux4a1 is

port (A : in std_logic_vector(7 downto 0);
		B : in std_logic_vector(7 downto 0);
		C : in std_logic_vector(7 downto 0);
		D : in std_logic_vector(7 downto 0);
      sel : in std_logic_vector(1 downto 0);
      bitout : out std_logic_vector(7 downto 0));
end mux4a1;

architecture Behavioral of mux4a1 is
begin

process(sel,A,B,C,D)
begin
case sel is
  when "00" => bitout <= A;
  when "01" => bitout <= B;
  when "10" => bitout <= C;
  when others => bitout <= D; 
end case; 
end process;

end Behavioral;