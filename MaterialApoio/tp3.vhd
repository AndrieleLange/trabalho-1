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
  type state is (s0, A, B, C, D, buscando, bloqueio, zerar); 
  signal EA, PE: state;
  signal data : std_logic_vector(7 downto 0);
  signal found : std_logic;
  signal match : std_logic_vector(2 downto 0);
  signal alarm_int : std_logic;

begin  

  -- REGISTRADOR DE DESLOCAMENTO QUE RECEBE O FLUXO DE ENTRADA
  process (clock, reset)
  begin
    if reset = '1' then
      data <= (others => '0');
    elsif rising_edge(clock) then
      data <= din & data(7 downto 1);
    end if;
  end process;

  -- 4 PORT MAPS PARA OS ompara_dado 
   compara1: entity work.compara_dado
    port map (
      clock => clock,
      reset => reset,
      dado => data,
      pattern => padrao,
      prog => program(0),
      habilita => sel(0),
      match => match(0)
    );
  
  compara2: entity work.compara_dado
    port map (
      clock => clock,
      reset => reset,
      dado => data,
      pattern => padrao,
      prog => program(1),
      habilita => sel(1),
      match => match(1)
    );
  
  compara3: entity work.compara_dado
    port map (
      clock => clock,
      reset => reset,
      dado => data,
      pattern => padrao,
      prog => program(2),
      habilita => sel(2),
      match => match(2)
    );
  
  compara4: entity work.compara_dado
    port map (
      clock => clock,
      reset => reset,
      dado => data,
      pattern => padrao,
      prog => program(3),
      habilita => sel(3),
      match => match(3)
    );
     

  
  found <= (match(0) OR match(1) OR match(2) OR match(3));

  program(0) <= '1' when EA = A else '0';
  program(1) <= '1' when EA = B else '0';
  program(2) <= '1' when EA = C else '0';
  program(3) <= '1' when EA = D else '0';
  
  --  registradores para ativar as comparações
  process(clock,reset)
  begin 
  if reset='1' then
      sel(0)<='0';
      sel(1)<='0';
      sel(2)<='0';
      sel(3)<='0';
    if rising_edge(clock) begin 
      if EA = zerar then 
       sel(0)<='0';
      sel(1)<='0';
      sel(2)<='0';
      sel(3)<='0';
      if EA = A then
        sel(0)<='1';
      if EA = B then
        sel(1)<='1';
      if EA = C then
        sel(2)<='1';
      if EA = B then
        sel(3)<='1';
    end if;
  end if;
  end if;
  end if;
  end if;
  end if;
  end if;
 end process;

 

  --  registrador para o alarme interno
    process (clock, reset)
  begin
    if reset = '1' then
      alarm_int <= '0';
    elsif rising_edge(clock) then
      if EA = zerar then
        alarm_int<= '0';
      if EA = buscando then
        alarm_int <= found;
        if found = '1' then
          PE<= bloqueio;
      elsif EA = bloqueio then
        alarm_int <= '0';
      end if;
    end if;
    end if;
      end if;
  end process;

  -- MAQUINA DE ESTADOS (FSM)
  process(clock, reset)
      begin
        if reset='1' then
          EA <= s0;
        elsif rising_edge(clock) then
          EA <= PE;
        end if;
  end process;

  process(EA, prog, found)
    begin
      case EA is
          when S0 => 
              if prog="001" then PE <= A;
              else
                
              elsif prog="010" then PE <=B;
              elsif prog="011" then PE <=C;
              elsif prog="100" then PE <=D;
              elsif prog="101" then PE <= buscando;
              end if; 
          when buscando =>
                if found = '1' then PE <= bloqueio;
                elsif prog = "111" then PE <= zerar;
                end if;
          when bloqueio =>
                if prog = "110" then PE <= buscando;
                elsif prog = "111" then PE<= zerar;
                end if;
          when A => PE<= s0;
          when B => PE<= s0;
          when C => PE<= s0;
          when D => PE<= s0;
          when zerar => PE<= s0;
                
     end case;
end process;

  -- SAIDAS
  alarme <= alarm_int; 
  dout   <= din AND (NOT alarm_int);--not alarm_int (alarme interno)
  numero <= ('11' when match(3) = '1' else
             '10' when match(2) = '1' else
             '01' when match(1) = '1' else
             '00' );

end architecture;
