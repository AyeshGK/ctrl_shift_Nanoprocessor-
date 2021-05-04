library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer_3bit_TB is
--  Port ( );
end tri_state_buffer_3bit_TB;

architecture Behavioral of tri_state_buffer_3bit_TB is
component tri_state_buffer_3bit
port(   IN3 : in STD_LOGIC_VECTOR (2 downto 0);
        OUT3 : out STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC);
end component;
signal IN3 : std_logic_vector(2 downto 0);
signal OUT3 : std_logic_vector(2 downto 0);
signal EN : std_logic;
begin
UUT: tri_state_buffer_3bit
port map( IN3 => IN3,
            OUT3=> OUT3,
            EN=>EN);
process
begin

IN3<= "110";
EN<='0';

wait for 100ns;
EN<='1';
wait;

end process;
end Behavioral;
