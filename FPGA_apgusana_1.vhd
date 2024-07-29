library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.math_real.ALL;
use IEEE.numeric_std.ALL;

entity FPGA_apgusana_1 is
	Generic(
		NUM_LEDS		: integer := 9;
		CLK_RATE		: integer := 50000000;
		LED_RATE		: integer := 2);
	Port(
		CLK	:	in std_logic;
		RESET :	in std_logic;
		LED	:	out std_logic_vector(NUM_LEDS-1 downto 0));
end FPGA_apgusana_1;

architecture behaviour of FPGA_apgusana_1 is
		constant MAX_VALUE : integer := CLK_RATE/LED_RATE;
		constant BIT_DEPTH : integer := integer(ceil(log2(real(MAX_VALUE))));
		signal count_reg	:	unsigned(BIT_DEPTH-1 downto 0) 			:= (others => '0');
		signal led_reg		:	std_logic_vector(NUM_LEDS-1 downto 0)	:= (others => '0');
		begin
			LED <= led_reg;
			count_proc: process(CLK)
			begin
				if rising_edge(CLK) then
					if((RESET = '0') or (count_reg = MAX_VALUE)) then
						count_reg <= (others => '0');
					else
						count_reg <= count_reg + 1;
					end if;
				end if;
			end process;
			
			led_proc: process(CLK)
			begin
				if rising_edge(CLK) then
					if(count_reg = MAX_VALUE) then
						led_reg <= not led_reg;
					end if;
				end if;
			end process;		
end behaviour;