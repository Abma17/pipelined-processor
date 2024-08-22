library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_32bit is
    Port (
        A, B : in  STD_LOGIC_VECTOR (31 downto 0);
        ALUControl : in  STD_LOGIC_VECTOR (2 downto 0);
        Result : out  STD_LOGIC_VECTOR (31 downto 0);
        Flags : out  STD_LOGIC_VECTOR (3 downto 0)
    );
end ALU_32bit;

architecture Behavioral of ALU_32bit is
    signal  N,C,V,Z : STD_LOGIC;
begin
    process (A, B, ALUControl)
        variable temp : STD_LOGIC_VECTOR(31 downto 0);
        variable sum_result : UNSIGNED(32 downto 0);
    begin
        case to_integer(unsigned(ALUControl)) is
            when 0 => -- Addition
                sum_result := unsigned(A) + unsigned(B);
                temp := std_logic_vector(sum_result(31 downto 0));
                if sum_result(32) = '1' then -- C out
                    C <= '1';
                else
                    C <= '0';
                end if;
                if temp(31) = '1' then -- N
                    N <= '1';
                else
                    N <= '0';
                end if;
                if temp = x"00000000" then -- Z
                    Z <= '1';
                else
                    Z <= '0';
                end if;
                if temp(31) /= A(31) and temp(31) /= B(31) then -- V
                    V <= '1';
                else
                    V <= '0';
                end if;
                Result <= temp;
                Flags <= N&C&Z&V;

            when 1 => -- Subtraction
                sum_result := unsigned(A) - unsigned(B);
                temp := std_logic_vector(sum_result(31 downto 0));
                if sum_result(32) = '1' then -- C out
                    C <= '1';
                else
                    C <= '0';
                end if;
                if temp(31) = '1' then -- N
                    N <= '1';
                else
                    N <= '0';
                end if;
                if temp = x"00000000" then -- Z
                    Z <= '1';
                else
                    Z <= '0';
                end if;
                if temp(31) /= A(31) and temp(31) /= not B(31) then -- V
                    V <= '1';
                else
                    V <= '0';
                end if;
                Result <= temp;
                Flags <= N&C&Z&V;

            when 2 => -- Logical AND
                Result <= A and B;
                V <= '0';
                N <= '0';
                Z <= '0';
                C <= '0';
                Flags <= N&C&Z&V;

            when 3 => -- Logical OR
                Result <= A or B;
                V <= '0';
                N <= '0';
                Z <= '0';
                C <= '0';
                Flags <= N&C&Z&V;

            when 4 => -- Logical NOT
                Result <= not A;
                V <= '0';
                N <= '0';
                Z <= '0';
                C <= '0';
                Flags <= N&C&Z&V;

            when others =>
                Result <= (others => 'X');
                V <= 'X';
                N <= 'X';
                Z <= 'X';
                C <= 'X';
                Flags <= N&C&Z&V;
        end case;
    end process;
end Behavioral;
