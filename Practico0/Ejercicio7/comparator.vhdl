-- Archivo: comparador.vhd
library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity comparador_2bit is
  port (
    a : in  std_logic_vector(1 downto 0);
    b : in  std_logic_vector(1 downto 0);
    g : out std_logic;
    e : out std_logic
  );
end entity;

architecture beh of comparador_2bit is
begin
  process (a, b)
    variable a_int, b_int : integer;
  begin
    a_int := to_integer(unsigned(a));
    b_int := to_integer(unsigned(b));

    if a_int > b_int then
      g <= '1';
    else
      g <= '0';
    end if;

    if a_int = b_int then
      e <= '1';
    else
      e <= '0';
    end if;
  end process;
end architecture;
