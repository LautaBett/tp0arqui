library IEEE;
  use IEEE.std_logic_1164.all;
  use IEEE.numeric_std.all;

entity ALU is
  port (
    a       : in  std_logic_vector(31 downto 0);
    b       : in  std_logic_vector(31 downto 0);
    control : in  std_logic_vector(2 downto 0);
    result  : out std_logic_vector(31 downto 0);
    zero    : out std_logic
  );
end entity;

architecture beh of ALU is
begin
  process (a, b, control)
    variable res : std_logic_vector(31 downto 0);
  begin
    case control is
      when "000" => res := a and b; -- cuando control es 000, res toma el valor de a and b, => asigna un valor de VARIABLES
      when "001" => res := a or b;
      when "010" => res := std_logic_vector(unsigned(a) + unsigned(b));
      when "100" => res := std_logic_vector(shift_left(unsigned(b), 16)); --mueve 16 bits a la izquierda el valor de b ej:
      --00000000000000000000000000001111 =>           --11110000000000000000000000000000
      when "011" => res := std_logic_vector(shift_right(unsigned(b), 16)); --mueve 16 bits a la derecha el valor de b ej:         
      when "101" => res := std_logic_vector(unsigned(a) - unsigned(b));
      when "111" =>
        if unsigned(a) < unsigned(b) then
          res := (others => '0');
          res(0) := '1'; -- el bit menos significativo es 1, ya que si a es menor q b el resultado es 1
        else
          res := (others => '0'); --lo que haces es poner el resultado en 0
        end if;
      when others => res := (others => '0'); -- others es como un default case 
    end case;

    result <= res;
    if res = (others => '0') then
      zero <= '1'; -- <= tambien asigna pero en este caso SEÑALES
    else
      zero <= '0';
    end if;
  end process;
end architecture;
