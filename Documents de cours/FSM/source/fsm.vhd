-- Template for Finite State Machine Exercise

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FSM is
  port (Crystal, nSysReset: in STD_LOGIC;
        Buttons: in STD_LOGIC_VECTOR(1 to 2);
        WatchRunning, WatchReset: out STD_LOGIC);
end;

architecture RTL of FSM is

end;

