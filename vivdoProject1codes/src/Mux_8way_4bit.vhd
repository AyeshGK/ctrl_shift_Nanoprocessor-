library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_8way_4bit is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C : in STD_LOGIC_VECTOR (3 downto 0);
           D : in STD_LOGIC_VECTOR (3 downto 0);
           E : in STD_LOGIC_VECTOR (3 downto 0);
           F : in STD_LOGIC_VECTOR (3 downto 0);
           G : in STD_LOGIC_VECTOR (3 downto 0);
           H : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0));
end Mux_8way_4bit;

architecture Behavioral of Mux_8way_4bit is
Component Decoder_3_to_8
    port(   I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
 end component;

Signal Y0 : std_logic_vector(7 downto 0);

component tri_state_buffer_4bit
    port(  IN4 : in STD_LOGIC_VECTOR (3 downto 0);
           OUT4 : out STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC);
end component;
begin

Decoder_3_to_8_0 : Decoder_3_to_8
    port map (  I => S,
            EN => '1',
            Y => Y0);
tri_state_buffer_0 : tri_state_buffer_4bit
    port map(   IN4 => A,
                EN=> Y0(0),
                OUT4 => O);
tri_state_buffer_1 : tri_state_buffer_4bit
    port map(   IN4 => B(3 downto 0),
                EN=> Y0(1),
                OUT4 => O(3 downto 0));
tri_state_buffer_2 : tri_state_buffer_4bit
    port map(   IN4 => C(3 downto 0),
                EN=> Y0(2),
                OUT4 => O(3 downto 0));
tri_state_buffer_3 : tri_state_buffer_4bit
    port map(   IN4 => D(3 downto 0),
                EN=> Y0(3),
                OUT4 => O(3 downto 0));
tri_state_buffer_4 : tri_state_buffer_4bit
    port map(   IN4 => E(3 downto 0),
                EN=> Y0(4),
                OUT4 => O(3 downto 0));
tri_state_buffer_5 : tri_state_buffer_4bit
    port map(   IN4 => F(3 downto 0),
                EN=> Y0(5),
                OUT4 => O(3 downto 0));
tri_state_buffer_6 : tri_state_buffer_4bit
    port map(   IN4 => G(3 downto 0),
                EN=> Y0(6),
                OUT4 => O(3 downto 0));
tri_state_buffer_7 : tri_state_buffer_4bit
    port map(   IN4 => H(3 downto 0),
                EN=> Y0(7),
                OUT4 => O(3 downto 0));                

end Behavioral;
