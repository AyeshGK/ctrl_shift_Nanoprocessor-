library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer_3bit is

Port (      IN3 : in STD_LOGIC_VECTOR (2 downto 0);
            OUT3 : out STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC);
end tri_state_buffer_3bit;

architecture Behavioral of tri_state_buffer_3bit is

begin
OUT3<=IN3 WHEN (EN='1') else "ZZZ";

end Behavioral;
