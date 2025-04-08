library IEEE;
  use IEEE.std_logic_1164.all;

entity mux is
  port (
    a   : in  std_logic;
    b   : in  std_logic;
    sel : in  std_logic;
    o   : out std_logic
  );
end entity;

architecture beh of mux is
begin
  o <= a when sel = '0' else b;
end architecture;
