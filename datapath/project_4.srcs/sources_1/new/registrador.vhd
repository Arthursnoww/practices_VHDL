----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2024 11:05:07 PM
-- Design Name: Arthur Roberto
-- Module Name: registrador - Behavioral
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


entity registrador is 
    generic (N: integer := 16);
    port ( clk, rst, ld : in std_logic ; -- ld quando '1' permite que o registrador armazene dados 
          d : in std_logic_vector(n-1 downto 0) ; --dados de entrada 
          q : out std_logic_vector(n-1 downto 0)  -- valor de saida do registrador
    
    
    );
    
end registrador;

architecture Behavioral of registrador is

begin
    process(clk)
    begin 
        if rising_edge(clk) then 
            if rst= '1' then
                q<=(others=> '0');
            else 
                if ld= '1' then
                    q <= d; 
                    end if; 
             end if;
        end if;
    end process; 


end Behavioral;
