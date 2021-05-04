library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P_Counter is
    Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end P_Counter;

architecture Behavioral of P_Counter is
 component D_FF
 port (
 D : in STD_LOGIC;
 Res: in STD_LOGIC;
 En : in STD_LOGIC;
 Clk : in STD_LOGIC;
 Q : out STD_LOGIC;
 Qbar : out STD_LOGIC);
 end component;

begin

 D_FF0 : D_FF
 port map (
 D => D(0),
 Res => Res,
 En => '1',
 Clk => Clk,
 Q => Q(0));
 
 D_FF1 : D_FF
 port map (
 D => D(1),
 Res => Res,
 En => '1',
 Clk => Clk,
 Q => Q(1)); 

 D_FF2 : D_FF
 port map (
 D => D(2),
 Res => Res,
 En => '1',
 Clk => Clk,
 Q => Q(2));

end Behavioral;