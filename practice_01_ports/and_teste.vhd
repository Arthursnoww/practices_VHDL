library ieee;
use ieee.std_logic_1164.all;

entity and_teste is
    port(
        clock: in std_logic;
        a: in std_logic;
        b: in std_logic;
        x: out std_logic
    );
end and_teste;

architecture RTL1 of ANd_teste is
begin
    --x <= a and b;
    process--(clock)
    begin
        wait until clock'event and clock='1';
        --if(clock'event and clock='1')then
        if(a='1' and b='1')then
            x<='1';
        else
            x<='0';
        end if;
    end process;
end RTL1;













