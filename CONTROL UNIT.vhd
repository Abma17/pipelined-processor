library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CONTROL_UNIT is
  port
  (
    clk                                   : in std_logic;
    rst                                   : in std_logic;
    Flags                                 : in std_logic_vector (3 downto 0);
    Op                                    : in std_logic_vector (1 downto 0);
    Cond                                  : in std_logic_vector (3 downto 0);
    Funct                                 : in std_logic_vector (5 downto 0);
    Rd                                    : in std_logic_vector (3 downto 0);
    PCSel, MemtoReg, ALUSel, RegW, RegSel : out std_logic;
    ALUControl                            : out std_logic_vector (2 downto 0)
  );
end CONTROL_UNIT;

architecture rtl of CONTROL_UNIT is

begin

end architecture;