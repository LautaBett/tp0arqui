library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity full_adder is
  port (
    a    : in  std_logic;
    b    : in  std_logic;
    cin  : in  std_logic;
    sum  : out std_logic;
    cout : out std_logic
  );
end entity;

architecture beh of full_adder is
  signal ab_and      : std_logic;
  signal ab_xor      : std_logic;
  signal xor_cin_and : std_logic;
begin
  ab_and      <= a and b;
  ab_xor      <= a xor b;
  xor_cin_and <= ab_xor and cin;

  sum  <= ab_xor xor cin;
  cout <= ab_and or xor_cin_and;
end architecture;

