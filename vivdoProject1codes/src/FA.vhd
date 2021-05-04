----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/27/2021 02:16:54 PM
-- Design Name: 
-- Module Name: FA - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FA is
    Port ( A : in STD_LOGIC; --input A 
           B : in STD_LOGIC; --input B
           C_in : in STD_LOGIC; --Carry in
           S : out STD_LOGIC;  -- Sum
           C_out : out STD_LOGIC); --Carry out
end FA;

architecture Behavioral of FA is

component HA  
        port (  
        A: in std_logic; 
        B: in std_logic;  
        S: out std_logic;
        C: out std_logic);  
    end component;
    
    signal HA0_S,HA0_C,HA1_S,HA1_C : std_logic;

begin

    HA_0:HA
    port map(
        A=>A,
        B=>B,
        S=>HA0_S,
        C=>HA0_C);
    
    HA_1:HA
        port map(
        A => HA0_S,
        B => C_in,
        S => HA1_S,
        C => HA1_C);
                

S <= HA1_S;
C_out <= HA0_C or HA1_C;

end Behavioral;
