library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2way_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC);
end Mux_2way_4bit;

architecture Behavioral of Mux_2way_4bit is
component tri_state_buffer_4bit
    port (  IN4 : in STD_LOGIC_VECTOR (3 downto 0);
           OUT4 : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component; 
signal NOTS: std_logic;   
begin
tri_state_buffer_0:tri_state_buffer_4bit
port map(   IN4=> A,
            OUT4 => O,
            EN=> NOTS);
tri_state_buffer_1: tri_state_buffer_4bit
port map(   IN4=> B,
            OUT4 =>O,
            EN=>S);

NOTS <= NOT S;

end Behavioral;