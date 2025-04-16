library IEEE;
  use IEEE.std_logic_1164.all;

entity mux4_1_4bit is
  port (
    a   : in  std_logic_vector(3 downto 0);
    b   : in  std_logic_vector(3 downto 0);
    c   : in  std_logic_vector(3 downto 0);
    d   : in  std_logic_vector(3 downto 0);
    sel : in  std_logic_vector(1 downto 0);
    o   : out std_logic_vector(3 downto 0)
  );
end entity;

architecture beh of mux4_1_4bit is
begin
  o <= a when sel = "00" else
       b when sel = "01" else
       c when sel = "10" else
       d;
end architecture;
