library IEEE;
  use IEEE.std_logic_1164.all;

entity mux_inst is
  port (
    a   : in  std_logic;
    b   : in  std_logic;
    sel : in  std_logic;
    o   : out std_logic
  );
end entity;

architecture rtl of mux_inst is

  component and2
    port (a, b : in std_logic; o : out std_logic);
  end component;

  component or2
    port (a, b : in std_logic; o : out std_logic);
  end component;

  signal nsel, a_and_nsel, b_and_sel : std_logic;

begin

  nsel <= not sel;

  u1: and2 port map (a => a, b => nsel, o => a_and_nsel);
  u2: and2 port map (a => b, b => sel, o => b_and_sel);
  u3: or2 port map (a => a_and_nsel, b => b_and_sel, o => o);

end architecture;
