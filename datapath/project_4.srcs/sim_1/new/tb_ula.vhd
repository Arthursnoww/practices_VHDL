
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity tb_ula is
--  Port ( );
end tb_ula;

architecture Behavioral of tb_ula is
    constant period: time:= 50ns;
    constant N: INTEGER := 16;
    signal clk: std_logic := '1';
    signal rst: std_logic := '0';
    signal oopa, oopb, rresult: std_logic_vector(15 downto 0);
    signal oop: std_logic_vector(3 downto 0);
    signal ccarry: std_logic := '0';
    signal zzero: std_logic ;
    
    
    
begin
    DUT: entity work.ula 
        generic map(N => 16)
        port map(
            opa => oopa,
            opb => oopb,
            op => oop,
            result => rresult,
            carry => ccarry,
            zero => zzero 
        );

clk <= not clk after PERIOD/2;

reset:process
begin
    rst <= '1';
    wait for 2* period;
    rst <= '0';
    wait;
end process reset; 

test: process
begin
    wait until rst = '0';

    oopA <= X"0005";
    oopB <= X"0003";
    wait for PERIOD;

    -- Test all operations
    for i in 1 to 8 loop
      oop <= conv_std_logic_vector(i, 4);
      wait for PERIOD;
    end loop;

  end process test;
    
end Behavioral;








