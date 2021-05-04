library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Instruction_Decoder_TB is
--  Port ( );
end Instruction_Decoder_TB;

--import Intruction Decoder
architecture Behavioral of Instruction_Decoder_TB is
    component Instruction_Decoder
        Port ( 
        INSTUC : in STD_LOGIC_VECTOR (11 downto 0);     --Get instruction from programme rom
        J_CHK : in STD_LOGIC;                           --Jump check

        REG_EN : out STD_LOGIC_VECTOR (2 downto 0);     --Register enable in register bank

        REG_SEL_A : out STD_LOGIC_VECTOR (2 downto 0);  --Register selection for multiplexer A
        REG_SEL_B : out STD_LOGIC_VECTOR (2 downto 0);  --Register selection for multiplexer B

        LOAD_SEL : out STD_LOGIC;                       --Load selction for multiplexer 0
        IM_VAL : out STD_LOGIC_VECTOR (3 downto 0);     --Immediate value for multiplexer 0

        CTRL : out STD_LOGIC;                           --Add Subract selection for Add_Sub_Unit

        J_FLAG : out STD_LOGIC;                         --Jump Flag for multiplexer 1
        J_ADDR : out STD_LOGIC_VECTOR (2 downto 0)      --Jump address for multiplexer 1
        
    );
    
end component;
    
   signal INSTUC: std_logic_vector(11 downto 0);
   signal J_CHK: std_logic;
   signal REG_EN,REG_SEL_A,REG_SEL_B,J_ADDR :std_logic_vector(2 downto 0);
   signal LOAD_SEL,CTRL,J_FLAG:std_logic;
   signal IM_VAL:std_logic_vector(3 downto 0);
   
begin
--port map for Instuction_Deocder
UUT:Instruction_Decoder
        port map ( 
        INSTUC =>INSTUC,
        J_CHK =>J_CHK,
        REG_EN =>REG_EN,
        REG_SEL_A =>REG_SEL_A,
        REG_SEL_B =>REG_SEL_B,
        LOAD_SEL =>LOAD_SEL,
        IM_VAL =>IM_VAL,
        CTRL =>CTRL,
        J_FLAG =>J_FLAG,
        J_ADDR =>J_ADDr  
    );

process
   begin
    INSTUC <= "101100000110"; --MOVE
    wait for 100ns ;
    
    INSTUC <= "011110000000";  --NEG
    wait for 100ns;
    
    J_CHK  <= '1';
    INSTUC <= "111110000010"; --JUMP
   
    wait for 100ns;
    
    INSTUC <= "000100010000"; --ADD
    wait;     
end process;   

end Behavioral;
