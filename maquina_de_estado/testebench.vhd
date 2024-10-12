library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
  --Port ( 
           --clock : in STD_LOGIC;
           --reset : in STD_LOGIC;
           --w : in STD_LOGIC;
           --z : out STD_LOGIC 
  
--  );
end testbench;

architecture Behavioral of testbench is

component fsm_moore is
    Port ( clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           w : in STD_LOGIC;
           z : out STD_LOGIC);
end component;


signal clock: std_logic :='1';
signal reset, w: std_logic := '0';
type estados is (A, B, C);
signal y : estados;
signal z :  std_logic;
constant clock_freq:integer:= 50;
constant clock_periodo:time:= 50 ns;
--constant clock_frequency:integer:=50e6;
--constant clock_periodo:time:= 5000 ms/clock_frequency;


begin
    DUT: entity work.fsm_moore(RTL) 
    generic map(clock_periodo=>clock_freq)
    port map(clock, reset, w, z);
    clock<= not clock after clock_periodo/2;
    
    process 
    begin
        -- w = 0 1 0 1 1 0 1 1 1 0 1
        -- z = 0 0 0 0 0 1 0 0 1 1 0
        
        reset<='0'; wait for clock_periodo;
        reset<='1'; wait for clock_periodo;
        
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        w<='0'; wait for clock_periodo;
        w<='1'; wait for clock_periodo;
        
    end process;
end Behavioral;