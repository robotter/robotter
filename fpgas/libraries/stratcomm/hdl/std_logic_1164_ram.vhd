library ieee;
use ieee.std_logic_1164.all;

package std_logic_1164_ram is

  type std_logic_ram_8 is array (natural range <>) of std_logic_vector(7 downto 0);

  type std_logic_ram_16  is array (natural range <>) of std_logic_vector(15 downto 0);

end std_logic_1164_ram;
