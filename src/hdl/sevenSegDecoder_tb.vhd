----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 12:50:07 PM
-- Design Name: 
-- Module Name: sevenSegDecoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is
    
    component sevenSegDecoder is
      port (
           i_D : in std_logic_vector (3 downto 0);
           o_S : out std_logic_vector (6 downto 0)
       );
     end component;
     
    signal w_sw : std_logic_vector (3 downto 0):= (others=> '0');
    signal w_seg : std_logic_vector (6 downto 0):= (others=> '0');
    
begin
    -- PORT MAPS --------------------------------------
    sevenSegDecoder_inst : sevenSegDecoder port map (
        i_D(0) => w_sw(0),
        i_D(1) => w_sw(1),
        i_D(2) => w_sw(2),
        i_D(3) => w_sw(3),
        o_S(0) => w_seg(0),
        o_S(1) => w_seg(1),
        o_S(2) => w_seg(2),
        o_S(3) => w_seg(3),
        o_S(4) => w_seg(4),
        o_S(5) => w_seg(5),
        o_S(6) => w_seg(6)
    );
    
    test_process : process
    begin
        w_sw <= x"0"; wait for 10 ns;
            assert w_seg = "1000000" report "error on 0" severity failure;
        w_sw <= x"1"; wait for 10 ns;
             assert w_seg = "1111001" report "error on 1" severity failure;
        w_sw <= x"2"; wait for 10 ns;
             assert w_seg = "0100100" report "error on 2" severity failure;
        w_sw <= x"3"; wait for 10 ns;
             assert w_seg = "0110000" report "error on 3" severity failure;   
        w_sw <= x"4"; wait for 10 ns;
              assert w_seg = "0011001" report "error on 4" severity failure;  
        w_sw <= x"5"; wait for 10 ns;
              assert w_seg = "0010010" report "error on 5" severity failure;   
        w_sw <= x"6"; wait for 10 ns;
              assert w_seg = "0000010" report "error on 6" severity failure;
        w_sw <= x"7"; wait for 10 ns;
              assert w_seg = "1111000" report "error on 7" severity failure;
        w_sw <= x"8"; wait for 10 ns;
              assert w_seg = "0000000" report "error on 8" severity failure;
        w_sw <= x"9"; wait for 10 ns;
              assert w_seg = "0011000" report "error on 9" severity failure;
        w_sw <= x"A"; wait for 10 ns;
              assert w_seg = "0001000" report "error on A" severity failure;
        w_sw <= x"B"; wait for 10 ns;
              assert w_seg = "0000011" report "error on b" severity failure;
        w_sw <= x"C"; wait for 10 ns;
              assert w_seg = "0100111" report "error on c" severity failure;
        w_sw <= x"D"; wait for 10 ns;
              assert w_seg = "0100001" report "error on d" severity failure;
        w_sw <= x"E"; wait for 10 ns;
              assert w_seg = "0000110" report "error on E" severity failure;
        w_sw <= x"F"; wait for 10 ns;
              assert w_seg = "0001110" report "error on F" severity failure;  
        wait;
    end process;

end test_bench;