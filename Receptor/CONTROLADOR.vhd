library ieee;
use ieee.std_logic_1164.all;

entity controlador is
PORT( clock, reset, start,stop : in std_logic;
		sincrx,rbi,rid,qch,enviar_trama,fintx,inicio:in std_logic;
		enbi,enid,enta,endata,enchk,sel,enrs,encnt,endis,led,encnt2,sinctx,resetcnt,led_stop:out std_logic;
		salida_estado: out std_logic_vector(14 downto 0));
end controlador;

architecture sol of controlador is
type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk,Tl,Tm,Tn,Tp,Tq,Tr,Ts,Tt,Tu,Tv,Tw);
signal y : estado;
begin

process(clock, reset)
	begin
		if(reset='0') then y<=Ta;
		elsif(clock'event and clock='1') then
			case y is
					when Ta =>if start='0' then y<=Ta;
									else y<=Tb; end if;
					when Tb =>if start='0' then y<=Tc;
									else y<=Tb; end if;
					when Tc =>if start='1' then y<=Td;
									elsif stop='1' then y<=Tg;
									elsif enviar_trama='1' then y<=Tw;
									elsif sincrx='1' and inicio='1' then y<=Tj;									
									else y<=Tc; end if;
					when Td =>if start='0' then y<=Te;
									else y<=Td; end if;
					when Te =>if start='0' then y<=Te;
									else y<=Tf; end if;
					when Tf =>if start='0' then y<=Ta;
									else y<=Tf; end if;
					when Tg =>if stop='0' then y<=Th;
									else y<=Tg; end if;
					when Th =>if stop='0' then y<=Th;
									else y<=Ti; end if;
					when Ti =>if stop='0' then y<=Tc;
									else y<=Ti; end if;				
					when Tj =>if start='1' then y<=Td;
									elsif stop='1' then y<=Tg;
									elsif sincrx='0' then y<=Tj;
									else y<=Tk; end if;
					when Tk =>if start='1' then y<=Td;
									elsif stop='1' then y<=Tg;
									elsif sincrx='0' then y<=Tk;
									else y<=Tl; end if;
					when Tl =>if start='1' then y<=Td;
									elsif stop='1' then y<=Tg;
									elsif sincrx='0' then y<=Tl;
									else y<=Tm; end if;
					when Tm =>if start='1' then y<=Td;
									elsif stop='1' then y<=Tg;
									elsif sincrx='0' then y<=Tm;
									else y<=Tn; end if;
					when Tn =>if start='1' then y<=Td;
									elsif stop='1' then y<=Tn;
									else y<=Tp; end if;
					when Tp =>if rbi='0' then y<=Tc;
									else y<=Tq; end if;
					when Tq =>if rid='0' then y<=Tc;
									else y<=Tr; end if;
					when Tr =>y<=Ts;
					when Ts =>y<=Tt;
					when Tt =>y<=Tu;
					when Tu =>if qch='0' then y<=Tc;
									else y<=Tv; end if;
					when Tv =>y<=Tc;
					when Tw =>if fintx='0' then y<=Tw;
									else y<=Tc; end if;
			end case;
		end if;
end process;
process(y,sincrx,rbi,rid,qch,enviar_trama,fintx,start,stop)
	begin
	enbi<='0';enid<='0';enta<='0';endata<='0';enchk<='0';sel<='0';enrs<='0';encnt<='0';endis<='0';led<='0';encnt2<='0';sinctx<='0';resetcnt<='0';led_stop<='0';salida_estado<="000000000000000";
		case y is
				when Ta =>	salida_estado<="000000000000001";
				when Tb =>	salida_estado<="000000000000010";
				when Tc =>	enrs<='1';resetcnt<='1';salida_estado<="000000000000100";
								if (start='0' and stop='0' and sincrx='1') then enbi<='1'; end if;
								--elsif (start='0' and stop='0' and enviar_trama='1') then sinctx<='1';
				when Td =>
				when Te =>
				when Tf =>
				when Tg =>
				when Th => led_stop<='1';
				when Ti =>
				when Tj =>	salida_estado<="000000000001000";
								if (start='0' and stop='0' and sincrx='1') then enid<='1'; end if;
				when Tk =>	salida_estado<="000000000010000";
								if (start='0' and stop='0' and sincrx='1') then enta<='1'; end if;
				when Tl =>	salida_estado<="000000000100000";
								if (start='0' and stop='0' and sincrx='1') then endata<='1'; end if;
				when Tm =>	salida_estado<="000000001000000";
								if (start='0' and stop='0' and sincrx='1') then enchk<='1'; end if;
				when Tn =>	salida_estado<="000000010000000";
				when Tp =>	salida_estado<="000000100000000";
				when Tq => 	salida_estado<="000001000000000";
								if rid='1' then encnt<='1';enrs<='1';sel<='1'; end if;
				when Tr => sel<='1';enrs<='1';encnt<='1';salida_estado<="000010000000000";
				when Ts => sel<='1';enrs<='1';encnt<='1';salida_estado<="000100000000000";
				when Tt => sel<='1';enrs<='1';encnt<='1';salida_estado<="001000000000000";
				when Tu => salida_estado<="010000000000000";
				when Tv => endis<='1'; led<='1';salida_estado<="100000000000000";
				when Tw => encnt2<='1';
							  if (fintx='0') then sinctx<='1';end if;
							  --elsif (fintx='1') then reset_msi<='1';end if;
		end case;
	end process;
end sol;
				
				
				
				
				
				
				
				
					
					
					
			