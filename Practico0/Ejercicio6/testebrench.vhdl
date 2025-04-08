-- Archivo: tb_fa.vhd
library IEEE;
  use IEEE.std_logic_1164.all;

entity tb_fa is
end entity;

architecture test of tb_fa is
  -- Instanciamos el componente FA
  component fa
    port (
      a    : in  std_logic;
      b    : in  std_logic;
      cin  : in  std_logic;
      sum  : out std_logic;
      cout : out std_logic
    );
  end component;

  -- Señales para conectar al FA
  signal a, b, cin, sum, cout : std_logic;

begin
  -- Instancia del FA
  uut: fa
    port map (
      a    => a,
      b    => b,
      cin  => cin,
      sum  => sum,
      cout => cout
    );

  -- Estímulos
  stim_proc: process
  begin
    a <= '0';
    b <= '0';
    cin <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '0';
    cin <= '1';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    cin <= '0';
    wait for 10 ns;
    a <= '0';
    b <= '1';
    cin <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    cin <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '0';
    cin <= '1';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    cin <= '0';
    wait for 10 ns;
    a <= '1';
    b <= '1';
    cin <= '1';
    wait for 10 ns;
    wait;
  end process;
end architecture;
