library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2way_3bit is
    Port ( Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
           JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           O : out std_logic_vector(2 downto 0));
end Mux_2way_3bit;

architecture Behavioral of Mux_2way_3bit is
component tri_state_buffer_3bit
    port ( IN3 : in STD_LOGIC_VECTOR (2 downto 0);
           OUT3 : out STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC);
end component; 

signal NOTS: std_logic;   
begin
tri_state_buffer_0 :tri_state_buffer_3bit
port map(   IN3 => Adder_3,
            OUT3 => O,
            EN => NOTS);
tri_state_buffer_1: tri_state_buffer_3bit
port map(   IN3 => JUMP_TO,
            OUT3 =>O,
            EN =>S);

NOTS <= NOT S;

end Behavioral;