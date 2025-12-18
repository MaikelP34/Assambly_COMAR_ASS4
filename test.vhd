library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pipe_mult_long is
    port(
        op1 : in  std_logic_vector(31 downto 0);
        op2 : in  std_logic_vector(31 downto 0);
        datain:in  std_logic_vector(10 downto 0);
        dataout:out  std_logic_vector(10 downto 0);
        clk : in std_logic;
        po  : out std_logic_vector(31 downto 0)
    );
end Pipe_mult_long;

architecture Behavioral of Pipe_mult_long is

    --------------------------------------------------------------------
    -- COMPONENT
    --------------------------------------------------------------------
    component MultStage is
        generic(
            WIDTH : integer := 32
        );
        port(
            Q_i  : in  std_logic_vector(WIDTH-1 downto 0);
            A_i  : in  std_logic_vector(WIDTH-1 downto 0);
            Q1_i : in  std_logic;

            B_i  : in  std_logic_vector(WIDTH-1 downto 0);
            Bn_i : in  std_logic_vector(WIDTH-1 downto 0);

            Q_o  : out std_logic_vector(WIDTH-1 downto 0);
            A_o  : out std_logic_vector(WIDTH-1 downto 0);
            Q1_o : out std_logic
        );
    end component;


    --------------------------------------------------------------------
    -- CONSTANTEN
    --------------------------------------------------------------------
    constant N : integer := 16;   -- 16 pipeline blocks
    constant P : integer := 2;   -- 2 steps per block
    constant TOTAL : integer := N * P;  -- 32 Booth-stages


    --------------------------------------------------------------------
    -- SIGNALEN
    --------------------------------------------------------------------
    type vec_array is array (0 to TOTAL) of std_logic_vector(31 downto 0);
    type data_array is array (0 to TOTAL) of std_logic_vector(10 downto 0);


    -- combinatorische outputs van alle stages
    signal Q_sig  : vec_array;
    signal A_sig  : vec_array;
    signal Q1     : std_logic_vector(0 to TOTAL);

    -- clocked pipeline registers (tussen pipeline-blocks)
    signal Q_pipe  : vec_array;
    signal A_pipe  : vec_array;
    signal D_pipe  :data_array;
    signal Q1_pipe : std_logic_vector(0 to TOTAL);

    signal B_sig  : std_logic_vector(31 downto 0);
    signal Bn_sig : std_logic_vector(31 downto 0);

begin

    --------------------------------------------------------------------
    -- INITIALISATIE
    --------------------------------------------------------------------
    Q_pipe(0) <= op1;
    A_pipe(0) <= (others => '0');
    Q1_pipe(0)    <= '0';

    B_sig  <= op2;
    Bn_sig <= std_logic_vector(unsigned(not op2) + 1);  -- two's complement

    --------------------------------------------------------------------
    -- COMBINATORISCHE MULTSTAGES (32 stages)
    --------------------------------------------------------------------
    GEN_I : for i in 0 to N-1 generate
        MultStage_inst : MultStage
                generic map(WIDTH => 32)
                port map(
                    Q_i  => Q_pipe(8*i),
                    A_i  => A_pipe(8*i),
                    Q1_i => Q1_pipe(8*i),
                    B_i  => B_sig,
                    Bn_i => Bn_sig,
                    Q_o  => Q_sig(i*8+1),
                    A_o  => A_sig(i*8+1),
                    Q1_o => Q1(i*8+1)
                );
        GEN_P : for k in 1 to P-1 generate
            constant IDX  : integer := (i*P) + k;
            constant NEX  : integer := IDX + 1;
        begin
            MultStage_inst : MultStage
                generic map(WIDTH => 32)
                port map(
                    Q_i  => Q_sig(IDX),
                    A_i  => A_sig(IDX),
                    Q1_i => Q1(IDX),
                    B_i  => B_sig,
                    Bn_i => Bn_sig,
                    Q_o  => Q_sig(NEX),
                    A_o  => A_sig(NEX),
                    Q1_o => Q1(NEX)
                );
        end generate GEN_P;
    end generate GEN_I;

    --------------------------------------------------------------------
    -- PIPELINE REGISTERS TUSSEN BLOCKS (generated)
    --------------------------------------------------------------------
    gen_pipe_regs : for j in 1 to N-1 generate
    begin
        pipe_reg_proc : process(clk)
        begin
            if rising_edge(clk) then
                Q_pipe(j*P)  <= Q_sig(j*P);
                A_pipe(j*P)  <= A_sig(j*P);
                Q1_pipe(j*P) <= Q1(j*P);
                if j = 1 then
                    D_pipe(j*P) <= datain;
                else
                    D_pipe(j*P) <= D_pipe((j-1)*P);
                end if;
            end if;
        end process;
    end generate gen_pipe_regs;

    -- Pipeline-register voor laatste block (N)
    process(clk)
    begin
        if rising_edge(clk) then
            po <= Q_sig(N*P);
            A_pipe(N*P)  <= A_sig(N*P);
            Q1_pipe(N*P) <= Q1(N*P);
            D_pipe(N*P)  <= D_pipe((N-1)*P);
        end if;
    end process;


    dataout <= D_pipe(TOTAL - P);
end Behavioral;
