----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/30/2024 10:01:31 AM
-- Design Name: Arthur Roberto
-- Module Name: datapath - Behavioral
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
use ieee.std_logic_arith;
use ieee.std_logic_unsigned;



entity datapath is
    generic (n : integer := 16);
    port( 
         clk : in STD_LOGIC;
  	     rst : in STD_LOGIC; 
  	     carry: inout STD_LOGIC; 
  	     zero: inout STD_LOGIC; 


         --Register file (RF)         
         Rd_wr: in std_logic :='0';         
         Rd_sel: in std_logic_vector(2 downto 0);
         Rm_sel: in std_logic_vector(2 downto 0);
         Rn_sel: in std_logic_vector(2 downto 0);
         
         --ULA         
         ula_op:in std_logic_vector(3 downto 0);
         
         --ula out
         rm_dout: out std_logic_vector(N-1 downto 0);
         rn_dout: out std_logic_vector(N-1 downto 0);
         
         --mux
         immediate: in std_logic_vector(N-1 downto 0);         
         RF_sel: in std_logic_vector(1 downto 0);
         ram_dout: in std_logic_vector(N-1 downto 0)
         
    
    );
end datapath;

architecture Behavioral of datapath is

signal s_Rd: std_logic_vector(N-1 downto 0) := (others =>'0');  -- rd do register file
signal s_Rm_dout:  std_logic_vector(N-1 downto 0); -- saida rm do register file
signal s_Rn_dout:  std_logic_vector(N-1 downto 0); -- saida rn do register file

signal s_i3: std_logic_vector(N-1 downto 0);


begin

ULA: entity work.ula
     generic map(N => 16)
     port map( opa => s_Rm_dout,
               opb => s_Rn_dout,
               result=> s_i3,
               op => ula_op,
               carry => carry,
               zero => zero 
        );
        
RF:entity work.register_file
   generic map(N => 16)
   port map( clk => clk,
             rst => rst, 
             rd => s_rd,
             Rd_sel => Rd_sel,
             Rd_wr => Rd_wr,
             Rm => Rm_dout,
             Rm_sel => Rm_sel,
             Rn => Rn_dout,
             Rn_sel => Rn_sel
            );               

RAM_Mux: entity work.mux4x1 
    generic map (N =>16)
    port map ( sel => Rf_sel,
           I0  => s_Rm_dout,
           I1  => immediate,
           i2  => ram_dout,
           i3  => s_rn_dout,
           rd_out  => s_rd
           );


end Behavioral;
