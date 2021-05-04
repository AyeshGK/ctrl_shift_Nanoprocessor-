library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Rom_TB is
--  Port ( );
end Program_Rom_TB;

architecture Behavioral of Program_Rom_TB is
component PROGRM_ROM
    Port ( 
           SEL : in STD_LOGIC_VECTOR (2 downto 0);
           INSTUC : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;

signal SEL:std_logic_vector(2 downto 0);
signal INSTUC:std_logic_vector(11 downto 0);

begin
UUT:PROGRM_ROM
    port map( 
           SEL =>SEL,
           INSTUC =>INSTUC
    );    
    

--190649F 101_110_100_010_111_001
process
    begin
        SEL<="000";
        wait for 100ns;
        
        SEL<="101";
        wait for 100ns;
        
        SEL<="110";
        wait for 100ns;
        
        SEL<="100";
        wait for 100ns;
        
        SEL<="010";
        wait for 100ns;
        
        SEL<="111";
        wait for 100ns;
        
        SEL<="001";
        wait for 100ns;
           
        wait;     
end process;

end Behavioral;
