------------------------------------------------------------------
-- Fails: Shift_Reg.vhd
-- Autors: Einārs Platacis
-- Apraksts: 4-bitu shift reģistra implementācija
------------------------------------------------------------------

-- library

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- Entity

entity Shift_reg is
port(
	A 		: out std_logic;
	B 		: out std_logic;
	C 		: out std_logic;
	D 		: out std_logic;
	data_in : in  std_logic;
	clk		: in  std_logic;
	reset   : in  std_logic);
end Shift_reg;

-- architecture

architecture behavior of Shift_reg is
-- Defined signals
signal reg_A, reg_B, reg_C, reg_D : std_logic := '0';
-- Begin architecture
begin
	A <= reg_A;
	B <= reg_B;
	C <= reg_C;
	D <= reg_D;
-- Pats process
	process(clk)
	begin
		if(rising_edge(clk)) then
			if(reset = '1') then
				reg_A <= '0';
				reg_B <= '0';
				reg_C <= '0';
				reg_D <= '0';
			else
				reg_A <= data_in;
				reg_B <= reg_A;
				reg_C <= reg_B;
				reg_D <= reg_C;
			end if;
		end if;
	end process;
end behavior;	
