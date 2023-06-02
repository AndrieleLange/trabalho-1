--------------------------------------
-- TRABALHO TP3 - MORAES  16/MAIO/23
--------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

--------------------------------------
-- Entidade
--------------------------------------
entity tp3 is 
  port (clock   : in std_logic;
        reset   : in std_logic;
        . . .
        );
end entity; 

--------------------------------------
-- Arquitetura
--------------------------------------
architecture tp3 of tp3 is
  type state is ( . . .);
  signal EA, PE: state;
  . . . 
begin  

  -- REGISTRADOR DE DESLOCAMENTO QUE RECEBE O FLUXO DE ENTRADA

  -- 4 PORT MAPS PARA OS ompara_dado  

  found   <=  . . . 

  program(0) <= . . .
  program(1) <= . . .
  program(2) <= . . .
  program(3) <= . . .
  
  --  registradores para ativar as comparações

  --  registrador para o alarme interno

  -- MAQUINA DE ESTADOS (FSM)

  -- SAIDAS
  alarme <= . . . 
  dout   <= . . . 
  numero <=  . . . 

end architecture;