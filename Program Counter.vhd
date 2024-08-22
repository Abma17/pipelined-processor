library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Program_Counter is
    port (
        clk : in std_logic;
        rst : in std_logic;
        PCin : in std_logic_vector (31 downto 0);
        PCout : out std_logic_vector (31 downto 0)
    );
end Program_Counter;

architecture rtl of Program_Counter is

begin
    process (clk) 
    begin
      if rising_edge(clk) then
        if rst= '1' then
            PCout<=  x"00000000";
        else
            PCout <= PCin;
        end if;
      end if;
    end process;
end architecture;