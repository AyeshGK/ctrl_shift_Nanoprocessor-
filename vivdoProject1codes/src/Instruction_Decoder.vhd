library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Instruction_Decoder is

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

end Instruction_Decoder;

architecture Behavioral of Instruction_Decoder is

component Decoder_2_4
    port(
        A:in std_logic_vector(1 downto 0);
        En:in std_logic ;
        B:out std_logic_vector(3 downto 0)
    );
end component;
  

signal ADD,NEG,MOV,JZR :std_logic;

begin
    --decode opcode into four instructions
    OPCODE_Decoder:Decoder_2_4
        port map(
            A=>INSTUC(11 downto 10),
            EN=>'1',
            B(0)=>ADD,
            B(1)=>NEG,
            B(2)=>MOV,
            B(3)=>JZR
        );

    --select add or sub 
    CTRL <= NEG;

    --Select the load comes form instruction decoder or add sub unit
    LOAD_SEL <= MOV;

    --1 0 R R R 0 0 0 [d d d d] 
    IM_VAL <= INSTUC(3 downto 0);

    --Reg enable  1 0 [R R R] 0 0 0 d d d d
    REG_EN  <=INSTUC(9 downto 7);

    --commad for the  muxA and muxB to register selection
    REG_SEL_A <=INSTUC(9 downto 7);
    REG_SEL_A <=INSTUC(6 downto 7);

    --Register check for jump-----------------------------
    J_FLAG <= JZR and J_CHK; --check and set flag true

    --set jump address --
    J_ADDR<=INSTUC(2 downto 0);
    

end Behavioral;
