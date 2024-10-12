library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity nand_teste is
Port ( 
    clock : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           x : out STD_LOGIC);
end nand_teste;

architecture Behavioral of nand_teste is

begin
    process--(clock)
    begin
        wait until clock'event and clock='1';
        --if(clock'event and clock='1')then
        if(a='1' and b='1')then
            x<='0';
        else
            x<='1';
        end if;
        end process;

end Behavioral;
