library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_2way_3bit_TB is
--  Port ( );
end Mux_2way_3bit_TB;
architecture Behavioral of Mux_2way_3bit_TB is
component Mux_2way_3bit
    port(   Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
            JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
            O : out STD_LOGIC_VECTOR (2 downto 0);
            S : in STD_LOGIC);
end component;
signal Adder_3,JUMP_TO : std_logic_vector(2 downto 0);
signal O : std_logic_vector(2 downto 0);
signal S : std_logic;
begin
UUT: Mux_2way_3bit
port map(
            Adder_3(2 downto 0)=>Adder_3(2 downto 0),
            JUMP_TO(2 downto 0)=>JUMP_TO(2 downto 0),
            O(2 downto 0)=> O(2 downto 0),
            S=> S);
process
begin

Adder_3<="001";
JUMP_TO<="100";
S<='0';

WAIT FOR 100ns;
S<='1';
WAIT;
            


end process;
end Behavioral;