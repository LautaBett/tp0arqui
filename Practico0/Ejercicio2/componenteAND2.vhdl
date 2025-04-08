
library IEEE;
  use IEEE.std_logic_1164.all;

entity and2 is
  port (
    a, b : in  std_logic;
    o    : out std_logic
  );
end entity;

architecture rtl of and2 is
begin
  o <= a and b;
end architecture;

