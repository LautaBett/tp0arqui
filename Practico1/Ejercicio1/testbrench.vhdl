library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity tb_ALU is
end entity;

architecture sim of tb_ALU is

  signal a       : std_logic_vector(31 downto 0);
  signal b       : std_logic_vector(31 downto 0);
  signal control : std_logic_vector(2 downto 0);
  signal result  : std_logic_vector(31 downto 0);
  signal zero    : std_logic;

  -- Instancia de la ALU
  component ALU
    port (
      a       : in  std_logic_vector(31 downto 0);
      b       : in  std_logic_vector(31 downto 0);
      control : in  std_logic_vector(2 downto 0);
      result  : out std_logic_vector(31 downto 0);
      zero    : out std_logic
    );
  end component;

begin

  dut: ALU
    port map (
      a       => a,
      b       => b,
      control => control,
      result  => result,
      zero    => zero
    );

  -- Estímulos
  stimulus: process
  begin

    -- AND
    a <= x"FFFFFFFF";
    b <= x"0000FFFF";
    control <= "000";
    wait for 10 ns;

    -- OR
    a <= x"00000000";
    b <= x"12345678";
    control <= "001";
    wait for 10 ns;

    -- SUMA
    a <= x"00000005";
    b <= x"00000003";
    control <= "010";
    wait for 10 ns;

    -- SHIFT LEFT B 16
    b <= x"00001234";
    control <= "100";
    wait for 10 ns;

    -- RESTA
    a <= x"00000010";
    b <= x"00000001";
    control <= "101";
    wait for 10 ns;

    -- SLT (a < b)
    a <= x"00000001";
    b <= x"00000005";
    control <= "111";
    wait for 10 ns;

    -- SLT (a >= b)
    a <= x"00000009";
    b <= x"00000003";
    control <= "111";
    wait for 10 ns;

    wait;
  end process;

end architecture;
