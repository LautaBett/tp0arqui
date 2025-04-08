
library IEEE;
  use IEEE.std_logic_1164.all;

entity tb_comparador is
end entity;

architecture test of tb_comparador is
  component comparador_2bit
    port (
      a : in  std_logic_vector(1 downto 0);
      b : in  std_logic_vector(1 downto 0);
      g : out std_logic;
      e : out std_logic
    );
  end component;

  signal a, b : std_logic_vector(1 downto 0);
  signal g, e : std_logic;

begin
  -- Instancia del comparador
  uut: comparador_2bit
    port map (
      a => a,
      b => b,
      g => g,
      e => e
    );

  -- Estímulos
  stim_proc: process
  begin
    a <= "00";
    b <= "00";
    wait for 10 ns; -- e = 1, g = 0
    a <= "01";
    b <= "00";
    wait for 10 ns; -- g = 1
    a <= "01";
    b <= "01";
    wait for 10 ns; -- e = 1
    a <= "10";
    b <= "11";
    wait for 10 ns; -- g = 0
    a <= "11";
    b <= "10";
    wait for 10 ns; -- g = 1
    a <= "00";
    b <= "11";
    wait for 10 ns; -- g = 0, e = 0
    wait;
  end process;
end architecture;
