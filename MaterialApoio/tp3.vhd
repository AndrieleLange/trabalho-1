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
        din     : in std_logic;
        padrao  : in std_logic_vector(7 downto 0);
        prog    : in std_logic_vector(2 downto 0);
        dout    : out std_logic;
        alarme  : out std_logic;
        numero  : out std_logic_vector(1 downto 0); 
        );
end entity; 

--------------------------------------
-- Arquitetura
--------------------------------------
architecture tp3 of tp3 is
  type state is ( . . .); -- criação de um tipo, dentro do parenteses vai oq ele pode assumir
  -- https://www.youtube.com/watch?v=EDodM1aPJdU   link de um vídeo que eu vi isso
  signal EA, PE: state;-- oq é state?
  signal data : std_logic_vector(7 downto 0);
  signal found : std_logic;
  signal match : std_logic;

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
  alarme <= alarm_int; 
  dout   <= din AND (NOT alarm_int);--not alarm_int (alarme interno)
  numero <= ('11' when match(3) = '1' else
             '10' when match(2) = '1' else
             '01' when match(1) = '1' else
             '00' when match(0) = '1');--normalmente a gente não faz o último else completo
             --só que a gente só quer que passe se o algum deles for '1'
             --acho que se não fizer isso ele dá erro

end architecture;