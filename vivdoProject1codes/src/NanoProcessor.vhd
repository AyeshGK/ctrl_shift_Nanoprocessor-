library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NanoProcessor is
    Port (
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Zero : out STD_LOGIC;
           Overflow : out STD_LOGIC;
           Reg_7_LED : out STD_LOGIC_VECTOR (3 downto 0); 
           S_7seg : out STD_LOGIC_VECTOR (6 downto 0) 
    );
    
end NanoProcessor;

architecture Behavioral of NanoProcessor is

component Instruction_Decoder

    Port ( 
        INSTUC : in STD_LOGIC_VECTOR (11 downto 0);     
        J_CHK : in STD_LOGIC;                           
        REG_EN : out STD_LOGIC_VECTOR (2 downto 0);     
        REG_SEL_A : out STD_LOGIC_VECTOR (2 downto 0);  
        REG_SEL_B : out STD_LOGIC_VECTOR (2 downto 0);  
        LOAD_SEL : out STD_LOGIC;                       
        IM_VAL : out STD_LOGIC_VECTOR (3 downto 0);     
        CTRL : out STD_LOGIC;                           
        J_FLAG : out STD_LOGIC;                         
        J_ADDR : out STD_LOGIC_VECTOR (2 downto 0)      
    );

end component;

component Add_Sub_Unit
    port ( 
           A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           ctrl : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Overflow : out STD_LOGIC;
           Zero : out STD_LOGIC
    );
    
end component;
    
component Progrm_Rom
    Port ( 
           SEL : in STD_LOGIC_VECTOR (2 downto 0);
           INSTUC : out STD_LOGIC_VECTOR (11 downto 0)
    );
end component;


component Bit_3_Adder
     Port (
            A : in STD_LOGIC_VECTOR(2 downto 0); 
            B : in STD_LOGIC_VECTOR(2 downto 0); 
            C_in : in STD_LOGIC;                  
            S : out STD_LOGIC_VECTOR(2 downto 0); 
            C_out : out STD_LOGIC                
     );   

end component;

component P_Counter
       Port ( D : in STD_LOGIC_VECTOR (2 downto 0);
              Res : in STD_LOGIC;
              Clk : in STD_LOGIC;
              Q : out STD_LOGIC_VECTOR (2 downto 0));

end component;

component Register_Bank
    Port (    Clk : in STD_LOGIC;
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
              R7 : out STD_LOGIC_VECTOR (3 downto 0)
    );

end component;

component Mux_2way_4bit
    Port (  A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            O : out STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC);
end component;

component Mux_2way_3bit
    Port (  
            Adder_3 : in STD_LOGIC_VECTOR (2 downto 0);
            JUMP_TO : in STD_LOGIC_VECTOR (2 downto 0);
            S : in STD_LOGIC;
            O : out std_logic_vector(2 downto 0)
    );
end component;

component Mux_8way_4bit
    Port (  A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            C : in STD_LOGIC_VECTOR (3 downto 0);
            D : in STD_LOGIC_VECTOR (3 downto 0);
            E : in STD_LOGIC_VECTOR (3 downto 0);
            F : in STD_LOGIC_VECTOR (3 downto 0);
            G : in STD_LOGIC_VECTOR (3 downto 0);
            H : in STD_LOGIC_VECTOR (3 downto 0);
            O : out STD_LOGIC_VECTOR (3 downto 0);
            S : in STD_LOGIC_VECTOR (2 downto 0));
end component;



--import values for seven segement display
component LUT_16_7
    Port ( 
        address : in STD_LOGIC_VECTOR (3 downto 0);
        values : out STD_LOGIC_VECTOR (6 downto 0)
    );

end component;

component Slow_Clk
    Port ( 
           Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC
    );
end component;

signal Slw_Clk : std_logic; 
signal R0_out,R1_out,R2_out,R3_out,R4_out,R5_out,R6_out,R7_out : std_logic_vector (3 downto 0); --from register bank to mux
signal CTRL:std_logic; --from instruction decoder to Add sub unit
signal Reg_En : std_logic_vector (2 downto 0); --form instruction decoder to register bank
signal Instruction :std_logic_vector(11 downto 0);--from program rom to instruction decoder
signal Mem_Sel :std_logic_vector (2 downto 0); --from p_counter to ROM and adder

signal C_out : std_logic; --for carry out of 3-bit adder
signal next_Address : std_logic_vector (2 downto 0); --Output of 3 - bit adder
signal load_select : std_logic; --from instruction decoder to 2way 4bit mux
signal data : std_logic_vector (3 downto 0); --from 2 way 4 bit mux to register bank
signal Cal_value : std_logic_vector (3 downto 0); --from addSub unit to mux
signal im_value : std_logic_vector (3 downto 0); --from instruction decoder to mux
signal selected_val_A : std_logic_vector (3 downto 0); --from muxA to add sub unit
signal selected_val_B : std_logic_vector (3 downto 0); --from muxB to add sub unit
signal reg_sel_A : std_logic_vector (2 downto 0); --from instruction decoder to muxA
signal reg_sel_B : std_logic_vector (2 downto 0); --from instruction decoder to muxB
signal Address_To_Jump:std_logic_vector(2 downto 0); --from instruction decoder to 2 way 3 bit mux
signal Jump:std_logic;--form instruction decoder to 2 way 3 bit mux
signal jump_check : std_logic; --
signal pc_in:std_logic_vector(2 downto 0);--from 2 way 3 bit mux to programme counter 


begin
    Slow_Clk_0: Slow_Clk
    port map(
            Clk_in=>Clk,
            Clk_out => Slw_Clk
    );
    
    InstructionDecoder:Instruction_Decoder
        port map ( 
            INSTUC => Instruction, 
            J_CHK => jump_check,  --: in STD_LOGIC;                           
            REG_EN => Reg_En,   
            REG_SEL_A => reg_sel_A,--: out STD_LOGIC_VECTOR (2 downto 0);  
            REG_SEL_B => reg_sel_B,--: out STD_LOGIC_VECTOR (2 downto 0);  
            LOAD_SEL => load_select, --: out STD_LOGIC;                       
            IM_VAL => im_value, --: out STD_LOGIC_VECTOR (3 downto 0);     
            CTRL => CTRL, --: out STD_LOGIC;                           
            J_FLAG=>Jump, --: out STD_LOGIC;                         
            J_ADDR=>Address_To_Jump --: out STD_LOGIC_VECTOR (2 downto 0)      
        );

    Multiplexer_2way_4bit: Mux_2way_4bit
        port map (
            A => Cal_value,
            B => im_value,
            O => data,
            S => load_select
        );
    
    
    Program_Rom:Progrm_Rom
        Port map( 
            SEL =>Mem_Sel, --: in STD_LOGIC_VECTOR (2 downto 0);
            INSTUC =>Instruction 
        );

    --bit 3 adder can be change but for get the adder implemnentation use 
    Bit3Adder : Bit_3_Adder
        port map (
              A =>Mem_Sel, 
              B =>"001",
              C_in => '0', --no carry inputs for the Bit3Adder 
              S => next_Address,
              C_out => C_out
        );
       
    Multiplexer_2way_3bit:Mux_2way_3bit
        port map(  
            Adder_3 =>next_Address,
            JUMP_TO =>Address_To_Jump,
            S =>Jump,
            O =>pc_in
        );

    Progaram_Counter : P_Counter
        port map (
              D => pc_in,
              Res => Reset,
              Clk => Slw_Clk,
              Q => Mem_Sel
        );

    RegisterBank: Register_Bank
        port map(
            Clk => Slw_Clk,
            R_Enable => Reg_En, 
            Res => Reset,
            D => data,
            R0 => R0_out,
            R1 => R1_out,
            R2 => R2_out,
            R3 => R3_out,
            R4 => R4_out, 
            R5 => R5_out,
            R6 => R6_out,
            R7 => R7_out
        );

    AddSubUnit: Add_Sub_Unit
        port map( 
           A => selected_val_B,
           B => selected_val_A,
           ctrl => CTRL,
           S => Cal_value,
           Overflow =>Overflow,
           Zero =>Zero
        );
        
    Multiplexer_8way_4bit_A : Mux_8way_4bit
        port map(
            A => R0_out,
            B => R1_out,
            C => R2_out,
            D => R3_out,
            E => R4_out,
            F => R5_out,
            G => R6_out,
            H => R7_out,
            O => selected_val_A,
            S => reg_sel_A
        );
    
    Multiplexer_8way_4bit_B : Mux_8way_4bit
        port map(
            A => R0_out,
            B => R1_out,
            C => R2_out,
            D => R3_out,
            E => R4_out,
            F => R5_out,
            G => R6_out,
            H => R7_out,
            O => selected_val_B,
            S => reg_sel_B
        );

    
    
    --sevent segment display
    LUT_7seg : LUT_16_7
        port map (
            address => R7_out,
            values =>  S_7seg
        );
    
    Reg_7_LED <= R7_out;
    jump_check <= not(selected_val_A(0) or selected_val_A(1) or selected_val_A(2) or selected_val_A(3));   


end Behavioral;
