library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity regfile is -- three-port register file
  port
  (
    clk           : in std_logic;
    we3           : in std_logic;
    ra1, ra2, wa3 : in std_logic_vector(3 downto 0);
    wd3, r15      : in std_logic_vector(31 downto 0);
    rd1, rd2      : out std_logic_vector(31 downto 0)
  );
end regfile;

architecture behave of regfile is
  type ramtype is array (31 downto 0) of std_logic_vector(31 downto 0);
  signal mem : ramtype;
begin
  process (clk) 
  begin
    if rising_edge(clk) then
      if we3 = '1' then
        mem(to_integer(unsigned(wa3))) <= wd3;
      end if;
    end if;
  end process;

  process (clk, we3)
  begin
    if to_integer(unsigned(ra1)) = 15 then
      rd1 <= r15;
    else
      rd1 <= mem(to_integer(unsigned(ra1)));
    end if;
    
    if to_integer(unsigned(ra2)) = 15 then
      rd2 <= r15;
    else
      rd2 <= mem(to_integer(unsigned(ra2)));
    end if;
  end process;
end behave;
