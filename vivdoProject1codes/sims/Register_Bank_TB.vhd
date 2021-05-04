library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_Bank_TB is
--  Port ( );
end Register_Bank_TB;

architecture Behavioral of Register_Bank_TB is

component Register_Bank
Port ( 
       Clk : in STD_LOGIC;
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
end component;

signal Clk : STD_LOGIC;
signal R_Enable : STD_LOGIC_VECTOR (2 downto 0);
signal Res : STD_LOGIC;
signal D : STD_LOGIC_VECTOR (3 downto 0);
signal R0, R1, R2, R3, R4, R5, R6, R7 : STD_LOGIC_VECTOR (3 downto 0);

begin

UUT : Register_Bank
port map (
    Clk => Clk,
    R_Enable => R_Enable, 
    Res => Res,
    D => D, 
    R0 => R0, 
    R1 => R1, 
    R2 => R2, 
    R3 => R3, 
    R4 => R4, 
    R5 => R5, 
    R6 => R6, 
    R7 => R7 );
    
process
begin
    Res<='1';
    Clk <='0';
    wait for 50 ns;
    Clk <='1';
    wait for 50ns;
    
    D <= "0101";
    Res <= '0';
    Clk <= '0';
    wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    R_Enable <= "001";
    Clk <= '0';
    wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    R_Enable <= "010";
    Clk <= '0';
    wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    R_Enable <= "011";
    Clk <= '0';
    wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    R_Enable <= "100";
    Clk <= '0';
    wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    R_Enable <= "101";
    Clk <= '0';wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    R_Enable <= "110";
    Clk <= '0';wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    R_Enable <= "111";
    Clk <= '0';
    wait for 50 ns;
    
    Clk <= '1';
    wait for 50 ns;
    
    Res <= '1';
    Clk <= '0';
    wait for 50 ns;
    
    Clk <= '1';
    wait;
        
end process;
end Behavioral;
