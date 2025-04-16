library IEEE;
  use IEEE.STD_LOGIC_1164.all;
  use IEEE.numeric_std.all;

entity Simulacion_registers is
end entity;

architecture behavior of Simulacion_registers is
  component registers
    port (
      clk, rst, wr             : in  std_logic;
      reg1_rd, reg2_rd, reg_wr : in  std_logic_vector(4 downto 0);
      data_wr                  : in  std_logic_vector(31 downto 0);
      data1_rd                 : out std_logic_vector(31 downto 0);
      data2_rd                 : out std_logic_vector(31 downto 0)
    );
  end component;

  -- Señales para los puertos del banco de registros
  signal clk, rst, wr             : std_logic                     := '0';
  signal reg1_rd, reg2_rd, reg_wr : std_logic_vector(4 downto 0)  := (others => '0');
  signal data_wr                  : std_logic_vector(31 downto 0) := (others => '0');
  signal data1_rd, data2_rd       : std_logic_vector(31 downto 0);

begin
  UUT: registers
    port map (
      clk      => clk,
      rst      => rst,
      wr       => wr,
      reg1_rd  => reg1_rd,
      reg2_rd  => reg2_rd,
      reg_wr   => reg_wr,
      data_wr  => data_wr,
      data1_rd => data1_rd,
      data2_rd => data2_rd
    );

  clk <= not clk after 10 ns; -- Reloj con periodo de 20 ns

  process
  begin
    -- Inicialización
    rst <= '1'; -- Reset activo
    wait for 20 ns;
    rst <= '0'; -- Desactivar reset
    wait for 20 ns;

    -- Escritura en el registro 1
    reg_wr <= "00001"; -- Escribir en el registro 1
    data_wr <= x"00000010"; -- Valor a escribir (16 en decimal)
    wr <= '1'; -- Habilitar escritura
    wait for 20 ns;
    wr <= '0'; -- Deshabilitar escritura
    wait for 20 ns;

    -- Leer el registro 1
    reg1_rd <= "00001"; -- Leer el registro 1
    wait for 20 ns; -- Esperar para la lectura

    -- Escritura en el registro 2
    reg_wr <= "00010"; -- Escribir en el registro 2
    data_wr <= x"00000020"; -- Valor a escribir (32 en decimal)
    wr <= '1'; -- Habilitar escritura
    wait for 20 ns;
    wr <= '0'; -- Deshabilitar escritura
    wait for 20 ns;

    -- Leer el registro 2
    reg2_rd <= "00010"; -- Leer el registro 2
    wait for 20 ns; -- Esperar para la lectura

    -- Escritura en el registro 3
    reg_wr <= "00011"; -- Escribir en el registro 3
    data_wr <= x"00000030"; -- Valor a escribir (48 en decimal)
    wr <= '1'; -- Habilitar escritura
    wait for 20 ns;
    wr <= '0'; -- Deshabilitar escritura
    wait for 20 ns;

    -- Leer el registro 3
    reg1_rd <= "00011"; -- Leer el registro 3
    wait for 20 ns; -- Esperar para la lectura

    -- Fin de la simulación
    wait;
  end process;
end architecture;
