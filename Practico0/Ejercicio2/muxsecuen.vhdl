library IEEE;
  use IEEE.std_logic_1164.all;

entity muxsecu is
  port (
    a   : in  std_logic;
    b   : in  std_logic;
    sel : in  std_logic;
    o   : out std_logic
  );
end entity;

architecture rtl of muxsecu is
begin
  process (a, b, sel)
  begin
    if sel = '0' then
      o <= a;
    else
      o <= b;
    end if;
  end process;
end architecture;
