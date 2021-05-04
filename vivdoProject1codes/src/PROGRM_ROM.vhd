library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
--get numeric library 

entity PROGRM_ROM is
    Port ( SEL : in STD_LOGIC_VECTOR (2 downto 0);
           INSTUC : out STD_LOGIC_VECTOR (11 downto 0));
end PROGRM_ROM;

architecture Behavioral of PROGRM_ROM is

--                  heigth of rom(8)                width of rom(12) (instruction width)
type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);
    signal PR_ROM:rom_type:=(
            "100010000011", -- MOVI R1, 3
            "100100000001", -- MOVI R2, 1
            "010100000000", -- NEG R2
            "001110010000", -- ADD R7, R1
            "000010100000", -- ADD R1, R2
            "110010000111", -- JZR R1,7
            "110000000011", -- JZR R0,3
            "110000000111"  -- JZR R0,7
    );

begin

    --select instruction for given value
    --use numeric library to convert binary to integer value
    INSTUC <= PR_ROM(to_integer(unsigned(SEL))); 

end Behavioral;
