library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity P_Counter_TB is
end P_Counter_TB;

architecture Behavioral of P_Counter_TB is

component P_Counter
    port (
        D : in std_logic_vector;
        Res, Clk : in std_logic;
        Q : out std_logic_vector (2 downto 0));
end component;

signal Res, Clk : std_logic;
signal Q, D : std_logic_vector (2 downto 0);
constant clock_period : time := 20ns;

begin

UUT: P_Counter port map(
    D => D,
    Res => Res,
    Clk => Clk,
    Q => Q
);

clock_process: process
  begin
    Clk <= '0';
  wait for clock_period/2;
    Clk <= '1';
  wait for clock_period/2;
end process;

sim: process
  begin
    D <= "000";
    Res <= '0';
    wait for 100 ns;
    
    D <= "001";
    wait for 100 ns;
    
    D <= "010";
    wait for 100 ns;
    
    D <= "011";
    wait for 100 ns;
    
    D <= "100";
    wait for 100 ns;
    
    D <= "101";
    wait for 100 ns;
    
    D <= "110";
    wait for 100 ns;
    
    D <= "111";
    wait for 100 ns;
    
    Res <= '1';
    wait;
    
end process;
end Behavioral;
