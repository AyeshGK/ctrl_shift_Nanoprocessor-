library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Add_Sub_TB is
--  Port ( );
end Add_Sub_TB;

architecture Behavioral of Add_Sub_TB is
component Add_Sub_Unit
    Port ( 
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           ctrl : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC
    );
end component;

signal A,B :std_logic_vector(3 downto 0);
signal ctrl:std_logic;
signal S: std_logic_vector(3 downto 0);
signal Overflow,Zero :std_logic;
           
begin

--port map for the Add_Sub_Unit
UUT:Add_Sub_Unit
    Port map ( 
           A =>A,
           B =>B,
           ctrl=>ctrl,
           S =>S,
           Overflow =>Overflow,
           Zero =>Zero
    );

process
    begin
        A   <= "0000";
        B   <= "0000";
        ctrl <= '0';
        wait for 100ns;
        
        A <= "0001";
        B <= "0101";
        ctrl <= '1';
        wait for 100ns;
        
        A <= "0101";--  5
        B <= "1010";-- -6         1
        ctrl <= '1';
        wait for 100ns;
        
        A <= "1010"; -- -6
        B <= "0101"; -- 5  
        ctrl <= '1';
        wait for 100ns;
        
        --190649F --> 10_1110_1000_1011_1001    
        A <= "1110";
        B <= "1000";
        ctrl <= '0';
        wait for 100ns;
        
        A<= "1011";
        B<= "1001";
        ctrl<='1';
        
        wait; 
                      
end process;
    
end Behavioral;
