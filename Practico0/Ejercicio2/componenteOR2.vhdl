library IEEE;
  use IEEE.std_logic_1164.all;

entity or2 is
  port (
    a, b : in  std_logic;
    y    : out std_logic
  );
end entity;

architecture rtl of or2 is
begin
  y <= a or b;
end architecture;
