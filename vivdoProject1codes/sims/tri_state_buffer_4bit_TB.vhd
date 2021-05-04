library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tri_state_buffer_4bit_TB is
--  Port ( );
end tri_state_buffer_4bit_TB;

architecture Behavioral of tri_state_buffer_4bit_TB is
component tri_state_buffer_4bit
port(   IN4 : in STD_LOGIC_VECTOR (3 downto 0);
        OUT4 : out STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC);
end component;
signal IN4 : std_logic_vector(3 downto 0);
signal OUT4 : std_logic_vector(3 downto 0);
signal EN : std_logic;
begin
UUT: tri_state_buffer_4bit
port map( IN4 => IN4,
            OUT4=> OUT4,
            EN=>EN);
process
begin

IN4<= "1100";
EN<='0';

wait for 100ns;
EN<='1';
wait;

end process;
end Behavioral;
