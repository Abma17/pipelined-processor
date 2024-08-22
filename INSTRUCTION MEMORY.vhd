library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity InstructionMemory is
  port
  (
    Address     : in std_logic_vector(7 downto 0); -- Address input (8-bit address bus, for 256 instructions)
    Instruction : out std_logic_vector(31 downto 0) -- Instruction output (32-bit instruction)
  );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
  -- Declare the ROM as an array of 32-bit instructions
  type memory_array is array (255 downto 0) of std_logic_vector(31 downto 0);
  signal ROM : memory_array;
begin
  -- On every change of Address, output the corresponding instruction
  process (Address)
  begin
    Instruction <= ROM(to_integer(unsigned(Address)));
  end process;
end Behavioral;