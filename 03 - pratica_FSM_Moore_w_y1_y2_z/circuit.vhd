library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity moore_circuito is
  Port ( 
    clock : in std_logic; 
    reset : in std_logic;
    w     : in std_logic;
    y1    : out std_logic;
    y2    : out std_logic;
    z     : out std_logic
  );
end moore_circuito;

architecture rtl of moore_circuito is
    type estados is (A, B, C);
    signal y : estados;    
begin
    process(clock,reset,w)
    begin
        if(reset = '1')then
            y<=a;
        elsif(clock'event and clock = '1')then
            case y is
                when A =>
                    if(w = '0')then
                        y <= A;
                    else
                        y <= B;
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
    y1 <= '1' when y = B else '0';
    y2 <= '1' when y = C else '0';
    z <= '1' when y = C else '0';
end rtl;