library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_Bank is
    Port ( Clk : in STD_LOGIC;
           R_Enable : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (3 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end Register_Bank;

architecture Behavioral of Register_Bank is

component Reg
port(
    D : in STD_LOGIC_VECTOR (3 downto 0);
    En : in STD_LOGIC;
    Res : in STD_LOGIC;
    Clk : in STD_LOGIC;
    Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8
Port ( 
    I : in STD_LOGIC_VECTOR (2 downto 0);
    EN : in STD_LOGIC;
    Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal En_Reg : std_logic_vector (7 downto 0);

begin

Decoder : Decoder_3_to_8
port map (
    I => R_Enable,
    En => '1',
    Y => En_Reg);
    
Reg_0 : Reg
port map (
    D => "0000",
    En => '1',
    Res => Res,
    Clk => Clk,
    Q => R0);
    
Reg_1 : Reg
port map (
    D => D,
    En => En_Reg(1),
    Res => Res,
    Clk => Clk,
    Q => R1);
 
Reg_2 : Reg
port map (
    D => D,
    En => En_Reg(2),
    Res => Res,
    Clk => Clk,
    Q => R2);

Reg_3 : Reg
port map (
    D => D,
    En => En_Reg(3),
    Res => Res,
    Clk => Clk,
    Q => R3);
    
Reg_4 : Reg
port map (
    D => D,
    En => En_Reg(4),
    Res => Res,
    Clk => Clk,
    Q => R4);
    
Reg_5 : Reg
port map (
    D => D,
    En => En_Reg(5),
    Res => Res,
    Clk => Clk,
    Q => R5);
 
Reg_6 : Reg
port map (
    D => D,
    En => En_Reg(6),
    Res => Res,
    Clk => Clk,
    Q => R6);

Reg_7 : Reg
port map (
    D => D,
    En => En_Reg(7),
    Res => Res,
    Clk => Clk,
    Q => R7);     

end Behavioral;