library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ram is
    Generic
    (
        addr_width : integer := 5;
        data_width : integer := 8
    );
    Port 
    ( 
        clk      : in  std_logic;                                    -- clock
        wr       : in  std_logic;                                    -- write enable
        rd		 : in  std_logic;
        addr     : in  std_logic_vector(addr_width-1 downto 0);      -- addr input
        data     : inout  std_logic_vector(data_width-1 downto 0);      -- data input
    );
end ram;

architecture Behavioral of ram is
    type memory is array (0 to (2**addr_width)-1) of std_logic_vector(data_width-1 downto 0);
    signal ram_block   : memory := (others => (others => '0'));

begin
    process(clk)
    begin
   		if rising_edge(clk) then
          if wr = '1' then  -- Operação de escrita
              memory(to_integer(unsigned(addr))) <= data;
          elsif rd = '1' then  -- Operação de leitura
              data <= memory(to_integer(unsigned(addr)));
          end if;
        end if;
    end process;
    dout <= ram_block(to_integer(unsigned(address)));
end Behavioral;
