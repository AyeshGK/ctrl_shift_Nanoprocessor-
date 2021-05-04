library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Reg;

architecture Behavioral of Reg is

component D_FF
    Port (  D : in STD_LOGIC;
            Res : in STD_LOGIC;
            Clk : in STD_LOGIC;
            Q : out STD_LOGIC;
            Qbar : out STD_LOGIC);
end component;

signal D_out:std_logic_vector(3 downto 0);

begin

    D_FF_0 : D_FF
        port map (
            D => D(0),
            Res => Res,
            Clk => Clk,
            Q => D_out(0)
        );

    D_FF_1 : D_FF
        port map (
            D => D(1),
            Res => Res,
            Clk => Clk,
            Q => D_out(1)
        );
    D_FF_2 : D_FF
        port map (
            D => D(2),
            Res => Res,
            Clk => Clk,
            Q => D_out(2)
        );
    D_FF_3 : D_FF
        port map (
            D => D(3),
            Res => Res,
            Clk => Clk,
            Q => D_out(3)
        );
    if En = '1' then
        Q <= D_out;
    end if;

end Behavioral; 