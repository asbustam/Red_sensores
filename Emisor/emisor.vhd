library ieee;
use ieee.std_logic_1164.all;

entity emisor is 
	port(clock, resetn, start, stop, inicio, dato_ok, hibernacion, trama_ok, conf_frec, sinc_rx : in std_logic;
			frec_muest : in std_logic_vector(7 downto 0);
			s : out std_logic_vector(2 downto 0);
			
			--rx	: buffer std_logic_vector(7 downto 0);
			led, led_stop, sinc_tx, en_rs_rx, en_rs_1, reset_rs_1, reset_rs_rx : out std_logic;
			salida_estado: out std_logic_vector (7 downto 0));
			--tx	: out std_logic_vector(7 downto 0));
			end emisor;
architecture sol of emisor is
	type estado is (ta,tb,tc,td,te,tf,tg,th,ti,tj,tk,tl,tm,tn,tp,tq,tr,tu,ts,tt,tv);
	signal y : estado;
begin 
	process(resetn, clock)
		begin
		if resetn='0'then y<=ta;
		elsif clock'event and clock='1' then 
			case y is
				when ta=> if start='0'then y<=ta;else y<=tb; end if;
				when tb=> if start='1'then y<=tb;else y<=tc; end if;
				when tc=> if (dato_ok='1' and start='0'and sinc_rx='0'and stop='0')then y<=td;
							elsif(dato_ok='0')then y<=ta;
							elsif(start='1') then y<=tq;
							elsif(stop='1')then y<=ts;
							elsif(sinc_rx='1' and inicio='0')then y<=tc;
							elsif(sinc_rx='1' and inicio='1')then y<=ti;end if;
				when td=> if (stop='1') then y<=ts;else y<=te ; end if;
				when te=> if (stop='1')then y<=ts;else y<=tf; end if;
				when tf=> if (stop='1')then y<=ts;else y<=tg; end if;
				when tg=> if (stop='1')then y<=ts;else y<=th; end if;
				when th=> if (stop='1')then y<=ts;else y<=tc; end if;
				when ti=> y<=tj;
				when tj=> y<=tk;
				when tk=> y<=tl;
				when tl=> if trama_ok='1' then y<=tm;else y<=tc; end if;
				when tm=> if conf_frec='1' then y<=tp;else y<=tn; end if;
				when tn=> if hibernacion='1' then y<=ta;else y<=tc; end if;
				when tp=> y<=tc;
				when tq=> if start='1'then y<=tq;else y<=tr; end if;
				when tr=> if start='0'then y<=tr;else y<=tu; end if;
				when tu=> if start='1'then y<=tu;else y<=ta; end if;
				when ts=> if stop='0'then y<=tt;else y<=ts; end if;
				when tt=> if stop='1'then y<=tv;else y<=tt; end if;
				when tv=> if stop='0'then y<=tc;else y<=tv; end if;
			end case;
		end if;
	end process;
	process(y,inicio,sinc_rx)	
	begin
	en_rs_rx<='0'; sinc_tx<='0'; s(0)<='0'; s(1)<='0'; s(2)<='0';led<='0';en_rs_1<='0';led_stop<='0';salida_estado<="00000000";
		case y is
			when ta=> salida_estado<="00000001";
			when tb=> salida_estado<="00000010";
			when tc=> salida_estado<="00000100";
						 if (sinc_rx='1' and inicio='1') then en_rs_rx<='1';end if;
			when td=> sinc_tx <='1';salida_estado<="00001000";
			when te=> sinc_tx <='1'; s(0)<='1';salida_estado<="00010000";
			when tf=> sinc_tx <='1'; s(1)<='1';salida_estado<="00100000";
			when tg=> sinc_tx <='1'; s(0)<='1'; s(1)<='1';salida_estado<="01000000";
			when th=> sinc_tx <='1'; s(2)<='1';salida_estado<="10000000";
			when ti=> en_rs_rx <='1'; s(0)<='1';
			when tj=> en_rs_rx <='1'; s(1)<='1';
			when tk=> en_rs_rx <='1'; s(2)<='1';
			when tl=> s(2)<='1'; s(1)<='1'; s(0)<='1';
			when tm=> led<='1';
			when tn=> led<='1'; 
			when tp=> en_rs_1 <='1';
			when tq=> 
			when tr=> 
			when tu=> 
			when ts=> 
			when tt=> led_stop <='1';
			when tv=> 
		end case;
	end process;
end sol;	