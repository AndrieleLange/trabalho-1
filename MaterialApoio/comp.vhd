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
        --elsif pra dizer que se prog = '0' padrão<= (others 0) algo assim
        -- mas não sei se é certo 
      end if;
    end if;
  end process;

  process(dado, padrao)
  begin
    --if habilita = '1' then
    --  (passa o igual) match <= igual
    -- ainda tem que fazer o comp:
    -- ele recebe dado e padrao
    -- e vê se é igual (????)
    

  end process;
    

end a1;