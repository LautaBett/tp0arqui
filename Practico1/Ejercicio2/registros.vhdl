library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity registers is
  port (
    clk      : in  std_logic;
    rst      : in  std_logic;
    wr       : in  std_logic;
    reg1_rd  : in  std_logic_vector(4 downto 0);
    reg2_rd  : in  std_logic_vector(4 downto 0);
    reg_wr   : in  std_logic_vector(4 downto 0);
    data_wr  : in  std_logic_vector(31 downto 0);
    data1_rd : out std_logic_vector(31 downto 0);
    data2_rd : out std_logic_vector(31 downto 0)
  );
end entity;

architecture Behavioral of registers is
  type reg_array is array (0 to 31) of std_logic_vector(31 downto 0);
  signal regs : reg_array;
begin

  -- Escritura sincrónica y reset
  process (clk, rst)
  begin
    if rst = '1' then
      regs <= (others => (others => '0'));
    elsif falling_edge(clk) then
      if wr = '1' and reg_wr /= "00000" then
        regs(to_integer(unsigned(reg_wr))) <= data_wr;
      end if;
    end if;
  end process;

  -- Lectura combinacional
  data1_rd <= regs(to_integer(unsigned(reg1_rd))) when reg1_rd /= "00000" else (others => '0'); --unsigned(reg1_rd): convierte el vector de 5 bits a un número sin signo. to_integer(...): convierte ese número sin signo a entero. Si reg1_rd = "00000" (registro 0), se fuerza la salida a ser todo ceros: (others => '0'). resumen: Saca por la salida data1_rd el valor del registro número reg1_rd, o 0 si es el registro 0.
  data2_rd <= regs(to_integer(unsigned(reg2_rd))) when reg2_rd /= "00000" else (others => '0');

end architecture;
