library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_moore is
    generic(clock_periodo:integer);
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           w : in STD_LOGIC;
           z : out STD_LOGIC);
end fsm_moore;

architecture RTL of fsm_moore is
    type estados is (A, B, C);
    signal y : estados;
  
  
    
begin
    process(clock, reset, w)
        begin
        if(reset='0')then
            y<=A;
        elsif(clock'event and clock='0')then
            case y is
                when A =>
                    if(w='0')then
                        y<=A;
                    else
                        y<=B;
                    end if;
                when B =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= C;
                    end if;
                when C =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= C;
                    end if;
            end case;
        end if; 
    end process;
    z <= '1' when y=C else '0';
    
end RTL;