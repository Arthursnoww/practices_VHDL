----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2024 04:39:03 PM
-- Design Name: Arthur Roberto
-- Module Name: ula - Behavioral
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
use IEEE. std_logic_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;


entity ula is
    generic (N: integer := 16);
    port (
        opA, opB : in std_logic_vector(15 downto 0);
        op : in std_logic_vector(3 downto 0);
        result : out std_logic_vector(15 downto 0);
        carry, zero: inout std_logic 
);
end ula;

architecture Behavioral of ula is
signal result_s, opa_s, opb_s : std_logic_vector(15 downto 0);
signal result_mul: std_logic_vector(15 downto 0);
begin
    result<= result_s( 15 downto 0);
    opA_s <= opA;  -- opA com um bit a mais
    opB_s <= opB;  -- opB com um bit a mais
    result_mul <= std_logic_vector(unsigned(opA_s) * unsigned(opB_s));
    
    ula: process( op, opa, opb)
    begin
        case op is 
          when "0001" =>
           result_s <= opa and opb;
          when "0010" => 
          result_s <= opa or opb; 
          when "0011" => result_s <= not opa; 
          when "0100" => result_s <= opa + opb;
          when "0101" => result_s <= opa - opb;
          when "0110" => result_s <= opa xor opb;
          when "0111" => result_s <= result_mul(15 downto 0);
          when "1000" => result_s <= std_logic_vector(shift_left(unsigned(opA), to_integer(unsigned(opB))));
          when others => result_s <= (others => '0');
          end case;
end process ula; 

 z: process(result_s) is
    begin

    for i in n-1 downto 0 loop
        if result_s(i) = '1' then
            zero <= '0';
            exit;
        else
            zero <= '1';
        end if;
    end Loop;
    
 end process z;

end Behavioral; 
