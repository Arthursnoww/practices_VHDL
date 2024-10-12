----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/29/2024 12:34:39 AM
-- Design Name: Arthur Roberto
-- Module Name: tb_register - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_register is
end tb_register;

architecture Behavioral of tb_register is
        signal  Rd, Rm, Rn:              std_logic_vector(15 downto 0);
        signal  Rd_sel, Rm_sel, Rn_sel:  std_logic_vector(2 downto 0);
        signal  Rd_wr, clk, rst:         std_logic := '0';   
begin
        clk <= not clk after 5 ns;
        DUT1: entity work.register_file
                port map(
                    Rd     =>  Rd    ,
                    Rm     =>  Rm    ,
                    Rn     =>  Rn    ,
                    Rd_sel =>  Rd_sel,
                    Rm_sel =>  Rm_sel,
                    Rn_sel =>  Rn_sel,
                    Rd_wr  =>  Rd_wr ,
                    clk    =>  clk   ,
                    rst    =>  rst    
                );
         stimulus_process : process          -- stimulus process
    begin
       
        -- initialize inputs
        rst     <= '1';
        Rd      <= (others => '0');
        Rd_sel  <= (others => '0');
        Rd_wr   <= '0';
        Rm_sel  <= (others => '0');
        Rn_sel  <= (others => '0');
        
        wait for 15 ns;
        rst     <= '0';
        
        -- TEST 1 :
        wait for 20 ns;
        Rd          <= "1111000011110000";  -- set input data
        Rd_sel  <= "000";               -- select register 0
        Rm_sel  <= "001";               -- select register 1
        Rn_sel  <= "010";               -- select register 2
        Rd_wr   <= '1';                 -- enable write
        wait for 10 ns;
        
        -- TEST 2 :
        wait for 20 ns;
        Rd        <= "0000111100001111";  -- set input data
        Rd_sel    <= "011";               -- select register 3
        Rm_sel    <= "100";               -- select register 4
        Rn_sel    <= "101";               -- select register 5
        Rd_wr     <= '1';                 -- enable write
        wait for 10 ns;
        
        -- TEST 3 :
        wait for 20 ns;
        Rd      <= "0101010101010101";  -- set input data
        Rd_sel  <= "110";               -- select register 6
        Rm_sel  <= "111";               -- select register 7
        Rn_sel  <= "000";               -- select register 8
        Rd_wr  <= '1';                 -- enable write
        wait for 10 ns;
        
        -- TEST 4 :
        wait for 20 ns;
        Rd      <= "0011001100110011";  -- set input data
        Rd_sel  <= "001";               -- select register 9
        Rm_sel  <= "010";               -- select register 10
        Rn_sel  <= "011";               -- select register 11
        Rd_wr  <= '1';                 -- enable write
        wait for 10 ns;
        
        -- TEST 5 :
        wait for 20 ns;
        Rd      <= "1111000011110000";  -- set input data
        Rd_sel  <= "100";               -- select register 12
        Rm_sel  <= "101";               -- select register 13
        Rn_sel  <= "111";               -- select register 14
        Rd_wr   <= '1';                 -- enable write
        wait for 10 ns;
        
        -- TEST 6 :
        wait for 20 ns;
        Rd     <= "1010010001000010";  -- set input data
        Rd_sel <= "111";               -- select register 15
        Rm_sel <= "000";               -- select register 0
        Rn_sel <= "001";               -- select register 1
        Rd_wr  <= '1';                 -- enable write
        wait for 10 ns;
        
    end process;
end Behavioral;

