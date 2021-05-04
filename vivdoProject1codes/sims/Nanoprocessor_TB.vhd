library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nanoprocessor_TB is
--  Port ( );
end Nanoprocessor_TB;

architecture Behavioral of Nanoprocessor_TB is

component NanoProcessor
    Port (
               Reset : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Zero : out STD_LOGIC;
               Overflow : out STD_LOGIC;
               Reg_7_LED : out STD_LOGIC_VECTOR (3 downto 0); 
               S_7seg : out STD_LOGIC_VECTOR (6 downto 0) 
        );
end component;

constant clk_period:time:=10ns;

signal Reset,Clk,Zero,Overflow:std_logic;
signal Reg_7_LED:std_logic_vector(3 downto 0);
signal S_7seg:std_logic_vector(6 downto 0);

begin

UUT:NanoProcessor
    Port map(
               Reset =>Reset,
               Clk =>Clk,
               Zero =>Zero,
               Overflow =>Overflow,
               Reg_7_LED =>Reg_7_LED, 
               S_7seg  =>S_7seg
        );

clk_sim:process
            begin
                Clk <= '0';
                wait for clk_period/2;
                
                Clk <= '1';
                wait for clk_period/2;
        end process;        
                                
        
sim:process 
        begin
            Reset <='1';
            wait for 100ns ;
            Reset <='0';
            wait;
        
end process;                
end Behavioral;
