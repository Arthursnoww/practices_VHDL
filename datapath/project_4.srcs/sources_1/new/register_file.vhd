----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/28/2024 11:31:04 PM
-- Design Name: Arthur Roberto
-- Module Name: register_file - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity register_file is
    generic(N: integer := 16);
    Port ( 
        Rd      : in    std_logic_vector(N-1 downto 0); --dados que serão escritos no registrador
        Rm      : out   std_logic_vector(N-1 downto 0) := (others => '0'); 
        Rn      : out   std_logic_vector(N-1 downto 0):= (others => '0');
        Rd_sel  : in    std_logic_vector(2 downto 0); --seleciona qual registrador deve ser escrito
        Rm_sel  : in    std_logic_vector(2 downto 0); -- seleciona o registrador que será lido como saida do rm
        Rn_sel  : in    std_logic_vector(2 downto 0); ---- seleciona o registrador que será lido como saida do rn
        Rd_wr   : in    std_logic; -- se '1' 'rd' deve ser escrito no registrador
        clk     : in    std_logic;
        rst     : in    std_logic
        );
end register_file;

architecture Behavioral of register_file is
    type    register_array  is array (0 to 7) of std_logic_vector(n-1 downto 0);
    signal  register_result : register_array;                                           -- signal to access register file from everywhere 
    signal  register_active : std_logic_vector(7 downto 0);                             --what register is in use
begin
    
    generate_registers:
    for i in 0 to 7 generate
        register_active(i) <= '1' when (Rd_sel = i and Rd_wr = '1') else '0';  
        R: entity work.registrador
            generic map (N => 16)
            port map(
                    D   =>  Rd,
                    ld  => register_active(i),
                    clk => clk,
                    rst => rst,
                    Q   => register_result(i)
                    );  
    end generate;
    
    Rm <= register_result(conv_integer(Rm_sel));
    Rn <= register_result(conv_integer(Rn_sel));    

end Behavioral;