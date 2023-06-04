-------------------------------------------
-- MODLO COMPARA DADO  -  MORAES 16/MAIO/23
-------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;

entity compara_dado is 
  port (clock    : in std_logic;
        reset    : in std_logic;
        dado     : in std_logic_vector(7 downto 0);
        pattern  : in std_logic_vector(7 downto 0);
        prog     : in std_logic;
        habilita : in std_logic;
        match    : out std_logic;
      );
end compara_dado; 

architecture a1 of compara_dado is
   signal padrao: std_logic_vector(7 downto 0);
   signal igual: std_logic;
   
begin


  process(clock, reset)
  begin
    if reset = '1' then
      igual <= 0;--pq igual recebe 0?
    elsif rising_edge(clock) then
      if prog = '1' then 
        padrao <= pattern; 
      end if;
      --elsif pra dizer que se prog = '0' padrão<= (others 0) algo assim
        -- mas não sei se é certo
        --acho que seria assim:
      if prog ='0' then
        padrao <= (others => '0');
      end if;
    end if;
  end process;

  -- esse seira o and
  process(dado, padrao)
  begin
    if habilita = '1' then
      igual <= '1' when dado = padrao else '0';-- não sei se é isso
      --mas eu vi no youtube e a principio é isso mesmo
    end if;
  end process;

  match <= habilita AND igual;

end a1;