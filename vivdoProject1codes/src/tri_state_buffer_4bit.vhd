library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer_4bit is

Port (      IN4 : in STD_LOGIC_VECTOR (3 downto 0);
            OUT4 : out STD_LOGIC_VECTOR (3 downto 0);
            EN : in STD_LOGIC);
end tri_state_buffer_4bit;

architecture Behavioral of tri_state_buffer_4bit is

begin
OUT4<=IN4 WHEN (EN='1') else "ZZZZ";

end Behavioral;
