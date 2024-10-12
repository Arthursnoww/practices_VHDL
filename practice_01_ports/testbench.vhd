library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
    Port ( 
        clock: in std_logic :='0';
        a: in std_logic;
        b: in std_logic;
        x_xor: out std_logic
        
    );
end testbench;

architecture Behavioral of testbench is 
--componentes, cada teste tem um
    component AND_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );
    end component;
   component or_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    component NOR_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    component NAND_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    component XOR_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    component XNOR_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    component NOT_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            x: out std_logic
        );    
    end component;
    component LACTH_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    component FFD_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            x: out std_logic
        );    
    end component;
    component hall_adder_TESTE is
        port(
            clock: in std_logic;
            a: in std_logic;
            b: in std_logic;
            x: out std_logic
        );    
    end component;
    
    --signal clock: std_logic := '1';
    --signal a,b: std_logic := '0';
    signal x_and: std_logic;
    signal x_or: std_logic;
    signal x_nor: std_logic;
    signal x_nand: std_logic;
    --signal x_xor: std_logic;
    signal x_xnor: std_logic;
    signal x_not: std_logic;
    signal x_lacth: std_logic;
    signal x_ffd: std_logic;
    signal x_ha: std_logic;
    constant clock_periodo:time:= 50 ns;
        
begin
    --clock<= not clock after clock_periodo/2;
    DUT1:and_teste port map(clock,a,b,x_and);
    DUT2:or_teste port map(clock,a,b,x_or);
    DUT3:nor_teste port map(clock,a,b,x_nor);
    DUT4:nand_teste port map(clock,a,b,x_nand);
    DUT5:xor_teste port map(clock,a,b,x_xor);
    DUT6:xnor_teste port map(clock,a,b,x_xnor);
    DUT7:not_teste port map(clock,a,x_not);
    DUT8:lacth_teste port map(clock,a,b,x_lacth);
    DUT9:ffd_teste port map(clock,a,x_ffd);
    DUT11:hall_adder_teste port map(clock,a,b,x_ha);
    

    estimulos:process
    begin
        --teste1
          --a<='0';
          --b<='0';
        --wait for clock_periodo;
        --teste2
          --a<='0';
          --b<='1';
        --wait for clock_periodo;
        --teste3
--          a<='1';
--          b<='0';
--        wait for clock_periodo;
--        --teste4
--          a<='1';
--          b<='1';
--        wait for clock_periodo;
    
    end process;
end Behavioral;










