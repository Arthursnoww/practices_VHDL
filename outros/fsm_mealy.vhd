----------------------------------------------------------------------------------
-- Company: Universidade Federal do Ceara
-- Engineer: William Marreiro Brito
-- Create Date: 14.03.2024 21:06:30
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm_mealy is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           w : in STD_LOGIC;
           z : inout STD_LOGIC
           --y_out : inout std_logic
    );
end fsm_mealy;

architecture RTL of fsm_mealy is
    type estados is (A, B);
    signal y, y_out: estados;
begin
--ps y_out
--ns y
--    sync_proc : process (clock ,y , reset)
--    begin
--        if ( reset = '0') then
--            y_out <= A;
--        elsif (rising_edge (clock)) then
--            y_out <= y;
--        end if;
--   end process sync_proc ;







    sync_proc : process(clock, reset, w, y)
        begin
        if(reset='0')then
            y<=A;
        elsif(clock'event and clock='1')then
            case y is
                when A =>
                    if(w='1')then -- and z='0'
                        y<=B;
                    else
                        y<=A;
                    end if;
                when B =>
                    if(w = '1')then -- and z='1'
                        y <= B;
                    else
                        y <= A;
                    end if;
            end case;
        end if;
    end process;
    z <= '1' when (y=B and w='1') else '0';
    --y_out <= '0' when y=A else '1';
end RTL;
