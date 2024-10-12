library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity lacth_teste is
    Port ( 
    clock : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end lacth_teste;

architecture Behavioral of lacth_teste is

begin
    --x <= a or b;
    process--(clock)
    begin
        wait until clock'event and clock='1';
        --if(clock'event and clock='1')then
        if(a='1' and b='0')then
            x<='1';
        elsif(a='0' and b='1')then
            x<='0';
        else 
       
        end if;
    end process;

end Behavioral;