-- Test bench for Finite State Machine Exercise

entity FSM_TB is
end;

library IEEE;
use IEEE.STD_LOGIC_1164.all;

architecture A1 of FSM_TB is

  signal Crystal, nSysReset: STD_LOGIC := '0';
  signal Buttons: STD_LOGIC_VECTOR(1 to 2);
  signal WatchRunning, WatchReset: STD_LOGIC;

  signal OK: BOOLEAN := TRUE;

begin

  UUT: entity work.FSM(RTL)
    port map (Crystal => Crystal, 
              nSysReset => nSysReset, 
              Buttons => Buttons,
              WatchRunning => WatchRunning, 
              WatchReset => WatchReset);

  process
  begin
    while Now < 200 NS loop
      Crystal <= '0';
      wait for 5 NS;
      Crystal <= '1';
      wait for 5 NS;
    end loop;
    wait;
  end process;

  process
  begin
    nSysReset <= '0'; -- Zero
    Buttons <= "00";
    wait for 3 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    nSysReset <= '1';
    for I in 1 to 17 loop
      wait for 1 NS;
      if WatchRunning /= '0' or WatchReset /= '0' then
        OK <= FALSE;
      end if;
    end loop;
    Buttons <= "10"; -- Start
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Running
    wait for 1 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "10"; -- Stop
    wait for 1 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Stopped
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "01"; -- Reset
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '1' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Zero
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '1' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "10"; -- Start (from Zero)
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Running
    wait for 1 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "10"; -- Stop
    wait for 1 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Stopped
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "10"; -- Start (from Stopped)
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Running
    wait for 1 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "10"; -- Stop
    wait for 1 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Stopped
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "01"; -- Reset
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '1' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    Buttons <= "00"; -- Zero
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '1' then
      OK <= FALSE;
    end if;
    wait for 5 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;

    -- Test asynchronous reset (gives an error if reset is synchronous)

    wait for 5 ns;
    Buttons <= "10"; -- Start
    wait for 1 NS;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 4 NS;
    if WatchRunning /= '1' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    wait for 3 ns;
    nSysReset <= '0';
    wait for 1 ns;
    if WatchRunning /= '0' or WatchReset /= '0' then
      OK <= FALSE;
    end if;
    nSysReset <= '1';
    wait for 1 ns;

    wait;
  end process;


end;

