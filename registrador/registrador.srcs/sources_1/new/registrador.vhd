library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity registrador is
	generic (N : integer := 8);
	port(
		clk : in STD_LOGIC;
		load : in STD_LOGIC;
		rst: in STD_LOGIC;
		data_in : in STD_LOGIC_VECTOR(N-1 downto 0);
		data_out : out STD_LOGIC_VECTOR(N-1 downto 0)
		);
end registrador;
 
architecture Behavioral of registrador is
begin
	process(clk)
	begin
		if falling_edge(clk) then
			if rst='1' then
				data_out<=(others=>'0');
			else
				if load='1' then
					data_out<=data_in;
				end if;
			end if;
		end if;			
	end process;
 
end Behavioral;