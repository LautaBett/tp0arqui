
library IEEE;
  use IEEE.std_logic_1164.all;

entity tb_mux4_1 is
end entity;

architecture beh of tb_mux4_1 is

  -- Componente bajo prueba (DUT)
  component mux4_1 is
    port (
      a, b, c, d : in  std_logic;
      sel        : in  std_logic_vector(1 downto 0);
      y          : out std_logic
    );
  end component;

  -- Señales para interconectar
  signal a, b, c, d : std_logic := '0';
  signal sel        : std_logic_vector(1 downto 0);
  signal y          : std_logic;

begin

  -- Instanciación del MUX
  uut: mux4_1
    port map (
      a   => a,
      b   => b,
      c   => c,
      d   => d,
      sel => sel,
      y   => y
    );

  -- Proceso de estímulo
  stim_proc: process
  begin
    a <= '1';
    b <= '0';
    c <= '1';
    d <= '0';

    sel <= "00";
    wait for 10 ns;
    sel <= "01";
    wait for 10 ns;
    sel <= "10";
    wait for 10 ns;
    sel <= "11";
    wait for 10 ns;

    wait;
  end process;

end architecture;
