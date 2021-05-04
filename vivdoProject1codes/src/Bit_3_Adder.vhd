library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Bit_3_Adder is
    Port (
            A : in STD_LOGIC_VECTOR(2 downto 0); --get inputs for A as vector array (first number)
            B : in STD_LOGIC_VECTOR(2 downto 0); --get inputs for B as vector array (seconed number)
            C_in : in STD_LOGIC;                 --initial carry bit for first adding 
            S : out STD_LOGIC_VECTOR(2 downto 0);--sum output 
            C_out : out STD_LOGIC                --carry output
    );               
           
end Bit_3_Adder;

architecture Behavioral of Bit_3_Adder is
-- import RCA_4

    component FA  
        port (  
        A: in std_logic;  
        B: in std_logic;
        C_in: in std_logic;  
        S: out std_logic;
        C_out: out std_logic);  
    end component;


    SIGNAL FA0_C, FA1_C : std_logic; 


begin
     FA_0 : FA
        port map (  
            A => A(0),  
            B => B(0),
            C_in =>C_in,--set ground in the nano processor
            S => S(0),  
            C_Out => FA0_C); 

    FA_1 : FA
        port map (  
            A => A(1),  
            B => B(1),
            C_in => FA0_C,   
            S => S(1),  
            C_Out => FA1_C);

    FA_2 : FA
        port map (  
            A => A(2),  
            B => B(2),
            C_in => FA1_C,   
            S => S(2),  
            C_Out => C_out);    
        
    
end Behavioral;
