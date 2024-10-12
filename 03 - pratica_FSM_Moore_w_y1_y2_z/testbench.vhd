library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
        signal reset,w :std_logic := '0';
        signal clock :std_logic := '1';
        signal z,y1,y2: std_logic;
        constant clock_periodo:time:=50 ns;
   --constant clock_frequencyHz : integer := 50e6; -- 50MHz
   --constant clock_periodo: time := 5000 ms/clock_frequencyHz;
    
begin
    clock<=not clock after clock_periodo/2;
    DUT: entity work.moore_circuito port map(clock => clock,reset => reset,w => w,y1 => y1,y2 => y2,z => z);
    
    
    process 
    begin
        -- w = 0 1 0 1 1 0 1 1 1 0 1
        -- z = 0 0 0 0 0 1 0 0 1 1 0
        reset<='1';w<= '0'; wait for clock_periodo;
        reset<='0'; wait for clock_periodo;
        w<= '0'; wait for clock_periodo;
        w<= '1'; wait for clock_periodo;
        w<= '0'; wait for clock_periodo;
        w<= '1'; wait for clock_periodo;
        w<= '1'; wait for clock_periodo;
        w<= '0'; wait for clock_periodo;
        w<= '1'; wait for clock_periodo;
        w<= '1'; wait for clock_periodo;
        w<= '1'; wait for clock_periodo;
        w<= '0'; wait for clock_periodo;
        w<= '1'; wait for clock_periodo;
        
        
    end process;
end Behavioral;