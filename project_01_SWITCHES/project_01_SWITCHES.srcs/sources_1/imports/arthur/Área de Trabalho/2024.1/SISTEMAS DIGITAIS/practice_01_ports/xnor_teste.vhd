library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xnor_teste is
    Port ( 
    clock : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end xnor_teste;

architecture Behavioral of xnor_teste is

begin
    --x <= a or b;
    process--(clock)
    begin
        wait until clock'event and clock='1';
        --if(clock'event and clock='1')then
        if(a=b)then
            x<='1';
        else
            x<='0';
        end if;
    end process;

end Behavioral;
