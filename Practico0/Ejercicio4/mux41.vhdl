library IEEE;
  use IEEE.std_logic_1164.all;

entity mux4_1 is
  port (
    i0, i1, i2, i3 : in  std_logic;
    sel            : in  std_logic_vector(1 downto 0);
    o              : out std_logic
  );
end entity;

architecture rtl of mux4_1 is
begin
  o <= i0 when sel = "00" else
       i1 when sel = "01" else
       i2 when sel = "10" else
       i3;
end architecture;
