----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2024 09:47:28 AM
-- Design Name: Arthur Roberto 
-- Module Name: mux4x1 - Behavioral
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
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity mux4x1 is
    generic (N : INTeger := 16);
    port( 
            i0, i1, i2, i3 : in std_logic_vector(n-1 downto 0);
            sel: in std_logic_vector(2 downto 0);
            rd_out: out std_logic_vector(n-1 downto 0)
    );
end mux4x1;

architecture Behavioral of mux4x1 is

begin

with sel select
rd_out <=   I0 when "00",
            I1 when "01", 
            I2 when "10",
            I3 when "11";
end Behavioral;
