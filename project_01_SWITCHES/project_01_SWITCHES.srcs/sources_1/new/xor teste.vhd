library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity xor_teste is
    Port ( 
    clock : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end xor_teste;

architecture Behavioral of xor_teste is

begin
    --x <= a or b;
    process--(clock)
    begin
        wait until clock'event and clock='1';
        --if(clock'event and clock='1')then
        if(a=b)then
            x<='0';
        else
            x<='1';
        end if;
    end process;

end Behavioral;
