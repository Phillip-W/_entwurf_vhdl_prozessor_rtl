
library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

package CONV_PACK_CPU is

-- define any necessary types
subtype opcode_type is BIT_VECTOR (5 downto 0);
subtype flag_type is BIT_VECTOR (3 downto 0);
subtype data_type is BIT_VECTOR (11 downto 0);
subtype reg_addr_type is BIT_VECTOR (1 downto 0);
subtype instruction_type is BIT_VECTOR (11 downto 0);
subtype addr_type is BIT_VECTOR (11 downto 0);
   
   -- Declarations for conversion functions.
   function std_logic_to_BIT(arg : in std_logic) return BIT;
   function BIT_to_std_logic(arg : in BIT) return std_logic;

end CONV_PACK_CPU;

package body CONV_PACK_CPU is
   
   -- std_logic to enum type function
   function std_logic_to_BIT(arg : in std_logic) return BIT is
   -- synopsys built_in SYN_FEED_THRU;
   begin
      case arg is
         when '0' => return '0';
         when '1' => return '1';
         when others => assert FALSE -- this should not happen.
               report "un-convertible value"
               severity warning;
               return '0';
      end case;
   end;
   
   -- enum type to std_logic function
   function BIT_to_std_logic(arg : in BIT) return std_logic is
   -- synopsys built_in SYN_FEED_THRU;
   begin
      case arg is
         when '0' => return '0';
         when '1' => return '1';
         when others => assert FALSE -- this should not happen.
               report "un-convertible value"
               severity warning;
               return '0';
      end case;
   end;

end CONV_PACK_CPU;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity mux12_2x1_1 is

   port( select_input : in std_logic;  d_in_a, d_in_b : in std_logic_vector (11
         downto 0);  d_out : out std_logic_vector (11 downto 0));

end mux12_2x1_1;

architecture SYN_RTL_1 of mux12_2x1_1 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;

begin
   
   U1 : MUX21X1 port map( IN1 => d_in_b(6), IN2 => d_in_a(6), S => select_input
                           , Q => d_out(6));
   U2 : MUX21X1 port map( IN1 => d_in_b(5), IN2 => d_in_a(5), S => select_input
                           , Q => d_out(5));
   U3 : MUX21X1 port map( IN1 => d_in_b(4), IN2 => d_in_a(4), S => select_input
                           , Q => d_out(4));
   U4 : MUX21X1 port map( IN1 => d_in_b(3), IN2 => d_in_a(3), S => select_input
                           , Q => d_out(3));
   U5 : MUX21X1 port map( IN1 => d_in_b(2), IN2 => d_in_a(2), S => select_input
                           , Q => d_out(2));
   U6 : MUX21X1 port map( IN1 => d_in_b(1), IN2 => d_in_a(1), S => select_input
                           , Q => d_out(1));
   U7 : MUX21X1 port map( IN1 => d_in_b(0), IN2 => d_in_a(0), S => select_input
                           , Q => d_out(0));
   U8 : MUX21X1 port map( IN1 => d_in_b(11), IN2 => d_in_a(11), S => 
                           select_input, Q => d_out(11));
   U9 : MUX21X1 port map( IN1 => d_in_b(10), IN2 => d_in_a(10), S => 
                           select_input, Q => d_out(10));
   U10 : MUX21X1 port map( IN1 => d_in_b(9), IN2 => d_in_a(9), S => 
                           select_input, Q => d_out(9));
   U11 : MUX21X1 port map( IN1 => d_in_b(8), IN2 => d_in_a(8), S => 
                           select_input, Q => d_out(8));
   U12 : MUX21X1 port map( IN1 => d_in_b(7), IN2 => d_in_a(7), S => 
                           select_input, Q => d_out(7));

end SYN_RTL_1;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity mux12_4x1_1 is

   port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
         d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
         std_logic_vector (11 downto 0));

end mux12_4x1_1;

architecture SYN_RTL_clk of mux12_4x1_1 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
      , n17, n18 : std_logic;

begin
   
   U1 : AO221X1 port map( IN1 => d_in_a(9), IN2 => n1, IN3 => d_in_c(9), IN4 =>
                           n2, IN5 => n3, Q => d_out(9));
   U2 : AO22X1 port map( IN1 => d_in_b(9), IN2 => n4, IN3 => d_in_d(9), IN4 => 
                           n5, Q => n3);
   U3 : AO221X1 port map( IN1 => d_in_a(8), IN2 => n1, IN3 => d_in_c(8), IN4 =>
                           n2, IN5 => n6, Q => d_out(8));
   U4 : AO22X1 port map( IN1 => d_in_b(8), IN2 => n4, IN3 => d_in_d(8), IN4 => 
                           n5, Q => n6);
   U5 : AO221X1 port map( IN1 => d_in_a(7), IN2 => n1, IN3 => d_in_c(7), IN4 =>
                           n2, IN5 => n7, Q => d_out(7));
   U6 : AO22X1 port map( IN1 => d_in_b(7), IN2 => n4, IN3 => d_in_d(7), IN4 => 
                           n5, Q => n7);
   U7 : AO221X1 port map( IN1 => d_in_a(6), IN2 => n1, IN3 => d_in_c(6), IN4 =>
                           n2, IN5 => n8, Q => d_out(6));
   U8 : AO22X1 port map( IN1 => d_in_b(6), IN2 => n4, IN3 => d_in_d(6), IN4 => 
                           n5, Q => n8);
   U9 : AO221X1 port map( IN1 => d_in_a(5), IN2 => n1, IN3 => d_in_c(5), IN4 =>
                           n2, IN5 => n9, Q => d_out(5));
   U10 : AO22X1 port map( IN1 => d_in_b(5), IN2 => n4, IN3 => d_in_d(5), IN4 =>
                           n5, Q => n9);
   U11 : AO221X1 port map( IN1 => d_in_a(4), IN2 => n1, IN3 => d_in_c(4), IN4 
                           => n2, IN5 => n10, Q => d_out(4));
   U12 : AO22X1 port map( IN1 => d_in_b(4), IN2 => n4, IN3 => d_in_d(4), IN4 =>
                           n5, Q => n10);
   U13 : AO221X1 port map( IN1 => d_in_a(3), IN2 => n1, IN3 => d_in_c(3), IN4 
                           => n2, IN5 => n11, Q => d_out(3));
   U14 : AO22X1 port map( IN1 => d_in_b(3), IN2 => n4, IN3 => d_in_d(3), IN4 =>
                           n5, Q => n11);
   U15 : AO221X1 port map( IN1 => d_in_a(2), IN2 => n1, IN3 => d_in_c(2), IN4 
                           => n2, IN5 => n12, Q => d_out(2));
   U16 : AO22X1 port map( IN1 => d_in_b(2), IN2 => n4, IN3 => d_in_d(2), IN4 =>
                           n5, Q => n12);
   U17 : AO221X1 port map( IN1 => d_in_a(1), IN2 => n1, IN3 => d_in_c(1), IN4 
                           => n2, IN5 => n13, Q => d_out(1));
   U18 : AO22X1 port map( IN1 => d_in_b(1), IN2 => n4, IN3 => d_in_d(1), IN4 =>
                           n5, Q => n13);
   U19 : AO221X1 port map( IN1 => d_in_a(11), IN2 => n1, IN3 => d_in_c(11), IN4
                           => n2, IN5 => n14, Q => d_out(11));
   U20 : AO22X1 port map( IN1 => d_in_b(11), IN2 => n4, IN3 => d_in_d(11), IN4 
                           => n5, Q => n14);
   U21 : AO221X1 port map( IN1 => d_in_a(10), IN2 => n1, IN3 => d_in_c(10), IN4
                           => n2, IN5 => n15, Q => d_out(10));
   U22 : AO22X1 port map( IN1 => d_in_b(10), IN2 => n4, IN3 => d_in_d(10), IN4 
                           => n5, Q => n15);
   U23 : AO221X1 port map( IN1 => d_in_a(0), IN2 => n1, IN3 => d_in_c(0), IN4 
                           => n2, IN5 => n16, Q => d_out(0));
   U24 : AO22X1 port map( IN1 => d_in_b(0), IN2 => n4, IN3 => d_in_d(0), IN4 =>
                           n5, Q => n16);
   U25 : NOR3X0 port map( IN1 => n5, IN2 => n4, IN3 => n2, QN => n1);
   U26 : NOR2X0 port map( IN1 => n17, IN2 => select_input(0), QN => n2);
   U27 : NOR2X0 port map( IN1 => n18, IN2 => select_input(1), QN => n4);
   U28 : NOR2X0 port map( IN1 => n17, IN2 => n18, QN => n5);
   U29 : INVX0 port map( INP => select_input(0), ZN => n18);
   U30 : INVX0 port map( INP => select_input(1), ZN => n17);

end SYN_RTL_clk;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity muxN_4x1_N12_2 is

   port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
         d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
         std_logic_vector (11 downto 0));

end muxN_4x1_N12_2;

architecture SYN_RTL of muxN_4x1_N12_2 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
      , n17, n18 : std_logic;

begin
   
   U1 : AO221X1 port map( IN1 => d_in_d(9), IN2 => n1, IN3 => d_in_c(9), IN4 =>
                           n2, IN5 => n3, Q => d_out(9));
   U2 : AO22X1 port map( IN1 => d_in_b(9), IN2 => n4, IN3 => d_in_a(9), IN4 => 
                           n5, Q => n3);
   U3 : AO221X1 port map( IN1 => d_in_d(8), IN2 => n1, IN3 => d_in_c(8), IN4 =>
                           n2, IN5 => n6, Q => d_out(8));
   U4 : AO22X1 port map( IN1 => d_in_b(8), IN2 => n4, IN3 => d_in_a(8), IN4 => 
                           n5, Q => n6);
   U5 : AO221X1 port map( IN1 => d_in_d(7), IN2 => n1, IN3 => d_in_c(7), IN4 =>
                           n2, IN5 => n7, Q => d_out(7));
   U6 : AO22X1 port map( IN1 => d_in_b(7), IN2 => n4, IN3 => d_in_a(7), IN4 => 
                           n5, Q => n7);
   U7 : AO221X1 port map( IN1 => d_in_d(6), IN2 => n1, IN3 => d_in_c(6), IN4 =>
                           n2, IN5 => n8, Q => d_out(6));
   U8 : AO22X1 port map( IN1 => d_in_b(6), IN2 => n4, IN3 => d_in_a(6), IN4 => 
                           n5, Q => n8);
   U9 : AO221X1 port map( IN1 => d_in_d(5), IN2 => n1, IN3 => d_in_c(5), IN4 =>
                           n2, IN5 => n9, Q => d_out(5));
   U10 : AO22X1 port map( IN1 => d_in_b(5), IN2 => n4, IN3 => d_in_a(5), IN4 =>
                           n5, Q => n9);
   U11 : AO221X1 port map( IN1 => d_in_d(4), IN2 => n1, IN3 => d_in_c(4), IN4 
                           => n2, IN5 => n10, Q => d_out(4));
   U12 : AO22X1 port map( IN1 => d_in_b(4), IN2 => n4, IN3 => d_in_a(4), IN4 =>
                           n5, Q => n10);
   U13 : AO221X1 port map( IN1 => d_in_d(3), IN2 => n1, IN3 => d_in_c(3), IN4 
                           => n2, IN5 => n11, Q => d_out(3));
   U14 : AO22X1 port map( IN1 => d_in_b(3), IN2 => n4, IN3 => d_in_a(3), IN4 =>
                           n5, Q => n11);
   U15 : AO221X1 port map( IN1 => d_in_d(2), IN2 => n1, IN3 => d_in_c(2), IN4 
                           => n2, IN5 => n12, Q => d_out(2));
   U16 : AO22X1 port map( IN1 => d_in_b(2), IN2 => n4, IN3 => d_in_a(2), IN4 =>
                           n5, Q => n12);
   U17 : AO221X1 port map( IN1 => d_in_d(1), IN2 => n1, IN3 => d_in_c(1), IN4 
                           => n2, IN5 => n13, Q => d_out(1));
   U18 : AO22X1 port map( IN1 => d_in_b(1), IN2 => n4, IN3 => d_in_a(1), IN4 =>
                           n5, Q => n13);
   U19 : AO221X1 port map( IN1 => d_in_d(11), IN2 => n1, IN3 => d_in_c(11), IN4
                           => n2, IN5 => n14, Q => d_out(11));
   U20 : AO22X1 port map( IN1 => d_in_b(11), IN2 => n4, IN3 => d_in_a(11), IN4 
                           => n5, Q => n14);
   U21 : AO221X1 port map( IN1 => d_in_d(10), IN2 => n1, IN3 => d_in_c(10), IN4
                           => n2, IN5 => n15, Q => d_out(10));
   U22 : AO22X1 port map( IN1 => d_in_b(10), IN2 => n4, IN3 => d_in_a(10), IN4 
                           => n5, Q => n15);
   U23 : AO221X1 port map( IN1 => d_in_d(0), IN2 => n1, IN3 => d_in_c(0), IN4 
                           => n2, IN5 => n16, Q => d_out(0));
   U24 : AO22X1 port map( IN1 => d_in_b(0), IN2 => n4, IN3 => d_in_a(0), IN4 =>
                           n5, Q => n16);
   U25 : NOR2X0 port map( IN1 => select_input(0), IN2 => select_input(1), QN =>
                           n5);
   U26 : NOR2X0 port map( IN1 => n17, IN2 => select_input(1), QN => n4);
   U27 : NOR2X0 port map( IN1 => n18, IN2 => select_input(0), QN => n2);
   U28 : NOR2X0 port map( IN1 => n18, IN2 => n17, QN => n1);
   U29 : INVX0 port map( INP => select_input(0), ZN => n17);
   U30 : INVX0 port map( INP => select_input(1), ZN => n18);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity muxN_4x1_N12_1 is

   port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
         d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
         std_logic_vector (11 downto 0));

end muxN_4x1_N12_1;

architecture SYN_RTL of muxN_4x1_N12_1 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
      , n17, n18 : std_logic;

begin
   
   U1 : AO221X1 port map( IN1 => d_in_d(9), IN2 => n1, IN3 => d_in_c(9), IN4 =>
                           n2, IN5 => n3, Q => d_out(9));
   U2 : AO22X1 port map( IN1 => d_in_b(9), IN2 => n4, IN3 => d_in_a(9), IN4 => 
                           n5, Q => n3);
   U3 : AO221X1 port map( IN1 => d_in_d(8), IN2 => n1, IN3 => d_in_c(8), IN4 =>
                           n2, IN5 => n6, Q => d_out(8));
   U4 : AO22X1 port map( IN1 => d_in_b(8), IN2 => n4, IN3 => d_in_a(8), IN4 => 
                           n5, Q => n6);
   U5 : AO221X1 port map( IN1 => d_in_d(7), IN2 => n1, IN3 => d_in_c(7), IN4 =>
                           n2, IN5 => n7, Q => d_out(7));
   U6 : AO22X1 port map( IN1 => d_in_b(7), IN2 => n4, IN3 => d_in_a(7), IN4 => 
                           n5, Q => n7);
   U7 : AO221X1 port map( IN1 => d_in_d(6), IN2 => n1, IN3 => d_in_c(6), IN4 =>
                           n2, IN5 => n8, Q => d_out(6));
   U8 : AO22X1 port map( IN1 => d_in_b(6), IN2 => n4, IN3 => d_in_a(6), IN4 => 
                           n5, Q => n8);
   U9 : AO221X1 port map( IN1 => d_in_d(5), IN2 => n1, IN3 => d_in_c(5), IN4 =>
                           n2, IN5 => n9, Q => d_out(5));
   U10 : AO22X1 port map( IN1 => d_in_b(5), IN2 => n4, IN3 => d_in_a(5), IN4 =>
                           n5, Q => n9);
   U11 : AO221X1 port map( IN1 => d_in_d(4), IN2 => n1, IN3 => d_in_c(4), IN4 
                           => n2, IN5 => n10, Q => d_out(4));
   U12 : AO22X1 port map( IN1 => d_in_b(4), IN2 => n4, IN3 => d_in_a(4), IN4 =>
                           n5, Q => n10);
   U13 : AO221X1 port map( IN1 => d_in_d(3), IN2 => n1, IN3 => d_in_c(3), IN4 
                           => n2, IN5 => n11, Q => d_out(3));
   U14 : AO22X1 port map( IN1 => d_in_b(3), IN2 => n4, IN3 => d_in_a(3), IN4 =>
                           n5, Q => n11);
   U15 : AO221X1 port map( IN1 => d_in_d(2), IN2 => n1, IN3 => d_in_c(2), IN4 
                           => n2, IN5 => n12, Q => d_out(2));
   U16 : AO22X1 port map( IN1 => d_in_b(2), IN2 => n4, IN3 => d_in_a(2), IN4 =>
                           n5, Q => n12);
   U17 : AO221X1 port map( IN1 => d_in_d(1), IN2 => n1, IN3 => d_in_c(1), IN4 
                           => n2, IN5 => n13, Q => d_out(1));
   U18 : AO22X1 port map( IN1 => d_in_b(1), IN2 => n4, IN3 => d_in_a(1), IN4 =>
                           n5, Q => n13);
   U19 : AO221X1 port map( IN1 => d_in_d(11), IN2 => n1, IN3 => d_in_c(11), IN4
                           => n2, IN5 => n14, Q => d_out(11));
   U20 : AO22X1 port map( IN1 => d_in_b(11), IN2 => n4, IN3 => d_in_a(11), IN4 
                           => n5, Q => n14);
   U21 : AO221X1 port map( IN1 => d_in_d(10), IN2 => n1, IN3 => d_in_c(10), IN4
                           => n2, IN5 => n15, Q => d_out(10));
   U22 : AO22X1 port map( IN1 => d_in_b(10), IN2 => n4, IN3 => d_in_a(10), IN4 
                           => n5, Q => n15);
   U23 : AO221X1 port map( IN1 => d_in_d(0), IN2 => n1, IN3 => d_in_c(0), IN4 
                           => n2, IN5 => n16, Q => d_out(0));
   U24 : AO22X1 port map( IN1 => d_in_b(0), IN2 => n4, IN3 => d_in_a(0), IN4 =>
                           n5, Q => n16);
   U25 : NOR2X0 port map( IN1 => select_input(0), IN2 => select_input(1), QN =>
                           n5);
   U26 : NOR2X0 port map( IN1 => n17, IN2 => select_input(1), QN => n4);
   U27 : NOR2X0 port map( IN1 => n18, IN2 => select_input(0), QN => n2);
   U28 : NOR2X0 port map( IN1 => n18, IN2 => n17, QN => n1);
   U29 : INVX0 port map( INP => select_input(0), ZN => n17);
   U30 : INVX0 port map( INP => select_input(1), ZN => n18);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N12_6 is

   port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (11 downto 0));

end reg_N12_6;

architecture SYN_RTL of reg_N12_6 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n1, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n_1000, n_1001, n_1002, n_1003, n_1004, 
      n_1005, n_1006, n_1007, n_1008, n_1009, n_1010, n_1011 : std_logic;

begin
   Q_OUT <= ( Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_11_inst : DFFARX1 port map( D => n1, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_11_port, QN => n_1000);
   Q_OUT_reg_10_inst : DFFARX1 port map( D => n13, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_10_port, QN => n_1001);
   Q_OUT_reg_9_inst : DFFARX1 port map( D => n14, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_9_port, QN => n_1002);
   Q_OUT_reg_8_inst : DFFARX1 port map( D => n15, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_8_port, QN => n_1003);
   Q_OUT_reg_7_inst : DFFARX1 port map( D => n16, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_7_port, QN => n_1004);
   Q_OUT_reg_6_inst : DFFARX1 port map( D => n17, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_6_port, QN => n_1005);
   Q_OUT_reg_5_inst : DFFARX1 port map( D => n18, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_5_port, QN => n_1006);
   Q_OUT_reg_4_inst : DFFARX1 port map( D => n19, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_4_port, QN => n_1007);
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n20, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_3_port, QN => n_1008);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n21, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_2_port, QN => n_1009);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n22, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_1_port, QN => n_1010);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n23, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_0_port, QN => n_1011);
   U2 : MUX21X1 port map( IN1 => Q_OUT_7_port, IN2 => D_IN(7), S => ENABLE, Q 
                           => n16);
   U3 : MUX21X1 port map( IN1 => Q_OUT_6_port, IN2 => D_IN(6), S => ENABLE, Q 
                           => n17);
   U4 : MUX21X1 port map( IN1 => Q_OUT_5_port, IN2 => D_IN(5), S => ENABLE, Q 
                           => n18);
   U5 : MUX21X1 port map( IN1 => Q_OUT_4_port, IN2 => D_IN(4), S => ENABLE, Q 
                           => n19);
   U6 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n20);
   U7 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n21);
   U8 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n22);
   U9 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n23);
   U10 : MUX21X1 port map( IN1 => Q_OUT_11_port, IN2 => D_IN(11), S => ENABLE, 
                           Q => n1);
   U11 : MUX21X1 port map( IN1 => Q_OUT_10_port, IN2 => D_IN(10), S => ENABLE, 
                           Q => n13);
   U12 : MUX21X1 port map( IN1 => Q_OUT_9_port, IN2 => D_IN(9), S => ENABLE, Q 
                           => n14);
   U13 : MUX21X1 port map( IN1 => Q_OUT_8_port, IN2 => D_IN(8), S => ENABLE, Q 
                           => n15);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N12_5 is

   port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (11 downto 0));

end reg_N12_5;

architecture SYN_RTL of reg_N12_5 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n1, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n_1012, n_1013, n_1014, n_1015, n_1016, 
      n_1017, n_1018, n_1019, n_1020, n_1021, n_1022, n_1023 : std_logic;

begin
   Q_OUT <= ( Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_11_inst : DFFARX1 port map( D => n1, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_11_port, QN => n_1012);
   Q_OUT_reg_10_inst : DFFARX1 port map( D => n13, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_10_port, QN => n_1013);
   Q_OUT_reg_9_inst : DFFARX1 port map( D => n14, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_9_port, QN => n_1014);
   Q_OUT_reg_8_inst : DFFARX1 port map( D => n15, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_8_port, QN => n_1015);
   Q_OUT_reg_7_inst : DFFARX1 port map( D => n16, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_7_port, QN => n_1016);
   Q_OUT_reg_6_inst : DFFARX1 port map( D => n17, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_6_port, QN => n_1017);
   Q_OUT_reg_5_inst : DFFARX1 port map( D => n18, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_5_port, QN => n_1018);
   Q_OUT_reg_4_inst : DFFARX1 port map( D => n19, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_4_port, QN => n_1019);
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n20, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_3_port, QN => n_1020);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n21, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_2_port, QN => n_1021);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n22, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_1_port, QN => n_1022);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n23, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_0_port, QN => n_1023);
   U2 : MUX21X1 port map( IN1 => Q_OUT_7_port, IN2 => D_IN(7), S => ENABLE, Q 
                           => n16);
   U3 : MUX21X1 port map( IN1 => Q_OUT_6_port, IN2 => D_IN(6), S => ENABLE, Q 
                           => n17);
   U4 : MUX21X1 port map( IN1 => Q_OUT_5_port, IN2 => D_IN(5), S => ENABLE, Q 
                           => n18);
   U5 : MUX21X1 port map( IN1 => Q_OUT_4_port, IN2 => D_IN(4), S => ENABLE, Q 
                           => n19);
   U6 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n20);
   U7 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n21);
   U8 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n22);
   U9 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n23);
   U10 : MUX21X1 port map( IN1 => Q_OUT_11_port, IN2 => D_IN(11), S => ENABLE, 
                           Q => n1);
   U11 : MUX21X1 port map( IN1 => Q_OUT_10_port, IN2 => D_IN(10), S => ENABLE, 
                           Q => n13);
   U12 : MUX21X1 port map( IN1 => Q_OUT_9_port, IN2 => D_IN(9), S => ENABLE, Q 
                           => n14);
   U13 : MUX21X1 port map( IN1 => Q_OUT_8_port, IN2 => D_IN(8), S => ENABLE, Q 
                           => n15);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N12_4 is

   port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (11 downto 0));

end reg_N12_4;

architecture SYN_RTL of reg_N12_4 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n1, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n_1024, n_1025, n_1026, n_1027, n_1028, 
      n_1029, n_1030, n_1031, n_1032, n_1033, n_1034, n_1035 : std_logic;

begin
   Q_OUT <= ( Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_11_inst : DFFARX1 port map( D => n1, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_11_port, QN => n_1024);
   Q_OUT_reg_10_inst : DFFARX1 port map( D => n13, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_10_port, QN => n_1025);
   Q_OUT_reg_9_inst : DFFARX1 port map( D => n14, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_9_port, QN => n_1026);
   Q_OUT_reg_8_inst : DFFARX1 port map( D => n15, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_8_port, QN => n_1027);
   Q_OUT_reg_7_inst : DFFARX1 port map( D => n16, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_7_port, QN => n_1028);
   Q_OUT_reg_6_inst : DFFARX1 port map( D => n17, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_6_port, QN => n_1029);
   Q_OUT_reg_5_inst : DFFARX1 port map( D => n18, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_5_port, QN => n_1030);
   Q_OUT_reg_4_inst : DFFARX1 port map( D => n19, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_4_port, QN => n_1031);
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n20, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_3_port, QN => n_1032);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n21, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_2_port, QN => n_1033);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n22, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_1_port, QN => n_1034);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n23, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_0_port, QN => n_1035);
   U2 : MUX21X1 port map( IN1 => Q_OUT_7_port, IN2 => D_IN(7), S => ENABLE, Q 
                           => n16);
   U3 : MUX21X1 port map( IN1 => Q_OUT_6_port, IN2 => D_IN(6), S => ENABLE, Q 
                           => n17);
   U4 : MUX21X1 port map( IN1 => Q_OUT_5_port, IN2 => D_IN(5), S => ENABLE, Q 
                           => n18);
   U5 : MUX21X1 port map( IN1 => Q_OUT_4_port, IN2 => D_IN(4), S => ENABLE, Q 
                           => n19);
   U6 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n20);
   U7 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n21);
   U8 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n22);
   U9 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n23);
   U10 : MUX21X1 port map( IN1 => Q_OUT_11_port, IN2 => D_IN(11), S => ENABLE, 
                           Q => n1);
   U11 : MUX21X1 port map( IN1 => Q_OUT_10_port, IN2 => D_IN(10), S => ENABLE, 
                           Q => n13);
   U12 : MUX21X1 port map( IN1 => Q_OUT_9_port, IN2 => D_IN(9), S => ENABLE, Q 
                           => n14);
   U13 : MUX21X1 port map( IN1 => Q_OUT_8_port, IN2 => D_IN(8), S => ENABLE, Q 
                           => n15);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N12_3 is

   port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (11 downto 0));

end reg_N12_3;

architecture SYN_RTL of reg_N12_3 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n1, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n_1036, n_1037, n_1038, n_1039, n_1040, 
      n_1041, n_1042, n_1043, n_1044, n_1045, n_1046, n_1047 : std_logic;

begin
   Q_OUT <= ( Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_11_inst : DFFARX1 port map( D => n1, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_11_port, QN => n_1036);
   Q_OUT_reg_10_inst : DFFARX1 port map( D => n13, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_10_port, QN => n_1037);
   Q_OUT_reg_9_inst : DFFARX1 port map( D => n14, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_9_port, QN => n_1038);
   Q_OUT_reg_8_inst : DFFARX1 port map( D => n15, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_8_port, QN => n_1039);
   Q_OUT_reg_7_inst : DFFARX1 port map( D => n16, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_7_port, QN => n_1040);
   Q_OUT_reg_6_inst : DFFARX1 port map( D => n17, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_6_port, QN => n_1041);
   Q_OUT_reg_5_inst : DFFARX1 port map( D => n18, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_5_port, QN => n_1042);
   Q_OUT_reg_4_inst : DFFARX1 port map( D => n19, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_4_port, QN => n_1043);
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n20, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_3_port, QN => n_1044);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n21, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_2_port, QN => n_1045);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n22, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_1_port, QN => n_1046);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n23, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_0_port, QN => n_1047);
   U2 : MUX21X1 port map( IN1 => Q_OUT_7_port, IN2 => D_IN(7), S => ENABLE, Q 
                           => n16);
   U3 : MUX21X1 port map( IN1 => Q_OUT_6_port, IN2 => D_IN(6), S => ENABLE, Q 
                           => n17);
   U4 : MUX21X1 port map( IN1 => Q_OUT_5_port, IN2 => D_IN(5), S => ENABLE, Q 
                           => n18);
   U5 : MUX21X1 port map( IN1 => Q_OUT_4_port, IN2 => D_IN(4), S => ENABLE, Q 
                           => n19);
   U6 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n20);
   U7 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n21);
   U8 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n22);
   U9 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n23);
   U10 : MUX21X1 port map( IN1 => Q_OUT_11_port, IN2 => D_IN(11), S => ENABLE, 
                           Q => n1);
   U11 : MUX21X1 port map( IN1 => Q_OUT_10_port, IN2 => D_IN(10), S => ENABLE, 
                           Q => n13);
   U12 : MUX21X1 port map( IN1 => Q_OUT_9_port, IN2 => D_IN(9), S => ENABLE, Q 
                           => n14);
   U13 : MUX21X1 port map( IN1 => Q_OUT_8_port, IN2 => D_IN(8), S => ENABLE, Q 
                           => n15);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N12_2 is

   port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (11 downto 0));

end reg_N12_2;

architecture SYN_RTL of reg_N12_2 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n1, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n_1048, n_1049, n_1050, n_1051, n_1052, 
      n_1053, n_1054, n_1055, n_1056, n_1057, n_1058, n_1059 : std_logic;

begin
   Q_OUT <= ( Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_11_inst : DFFARX1 port map( D => n1, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_11_port, QN => n_1048);
   Q_OUT_reg_10_inst : DFFARX1 port map( D => n13, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_10_port, QN => n_1049);
   Q_OUT_reg_9_inst : DFFARX1 port map( D => n14, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_9_port, QN => n_1050);
   Q_OUT_reg_8_inst : DFFARX1 port map( D => n15, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_8_port, QN => n_1051);
   Q_OUT_reg_7_inst : DFFARX1 port map( D => n16, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_7_port, QN => n_1052);
   Q_OUT_reg_6_inst : DFFARX1 port map( D => n17, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_6_port, QN => n_1053);
   Q_OUT_reg_5_inst : DFFARX1 port map( D => n18, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_5_port, QN => n_1054);
   Q_OUT_reg_4_inst : DFFARX1 port map( D => n19, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_4_port, QN => n_1055);
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n20, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_3_port, QN => n_1056);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n21, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_2_port, QN => n_1057);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n22, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_1_port, QN => n_1058);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n23, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_0_port, QN => n_1059);
   U2 : MUX21X1 port map( IN1 => Q_OUT_7_port, IN2 => D_IN(7), S => ENABLE, Q 
                           => n16);
   U3 : MUX21X1 port map( IN1 => Q_OUT_6_port, IN2 => D_IN(6), S => ENABLE, Q 
                           => n17);
   U4 : MUX21X1 port map( IN1 => Q_OUT_5_port, IN2 => D_IN(5), S => ENABLE, Q 
                           => n18);
   U5 : MUX21X1 port map( IN1 => Q_OUT_4_port, IN2 => D_IN(4), S => ENABLE, Q 
                           => n19);
   U6 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n20);
   U7 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n21);
   U8 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n22);
   U9 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n23);
   U10 : MUX21X1 port map( IN1 => Q_OUT_11_port, IN2 => D_IN(11), S => ENABLE, 
                           Q => n1);
   U11 : MUX21X1 port map( IN1 => Q_OUT_10_port, IN2 => D_IN(10), S => ENABLE, 
                           Q => n13);
   U12 : MUX21X1 port map( IN1 => Q_OUT_9_port, IN2 => D_IN(9), S => ENABLE, Q 
                           => n14);
   U13 : MUX21X1 port map( IN1 => Q_OUT_8_port, IN2 => D_IN(8), S => ENABLE, Q 
                           => n15);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N12_1 is

   port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (11 downto 0));

end reg_N12_1;

architecture SYN_RTL of reg_N12_1 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n1, n13, n14, n15, n16, n17, 
      n18, n19, n20, n21, n22, n23, n_1060, n_1061, n_1062, n_1063, n_1064, 
      n_1065, n_1066, n_1067, n_1068, n_1069, n_1070, n_1071 : std_logic;

begin
   Q_OUT <= ( Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_11_inst : DFFARX1 port map( D => n1, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_11_port, QN => n_1060);
   Q_OUT_reg_10_inst : DFFARX1 port map( D => n13, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_10_port, QN => n_1061);
   Q_OUT_reg_9_inst : DFFARX1 port map( D => n14, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_9_port, QN => n_1062);
   Q_OUT_reg_8_inst : DFFARX1 port map( D => n15, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_8_port, QN => n_1063);
   Q_OUT_reg_7_inst : DFFARX1 port map( D => n16, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_7_port, QN => n_1064);
   Q_OUT_reg_6_inst : DFFARX1 port map( D => n17, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_6_port, QN => n_1065);
   Q_OUT_reg_5_inst : DFFARX1 port map( D => n18, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_5_port, QN => n_1066);
   Q_OUT_reg_4_inst : DFFARX1 port map( D => n19, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_4_port, QN => n_1067);
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n20, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_3_port, QN => n_1068);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n21, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_2_port, QN => n_1069);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n22, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_1_port, QN => n_1070);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n23, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_0_port, QN => n_1071);
   U2 : MUX21X1 port map( IN1 => Q_OUT_7_port, IN2 => D_IN(7), S => ENABLE, Q 
                           => n16);
   U3 : MUX21X1 port map( IN1 => Q_OUT_6_port, IN2 => D_IN(6), S => ENABLE, Q 
                           => n17);
   U4 : MUX21X1 port map( IN1 => Q_OUT_5_port, IN2 => D_IN(5), S => ENABLE, Q 
                           => n18);
   U5 : MUX21X1 port map( IN1 => Q_OUT_4_port, IN2 => D_IN(4), S => ENABLE, Q 
                           => n19);
   U6 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n20);
   U7 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n21);
   U8 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n22);
   U9 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n23);
   U10 : MUX21X1 port map( IN1 => Q_OUT_11_port, IN2 => D_IN(11), S => ENABLE, 
                           Q => n1);
   U11 : MUX21X1 port map( IN1 => Q_OUT_10_port, IN2 => D_IN(10), S => ENABLE, 
                           Q => n13);
   U12 : MUX21X1 port map( IN1 => Q_OUT_9_port, IN2 => D_IN(9), S => ENABLE, Q 
                           => n14);
   U13 : MUX21X1 port map( IN1 => Q_OUT_8_port, IN2 => D_IN(8), S => ENABLE, Q 
                           => n15);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity demux1_1x4 is

   port( select_input : in std_logic_vector (1 downto 0);  d_in : in std_logic;
         d_out_a, d_out_b, d_out_c, d_out_d : out std_logic);

end demux1_1x4;

architecture SYN_RTL of demux1_1x4 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2 : std_logic;

begin
   
   U2 : AND3X1 port map( IN1 => select_input(0), IN2 => d_in, IN3 => 
                           select_input(1), Q => d_out_d);
   U3 : AND3X1 port map( IN1 => select_input(1), IN2 => n1, IN3 => d_in, Q => 
                           d_out_c);
   U4 : AND3X1 port map( IN1 => select_input(0), IN2 => n2, IN3 => d_in, Q => 
                           d_out_b);
   U5 : AND3X1 port map( IN1 => d_in, IN2 => n2, IN3 => n1, Q => d_out_a);
   U6 : INVX0 port map( INP => select_input(0), ZN => n1);
   U7 : INVX0 port map( INP => select_input(1), ZN => n2);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity muxN_4x1_N12_0 is

   port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
         d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
         std_logic_vector (11 downto 0));

end muxN_4x1_N12_0;

architecture SYN_RTL of muxN_4x1_N12_0 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
      , n17, n18 : std_logic;

begin
   
   U1 : AO221X1 port map( IN1 => d_in_d(9), IN2 => n1, IN3 => d_in_c(9), IN4 =>
                           n2, IN5 => n3, Q => d_out(9));
   U2 : AO22X1 port map( IN1 => d_in_b(9), IN2 => n4, IN3 => d_in_a(9), IN4 => 
                           n5, Q => n3);
   U3 : AO221X1 port map( IN1 => d_in_d(8), IN2 => n1, IN3 => d_in_c(8), IN4 =>
                           n2, IN5 => n6, Q => d_out(8));
   U4 : AO22X1 port map( IN1 => d_in_b(8), IN2 => n4, IN3 => d_in_a(8), IN4 => 
                           n5, Q => n6);
   U5 : AO221X1 port map( IN1 => d_in_d(7), IN2 => n1, IN3 => d_in_c(7), IN4 =>
                           n2, IN5 => n7, Q => d_out(7));
   U6 : AO22X1 port map( IN1 => d_in_b(7), IN2 => n4, IN3 => d_in_a(7), IN4 => 
                           n5, Q => n7);
   U7 : AO221X1 port map( IN1 => d_in_d(6), IN2 => n1, IN3 => d_in_c(6), IN4 =>
                           n2, IN5 => n8, Q => d_out(6));
   U8 : AO22X1 port map( IN1 => d_in_b(6), IN2 => n4, IN3 => d_in_a(6), IN4 => 
                           n5, Q => n8);
   U9 : AO221X1 port map( IN1 => d_in_d(5), IN2 => n1, IN3 => d_in_c(5), IN4 =>
                           n2, IN5 => n9, Q => d_out(5));
   U10 : AO22X1 port map( IN1 => d_in_b(5), IN2 => n4, IN3 => d_in_a(5), IN4 =>
                           n5, Q => n9);
   U11 : AO221X1 port map( IN1 => d_in_d(4), IN2 => n1, IN3 => d_in_c(4), IN4 
                           => n2, IN5 => n10, Q => d_out(4));
   U12 : AO22X1 port map( IN1 => d_in_b(4), IN2 => n4, IN3 => d_in_a(4), IN4 =>
                           n5, Q => n10);
   U13 : AO221X1 port map( IN1 => d_in_d(3), IN2 => n1, IN3 => d_in_c(3), IN4 
                           => n2, IN5 => n11, Q => d_out(3));
   U14 : AO22X1 port map( IN1 => d_in_b(3), IN2 => n4, IN3 => d_in_a(3), IN4 =>
                           n5, Q => n11);
   U15 : AO221X1 port map( IN1 => d_in_d(2), IN2 => n1, IN3 => d_in_c(2), IN4 
                           => n2, IN5 => n12, Q => d_out(2));
   U16 : AO22X1 port map( IN1 => d_in_b(2), IN2 => n4, IN3 => d_in_a(2), IN4 =>
                           n5, Q => n12);
   U17 : AO221X1 port map( IN1 => d_in_d(1), IN2 => n1, IN3 => d_in_c(1), IN4 
                           => n2, IN5 => n13, Q => d_out(1));
   U18 : AO22X1 port map( IN1 => d_in_b(1), IN2 => n4, IN3 => d_in_a(1), IN4 =>
                           n5, Q => n13);
   U19 : AO221X1 port map( IN1 => d_in_d(11), IN2 => n1, IN3 => d_in_c(11), IN4
                           => n2, IN5 => n14, Q => d_out(11));
   U20 : AO22X1 port map( IN1 => d_in_b(11), IN2 => n4, IN3 => d_in_a(11), IN4 
                           => n5, Q => n14);
   U21 : AO221X1 port map( IN1 => d_in_d(10), IN2 => n1, IN3 => d_in_c(10), IN4
                           => n2, IN5 => n15, Q => d_out(10));
   U22 : AO22X1 port map( IN1 => d_in_b(10), IN2 => n4, IN3 => d_in_a(10), IN4 
                           => n5, Q => n15);
   U23 : AO221X1 port map( IN1 => d_in_d(0), IN2 => n1, IN3 => d_in_c(0), IN4 
                           => n2, IN5 => n16, Q => d_out(0));
   U24 : AO22X1 port map( IN1 => d_in_b(0), IN2 => n4, IN3 => d_in_a(0), IN4 =>
                           n5, Q => n16);
   U25 : NOR2X0 port map( IN1 => select_input(0), IN2 => select_input(1), QN =>
                           n5);
   U26 : NOR2X0 port map( IN1 => n17, IN2 => select_input(1), QN => n4);
   U27 : NOR2X0 port map( IN1 => n18, IN2 => select_input(0), QN => n2);
   U28 : NOR2X0 port map( IN1 => n18, IN2 => n17, QN => n1);
   U29 : INVX0 port map( INP => select_input(0), ZN => n17);
   U30 : INVX0 port map( INP => select_input(1), ZN => n18);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity mux4_4x1 is

   port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
         d_in_c, d_in_d : in std_logic_vector (3 downto 0);  d_out : out 
         std_logic_vector (3 downto 0));

end mux4_4x1;

architecture SYN_RTL_clk of mux4_4x1 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10 : std_logic;

begin
   
   U1 : AO221X1 port map( IN1 => d_in_c(3), IN2 => n1, IN3 => d_in_d(3), IN4 =>
                           n2, IN5 => n3, Q => d_out(3));
   U2 : AO22X1 port map( IN1 => d_in_b(3), IN2 => n4, IN3 => d_in_a(3), IN4 => 
                           n5, Q => n3);
   U3 : AO221X1 port map( IN1 => d_in_c(2), IN2 => n1, IN3 => d_in_d(2), IN4 =>
                           n2, IN5 => n6, Q => d_out(2));
   U4 : AO22X1 port map( IN1 => d_in_b(2), IN2 => n4, IN3 => d_in_a(2), IN4 => 
                           n5, Q => n6);
   U5 : AO221X1 port map( IN1 => d_in_c(1), IN2 => n1, IN3 => d_in_d(1), IN4 =>
                           n2, IN5 => n7, Q => d_out(1));
   U6 : AO22X1 port map( IN1 => d_in_b(1), IN2 => n4, IN3 => d_in_a(1), IN4 => 
                           n5, Q => n7);
   U7 : AO221X1 port map( IN1 => d_in_c(0), IN2 => n1, IN3 => d_in_d(0), IN4 =>
                           n2, IN5 => n8, Q => d_out(0));
   U8 : AO22X1 port map( IN1 => d_in_b(0), IN2 => n4, IN3 => d_in_a(0), IN4 => 
                           n5, Q => n8);
   U9 : NOR2X0 port map( IN1 => select_input(0), IN2 => select_input(1), QN => 
                           n5);
   U10 : NOR2X0 port map( IN1 => n9, IN2 => select_input(1), QN => n4);
   U11 : NOR2X0 port map( IN1 => n10, IN2 => n9, QN => n2);
   U12 : INVX0 port map( INP => select_input(0), ZN => n9);
   U13 : NOR2X0 port map( IN1 => n10, IN2 => select_input(0), QN => n1);
   U14 : INVX0 port map( INP => select_input(1), ZN => n10);

end SYN_RTL_clk;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity adder is

   port( opcode : in std_logic_vector (5 downto 0);  flags_in : in 
         std_logic_vector (3 downto 0);  op1, op2 : in std_logic_vector (11 
         downto 0);  flags_out : out std_logic_vector (3 downto 0);  re : out 
         std_logic_vector (11 downto 0));

end adder;

architecture SYN_behav of adder is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NAND4X0
      port( IN1, IN2, IN3, IN4 : in std_logic;  QN : out std_logic);
   end component;
   
   component XNOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI21X1
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component NAND2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   signal flags_out_2_port, flags_out_1_port, flags_out_0_port, re_11_port, 
      re_10_port, re_9_port, re_8_port, re_7_port, re_6_port, re_5_port, 
      re_4_port, re_3_port, re_2_port, re_1_port, re_0_port, n1, n2, n3, n4, n5
      , n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, 
      n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35
      , n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, 
      n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64
      : std_logic;

begin
   flags_out <= ( flags_in(3), flags_out_2_port, flags_out_1_port, 
      flags_out_0_port );
   re <= ( re_11_port, re_10_port, re_9_port, re_8_port, re_7_port, re_6_port, 
      re_5_port, re_4_port, re_3_port, re_2_port, re_1_port, re_0_port );
   
   U2 : XOR2X1 port map( IN1 => n1, IN2 => n2, Q => re_9_port);
   U3 : XOR2X1 port map( IN1 => n3, IN2 => n4, Q => re_8_port);
   U4 : XOR2X1 port map( IN1 => n5, IN2 => n6, Q => re_7_port);
   U5 : XOR2X1 port map( IN1 => n7, IN2 => n8, Q => re_6_port);
   U6 : XOR2X1 port map( IN1 => n9, IN2 => n10, Q => re_5_port);
   U7 : XOR2X1 port map( IN1 => n11, IN2 => n12, Q => re_4_port);
   U8 : XOR2X1 port map( IN1 => n13, IN2 => n14, Q => re_3_port);
   U9 : XOR2X1 port map( IN1 => n15, IN2 => n16, Q => re_2_port);
   U10 : XOR2X1 port map( IN1 => n17, IN2 => n18, Q => re_1_port);
   U11 : XOR2X1 port map( IN1 => n19, IN2 => n20, Q => re_10_port);
   U12 : XOR2X1 port map( IN1 => n21, IN2 => n22, Q => re_0_port);
   U13 : NAND2X0 port map( IN1 => flags_in(3), IN2 => n23, QN => n21);
   U14 : INVX0 port map( INP => n24, ZN => n23);
   U15 : XOR2X1 port map( IN1 => re_11_port, IN2 => flags_out_1_port, Q => 
                           flags_out_0_port);
   U16 : XOR2X1 port map( IN1 => flags_out_2_port, IN2 => n25, Q => 
                           flags_out_1_port);
   U17 : AO22X1 port map( IN1 => op1(11), IN2 => n26, IN3 => n25, IN4 => n27, Q
                           => flags_out_2_port);
   U18 : XOR2X1 port map( IN1 => n27, IN2 => n25, Q => re_11_port);
   U19 : XOR2X1 port map( IN1 => n26, IN2 => op1(11), Q => n25);
   U20 : XNOR2X1 port map( IN1 => n28, IN2 => op2(11), Q => n26);
   U21 : AO22X1 port map( IN1 => op1(10), IN2 => n29, IN3 => n20, IN4 => n19, Q
                           => n27);
   U22 : AO21X1 port map( IN1 => n2, IN2 => n1, IN3 => n30, Q => n19);
   U23 : AO21X1 port map( IN1 => n4, IN2 => n3, IN3 => n31, Q => n1);
   U24 : AO21X1 port map( IN1 => n6, IN2 => n5, IN3 => n32, Q => n3);
   U25 : AO21X1 port map( IN1 => n8, IN2 => n7, IN3 => n33, Q => n5);
   U26 : AO21X1 port map( IN1 => n10, IN2 => n9, IN3 => n34, Q => n7);
   U27 : AO21X1 port map( IN1 => n12, IN2 => n11, IN3 => n35, Q => n9);
   U28 : AO21X1 port map( IN1 => n14, IN2 => n13, IN3 => n36, Q => n11);
   U29 : AO21X1 port map( IN1 => n16, IN2 => n15, IN3 => n37, Q => n13);
   U30 : AO21X1 port map( IN1 => n18, IN2 => n17, IN3 => n38, Q => n15);
   U31 : AO22X1 port map( IN1 => op1(0), IN2 => n39, IN3 => n40, IN4 => 
                           flags_in(3), Q => n17);
   U32 : NOR2X0 port map( IN1 => n22, IN2 => n24, QN => n40);
   U33 : NAND2X0 port map( IN1 => opcode(0), IN2 => n41, QN => n24);
   U34 : NAND2X0 port map( IN1 => n28, IN2 => n42, QN => n41);
   U35 : NAND4X0 port map( IN1 => opcode(1), IN2 => n43, IN3 => n44, IN4 => n45
                           , QN => n42);
   U36 : INVX0 port map( INP => opcode(2), ZN => n43);
   U37 : XNOR2X1 port map( IN1 => n39, IN2 => op1(0), Q => n22);
   U38 : XNOR2X1 port map( IN1 => n28, IN2 => op2(0), Q => n39);
   U39 : AOI21X1 port map( IN1 => n46, IN2 => n47, IN3 => n38, QN => n18);
   U40 : NOR2X0 port map( IN1 => n47, IN2 => n46, QN => n38);
   U41 : INVX0 port map( INP => op1(1), ZN => n47);
   U42 : XOR2X1 port map( IN1 => n28, IN2 => op2(1), Q => n46);
   U43 : AOI21X1 port map( IN1 => n48, IN2 => n49, IN3 => n37, QN => n16);
   U44 : NOR2X0 port map( IN1 => n49, IN2 => n48, QN => n37);
   U45 : INVX0 port map( INP => op1(2), ZN => n49);
   U46 : XOR2X1 port map( IN1 => n28, IN2 => op2(2), Q => n48);
   U47 : AOI21X1 port map( IN1 => n50, IN2 => n51, IN3 => n36, QN => n14);
   U48 : NOR2X0 port map( IN1 => n51, IN2 => n50, QN => n36);
   U49 : INVX0 port map( INP => op1(3), ZN => n51);
   U50 : XOR2X1 port map( IN1 => n28, IN2 => op2(3), Q => n50);
   U51 : AOI21X1 port map( IN1 => n52, IN2 => n53, IN3 => n35, QN => n12);
   U52 : NOR2X0 port map( IN1 => n53, IN2 => n52, QN => n35);
   U53 : INVX0 port map( INP => op1(4), ZN => n53);
   U54 : XOR2X1 port map( IN1 => n28, IN2 => op2(4), Q => n52);
   U55 : AOI21X1 port map( IN1 => n54, IN2 => n55, IN3 => n34, QN => n10);
   U56 : NOR2X0 port map( IN1 => n55, IN2 => n54, QN => n34);
   U57 : INVX0 port map( INP => op1(5), ZN => n55);
   U58 : XOR2X1 port map( IN1 => n28, IN2 => op2(5), Q => n54);
   U59 : AOI21X1 port map( IN1 => n56, IN2 => n57, IN3 => n33, QN => n8);
   U60 : NOR2X0 port map( IN1 => n57, IN2 => n56, QN => n33);
   U61 : INVX0 port map( INP => op1(6), ZN => n57);
   U62 : XOR2X1 port map( IN1 => n28, IN2 => op2(6), Q => n56);
   U63 : AOI21X1 port map( IN1 => n58, IN2 => n59, IN3 => n32, QN => n6);
   U64 : NOR2X0 port map( IN1 => n59, IN2 => n58, QN => n32);
   U65 : INVX0 port map( INP => op1(7), ZN => n59);
   U66 : XOR2X1 port map( IN1 => n28, IN2 => op2(7), Q => n58);
   U67 : AOI21X1 port map( IN1 => n60, IN2 => n61, IN3 => n31, QN => n4);
   U68 : NOR2X0 port map( IN1 => n61, IN2 => n60, QN => n31);
   U69 : INVX0 port map( INP => op1(8), ZN => n61);
   U70 : XOR2X1 port map( IN1 => n28, IN2 => op2(8), Q => n60);
   U71 : AOI21X1 port map( IN1 => n62, IN2 => n63, IN3 => n30, QN => n2);
   U72 : NOR2X0 port map( IN1 => n63, IN2 => n62, QN => n30);
   U73 : INVX0 port map( INP => op1(9), ZN => n63);
   U74 : XOR2X1 port map( IN1 => n28, IN2 => op2(9), Q => n62);
   U75 : XOR2X1 port map( IN1 => n29, IN2 => op1(10), Q => n20);
   U76 : XNOR2X1 port map( IN1 => n28, IN2 => op2(10), Q => n29);
   U77 : NAND4X0 port map( IN1 => opcode(2), IN2 => n64, IN3 => n44, IN4 => n45
                           , QN => n28);
   U78 : INVX0 port map( INP => opcode(3), ZN => n45);
   U79 : NOR2X0 port map( IN1 => opcode(5), IN2 => opcode(4), QN => n44);
   U80 : INVX0 port map( INP => opcode(1), ZN => n64);

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity shifter is

   port( OPCode : in std_logic_vector (5 downto 0);  Flagsin : in 
         std_logic_vector (3 downto 0);  Flagsout : out std_logic_vector (3 
         downto 0);  OP1, OP2 : in std_logic_vector (11 downto 0);  result : 
         out std_logic_vector (11 downto 0));

end shifter;

architecture SYN_shift of shifter is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component AND4X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component OR4X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component XNOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component OR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AND3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component OA21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component AND2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  QN : out std_logic);
   end component;
   
   component OAI22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  QN : out std_logic);
   end component;
   
   component LATCHX1
      port( CLK, D : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal N81, N82, N83, N84, N85, N86, N87, N88, N89, N90, N91, N92, N93, N94,
      N95, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, 
      n16, n17, n18, n19, n20, n21, n22, n23, n_1072, n_1073, n_1074, n_1075, 
      n_1076, n_1077, n_1078, n_1079, n_1080, n_1081, n_1082, n_1083, n_1084, 
      n_1085, n_1086, n_1087 : std_logic;

begin
   
   result_reg_11_inst : LATCHX1 port map( CLK => N81, D => N95, Q => result(11)
                           , QN => n_1072);
   result_reg_10_inst : LATCHX1 port map( CLK => N81, D => N94, Q => result(10)
                           , QN => n_1073);
   result_reg_9_inst : LATCHX1 port map( CLK => N81, D => N93, Q => result(9), 
                           QN => n_1074);
   result_reg_8_inst : LATCHX1 port map( CLK => N81, D => N92, Q => result(8), 
                           QN => n_1075);
   result_reg_7_inst : LATCHX1 port map( CLK => N81, D => N91, Q => result(7), 
                           QN => n_1076);
   result_reg_6_inst : LATCHX1 port map( CLK => N81, D => N90, Q => result(6), 
                           QN => n_1077);
   result_reg_5_inst : LATCHX1 port map( CLK => N81, D => N89, Q => result(5), 
                           QN => n_1078);
   result_reg_4_inst : LATCHX1 port map( CLK => N81, D => N88, Q => result(4), 
                           QN => n_1079);
   result_reg_3_inst : LATCHX1 port map( CLK => N81, D => N87, Q => result(3), 
                           QN => n_1080);
   result_reg_2_inst : LATCHX1 port map( CLK => N81, D => N86, Q => result(2), 
                           QN => n_1081);
   result_reg_1_inst : LATCHX1 port map( CLK => N81, D => N85, Q => result(1), 
                           QN => n_1082);
   result_reg_0_inst : LATCHX1 port map( CLK => N81, D => N84, Q => result(0), 
                           QN => n_1083);
   Flagsout_reg_3_inst : LATCHX1 port map( CLK => N81, D => Flagsin(3), Q => 
                           Flagsout(3), QN => n_1084);
   Flagsout_reg_2_inst : LATCHX1 port map( CLK => N81, D => N83, Q => 
                           Flagsout(2), QN => n_1085);
   Flagsout_reg_1_inst : LATCHX1 port map( CLK => N81, D => Flagsin(1), Q => 
                           Flagsout(1), QN => n_1086);
   Flagsout_reg_0_inst : LATCHX1 port map( CLK => N81, D => N82, Q => 
                           Flagsout(0), QN => n_1087);
   U3 : MUX21X1 port map( IN1 => n1, IN2 => n2, S => n3, Q => N95);
   U4 : OAI22X1 port map( IN1 => n4, IN2 => n5, IN3 => n6, IN4 => n7, QN => n2)
                           ;
   U5 : AOI22X1 port map( IN1 => n4, IN2 => OP1(0), IN3 => n8, IN4 => 
                           Flagsin(2), QN => n7);
   U6 : INVX0 port map( INP => OP1(10), ZN => n5);
   U7 : NOR2X0 port map( IN1 => n8, IN2 => Flagsin(2), QN => n4);
   U8 : AND2X1 port map( IN1 => OP1(11), IN2 => OPCode(0), Q => n1);
   U9 : MUX21X1 port map( IN1 => OP1(9), IN2 => OP1(11), S => n9, Q => N94);
   U10 : MUX21X1 port map( IN1 => OP1(8), IN2 => OP1(10), S => n9, Q => N93);
   U11 : MUX21X1 port map( IN1 => OP1(7), IN2 => OP1(9), S => n9, Q => N92);
   U12 : MUX21X1 port map( IN1 => OP1(6), IN2 => OP1(8), S => n9, Q => N91);
   U13 : MUX21X1 port map( IN1 => OP1(5), IN2 => OP1(7), S => n9, Q => N90);
   U14 : MUX21X1 port map( IN1 => OP1(4), IN2 => OP1(6), S => n9, Q => N89);
   U15 : MUX21X1 port map( IN1 => OP1(3), IN2 => OP1(5), S => n9, Q => N88);
   U16 : MUX21X1 port map( IN1 => OP1(2), IN2 => OP1(4), S => n9, Q => N87);
   U17 : MUX21X1 port map( IN1 => OP1(1), IN2 => OP1(3), S => n9, Q => N86);
   U18 : MUX21X1 port map( IN1 => OP1(0), IN2 => OP1(2), S => n9, Q => N85);
   U19 : NOR3X0 port map( IN1 => n6, IN2 => n10, IN3 => n11, QN => n9);
   U20 : OA21X1 port map( IN1 => n10, IN2 => n12, IN3 => n13, Q => N84);
   U21 : MUX21X1 port map( IN1 => OP1(1), IN2 => OP1(11), S => n11, Q => n12);
   U22 : AND3X1 port map( IN1 => n8, IN2 => n14, IN3 => n3, Q => n11);
   U23 : NOR2X0 port map( IN1 => n14, IN2 => n8, QN => n10);
   U24 : INVX0 port map( INP => Flagsin(2), ZN => n14);
   U25 : AO22X1 port map( IN1 => OP1(0), IN2 => n15, IN3 => Flagsin(2), IN4 => 
                           n16, Q => N83);
   U26 : OR2X1 port map( IN1 => n17, IN2 => n6, Q => n16);
   U27 : INVX0 port map( INP => n13, ZN => n6);
   U28 : MUX21X1 port map( IN1 => OP1(11), IN2 => OP1(0), S => n8, Q => n17);
   U29 : OR2X1 port map( IN1 => n18, IN2 => OPCode(1), Q => n8);
   U30 : INVX0 port map( INP => n3, ZN => n15);
   U31 : NOR2X0 port map( IN1 => n19, IN2 => n13, QN => N82);
   U32 : XNOR2X1 port map( IN1 => OP1(10), IN2 => OP1(11), Q => n19);
   U33 : NAND3X0 port map( IN1 => n3, IN2 => n18, IN3 => n13, QN => N81);
   U34 : NAND3X0 port map( IN1 => n20, IN2 => n21, IN3 => OPCode(0), QN => n13)
                           ;
   U35 : INVX0 port map( INP => OPCode(1), ZN => n21);
   U36 : OR4X1 port map( IN1 => n22, IN2 => OPCode(2), IN3 => OPCode(3), IN4 =>
                           OPCode(5), Q => n18);
   U37 : NAND2X0 port map( IN1 => OPCode(1), IN2 => n20, QN => n3);
   U38 : AND4X1 port map( IN1 => OPCode(3), IN2 => OPCode(2), IN3 => n22, IN4 
                           => n23, Q => n20);
   U39 : INVX0 port map( INP => OPCode(5), ZN => n23);
   U40 : INVX0 port map( INP => OPCode(4), ZN => n22);

end SYN_shift;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity LogicUnit is

   port( O1, O2 : in std_logic_vector (11 downto 0);  Operation : in 
         std_logic_vector (5 downto 0);  Result : out std_logic_vector (11 
         downto 0);  FlagsOut : out std_logic_vector (3 downto 0));

end LogicUnit;

architecture SYN_RTL of LogicUnit is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AOI21X1
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component OR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component AND2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component OA21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component LATCHX1
      port( CLK, D : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal X_Logic0_port, N84, N86, N87, N88, N89, N90, N91, N92, N93, N94, N95,
      N96, N97, n25, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, 
      n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n26, n27, n28, n29
      , n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, 
      n44, n45, n46, n47, n48, n49, n50, n51, n52, n_1088, n_1089, n_1090, 
      n_1091, n_1092, n_1093, n_1094, n_1095, n_1096, n_1097, n_1098, n_1099 : 
      std_logic;

begin
   FlagsOut <= ( X_Logic0_port, X_Logic0_port, X_Logic0_port, X_Logic0_port );
   
   X_Logic0_port <= '0';
   Result_reg_11_inst : LATCHX1 port map( CLK => n25, D => N96, Q => Result(11)
                           , QN => n_1088);
   Result_reg_10_inst : LATCHX1 port map( CLK => n25, D => N95, Q => Result(10)
                           , QN => n_1089);
   Result_reg_9_inst : LATCHX1 port map( CLK => n25, D => N94, Q => Result(9), 
                           QN => n_1090);
   Result_reg_8_inst : LATCHX1 port map( CLK => n25, D => N93, Q => Result(8), 
                           QN => n_1091);
   Result_reg_7_inst : LATCHX1 port map( CLK => n25, D => N92, Q => Result(7), 
                           QN => n_1092);
   Result_reg_6_inst : LATCHX1 port map( CLK => n25, D => N91, Q => Result(6), 
                           QN => n_1093);
   Result_reg_5_inst : LATCHX1 port map( CLK => n25, D => N90, Q => Result(5), 
                           QN => n_1094);
   Result_reg_4_inst : LATCHX1 port map( CLK => n25, D => N89, Q => Result(4), 
                           QN => n_1095);
   Result_reg_3_inst : LATCHX1 port map( CLK => n25, D => N88, Q => Result(3), 
                           QN => n_1096);
   Result_reg_2_inst : LATCHX1 port map( CLK => n25, D => N87, Q => Result(2), 
                           QN => n_1097);
   Result_reg_1_inst : LATCHX1 port map( CLK => n25, D => N86, Q => Result(1), 
                           QN => n_1098);
   Result_reg_0_inst : LATCHX1 port map( CLK => N97, D => N84, Q => Result(0), 
                           QN => n_1099);
   U2 : AOI21X1 port map( IN1 => n1, IN2 => n2, IN3 => n3, QN => n25);
   U3 : NOR2X0 port map( IN1 => n4, IN2 => n3, QN => N97);
   U4 : OR2X1 port map( IN1 => Operation(5), IN2 => Operation(4), Q => n3);
   U5 : OA21X1 port map( IN1 => n5, IN2 => n6, IN3 => n1, Q => n4);
   U6 : OA21X1 port map( IN1 => Operation(1), IN2 => Operation(0), IN3 => 
                           Operation(2), Q => n5);
   U7 : MUX21X1 port map( IN1 => n7, IN2 => n8, S => O1(11), Q => N96);
   U8 : NAND2X0 port map( IN1 => n9, IN2 => n10, QN => n8);
   U9 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(11), Q => n9);
   U10 : AO21X1 port map( IN1 => O2(11), IN2 => n12, IN3 => n13, Q => n7);
   U11 : MUX21X1 port map( IN1 => n14, IN2 => n15, S => O1(10), Q => N95);
   U12 : NAND2X0 port map( IN1 => n16, IN2 => n10, QN => n15);
   U13 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(10), Q => n16);
   U14 : AO21X1 port map( IN1 => O2(10), IN2 => n12, IN3 => n13, Q => n14);
   U15 : MUX21X1 port map( IN1 => n17, IN2 => n18, S => O1(9), Q => N94);
   U16 : NAND2X0 port map( IN1 => n19, IN2 => n10, QN => n18);
   U17 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(9), Q => n19);
   U18 : AO21X1 port map( IN1 => O2(9), IN2 => n12, IN3 => n13, Q => n17);
   U19 : MUX21X1 port map( IN1 => n20, IN2 => n21, S => O1(8), Q => N93);
   U20 : NAND2X0 port map( IN1 => n22, IN2 => n10, QN => n21);
   U21 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(8), Q => n22);
   U22 : AO21X1 port map( IN1 => O2(8), IN2 => n12, IN3 => n13, Q => n20);
   U23 : MUX21X1 port map( IN1 => n23, IN2 => n24, S => O1(7), Q => N92);
   U24 : NAND2X0 port map( IN1 => n26, IN2 => n10, QN => n24);
   U25 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(7), Q => n26);
   U26 : AO21X1 port map( IN1 => O2(7), IN2 => n12, IN3 => n13, Q => n23);
   U27 : MUX21X1 port map( IN1 => n27, IN2 => n28, S => O1(6), Q => N91);
   U28 : NAND2X0 port map( IN1 => n29, IN2 => n10, QN => n28);
   U29 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(6), Q => n29);
   U30 : AO21X1 port map( IN1 => O2(6), IN2 => n12, IN3 => n13, Q => n27);
   U31 : MUX21X1 port map( IN1 => n30, IN2 => n31, S => O1(5), Q => N90);
   U32 : NAND2X0 port map( IN1 => n32, IN2 => n10, QN => n31);
   U33 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(5), Q => n32);
   U34 : AO21X1 port map( IN1 => O2(5), IN2 => n12, IN3 => n13, Q => n30);
   U35 : MUX21X1 port map( IN1 => n33, IN2 => n34, S => O1(4), Q => N89);
   U36 : NAND2X0 port map( IN1 => n35, IN2 => n10, QN => n34);
   U37 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(4), Q => n35);
   U38 : AO21X1 port map( IN1 => O2(4), IN2 => n12, IN3 => n13, Q => n33);
   U39 : MUX21X1 port map( IN1 => n36, IN2 => n37, S => O1(3), Q => N88);
   U40 : NAND2X0 port map( IN1 => n38, IN2 => n10, QN => n37);
   U41 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(3), Q => n38);
   U42 : AO21X1 port map( IN1 => O2(3), IN2 => n12, IN3 => n13, Q => n36);
   U43 : MUX21X1 port map( IN1 => n39, IN2 => n40, S => O1(2), Q => N87);
   U44 : NAND2X0 port map( IN1 => n41, IN2 => n10, QN => n40);
   U45 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(2), Q => n41);
   U46 : AO21X1 port map( IN1 => O2(2), IN2 => n12, IN3 => n13, Q => n39);
   U47 : MUX21X1 port map( IN1 => n42, IN2 => n43, S => O1(1), Q => N86);
   U48 : NAND2X0 port map( IN1 => n44, IN2 => n10, QN => n43);
   U49 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(1), Q => n44);
   U50 : AO21X1 port map( IN1 => O2(1), IN2 => n12, IN3 => n13, Q => n42);
   U51 : NAND2X0 port map( IN1 => n45, IN2 => n46, QN => N84);
   U52 : NAND3X0 port map( IN1 => O1(11), IN2 => Operation(3), IN3 => n47, QN 
                           => n46);
   U53 : MUX21X1 port map( IN1 => Operation(1), IN2 => n48, S => Operation(2), 
                           Q => n47);
   U54 : NOR2X0 port map( IN1 => Operation(1), IN2 => Operation(0), QN => n48);
   U55 : MUX21X1 port map( IN1 => n49, IN2 => n50, S => O1(0), Q => n45);
   U56 : AND2X1 port map( IN1 => n10, IN2 => n51, Q => n50);
   U57 : MUX21X1 port map( IN1 => n2, IN2 => n11, S => O2(0), Q => n51);
   U58 : NAND2X0 port map( IN1 => Operation(0), IN2 => n52, QN => n11);
   U59 : INVX0 port map( INP => n1, ZN => n52);
   U60 : OR2X1 port map( IN1 => n2, IN2 => Operation(0), Q => n10);
   U61 : INVX0 port map( INP => n12, ZN => n2);
   U62 : AOI21X1 port map( IN1 => n12, IN2 => O2(0), IN3 => n13, QN => n49);
   U63 : NOR2X0 port map( IN1 => n1, IN2 => Operation(0), QN => n13);
   U64 : NAND3X0 port map( IN1 => Operation(1), IN2 => n6, IN3 => Operation(2),
                           QN => n1);
   U65 : NOR3X0 port map( IN1 => Operation(1), IN2 => Operation(2), IN3 => n6, 
                           QN => n12);
   U66 : INVX0 port map( INP => Operation(3), ZN => n6);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N4 is

   port( D_IN : in std_logic_vector (3 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (3 downto 0));

end reg_N4;

architecture SYN_RTL of reg_N4 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_3_port, Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n2, n3, n4, 
      n5, n_1100, n_1101, n_1102, n_1103 : std_logic;

begin
   Q_OUT <= ( Q_OUT_3_port, Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n5, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_3_port, QN => n_1100);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n4, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_2_port, QN => n_1101);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n3, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_1_port, QN => n_1102);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n2, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_0_port, QN => n_1103);
   U2 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n5);
   U3 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n4);
   U4 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n3);
   U5 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n2);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_file is

   port( clk, rst, enab : in std_logic;  SEL_in, SEL_out_A, SEL_out_B, 
         SEL_out_C : in std_logic_vector (1 downto 0);  RF_IN : in 
         std_logic_vector (11 downto 0);  ALU_IN, D_OUT_1, D_OUT_2 : out 
         std_logic_vector (11 downto 0));

end reg_file;

architecture SYN_behav of reg_file is

   component demux1_1x4
      port( select_input : in std_logic_vector (1 downto 0);  d_in : in 
            std_logic;  d_out_a, d_out_b, d_out_c, d_out_d : out std_logic);
   end component;
   
   component reg_N12_1
      port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (11 downto 0));
   end component;
   
   component reg_N12_2
      port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (11 downto 0));
   end component;
   
   component reg_N12_3
      port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (11 downto 0));
   end component;
   
   component reg_N12_4
      port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (11 downto 0));
   end component;
   
   component muxN_4x1_N12_1
      port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
            d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
            std_logic_vector (11 downto 0));
   end component;
   
   component muxN_4x1_N12_2
      port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
            d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
            std_logic_vector (11 downto 0));
   end component;
   
   component muxN_4x1_N12_0
      port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
            d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
            std_logic_vector (11 downto 0));
   end component;
   
   signal d_out_a_11_port, d_out_a_10_port, d_out_a_9_port, d_out_a_8_port, 
      d_out_a_7_port, d_out_a_6_port, d_out_a_5_port, d_out_a_4_port, 
      d_out_a_3_port, d_out_a_2_port, d_out_a_1_port, d_out_a_0_port, 
      d_out_b_11_port, d_out_b_10_port, d_out_b_9_port, d_out_b_8_port, 
      d_out_b_7_port, d_out_b_6_port, d_out_b_5_port, d_out_b_4_port, 
      d_out_b_3_port, d_out_b_2_port, d_out_b_1_port, d_out_b_0_port, 
      d_out_c_11_port, d_out_c_10_port, d_out_c_9_port, d_out_c_8_port, 
      d_out_c_7_port, d_out_c_6_port, d_out_c_5_port, d_out_c_4_port, 
      d_out_c_3_port, d_out_c_2_port, d_out_c_1_port, d_out_c_0_port, 
      d_out_d_11_port, d_out_d_10_port, d_out_d_9_port, d_out_d_8_port, 
      d_out_d_7_port, d_out_d_6_port, d_out_d_5_port, d_out_d_4_port, 
      d_out_d_3_port, d_out_d_2_port, d_out_d_1_port, d_out_d_0_port, en_a, 
      en_b, en_c, en_d : std_logic;

begin
   
   mux_alu_in : muxN_4x1_N12_0 port map( select_input(1) => SEL_out_A(1), 
                           select_input(0) => SEL_out_A(0), d_in_a(11) => 
                           d_out_a_11_port, d_in_a(10) => d_out_a_10_port, 
                           d_in_a(9) => d_out_a_9_port, d_in_a(8) => 
                           d_out_a_8_port, d_in_a(7) => d_out_a_7_port, 
                           d_in_a(6) => d_out_a_6_port, d_in_a(5) => 
                           d_out_a_5_port, d_in_a(4) => d_out_a_4_port, 
                           d_in_a(3) => d_out_a_3_port, d_in_a(2) => 
                           d_out_a_2_port, d_in_a(1) => d_out_a_1_port, 
                           d_in_a(0) => d_out_a_0_port, d_in_b(11) => 
                           d_out_b_11_port, d_in_b(10) => d_out_b_10_port, 
                           d_in_b(9) => d_out_b_9_port, d_in_b(8) => 
                           d_out_b_8_port, d_in_b(7) => d_out_b_7_port, 
                           d_in_b(6) => d_out_b_6_port, d_in_b(5) => 
                           d_out_b_5_port, d_in_b(4) => d_out_b_4_port, 
                           d_in_b(3) => d_out_b_3_port, d_in_b(2) => 
                           d_out_b_2_port, d_in_b(1) => d_out_b_1_port, 
                           d_in_b(0) => d_out_b_0_port, d_in_c(11) => 
                           d_out_c_11_port, d_in_c(10) => d_out_c_10_port, 
                           d_in_c(9) => d_out_c_9_port, d_in_c(8) => 
                           d_out_c_8_port, d_in_c(7) => d_out_c_7_port, 
                           d_in_c(6) => d_out_c_6_port, d_in_c(5) => 
                           d_out_c_5_port, d_in_c(4) => d_out_c_4_port, 
                           d_in_c(3) => d_out_c_3_port, d_in_c(2) => 
                           d_out_c_2_port, d_in_c(1) => d_out_c_1_port, 
                           d_in_c(0) => d_out_c_0_port, d_in_d(11) => 
                           d_out_d_11_port, d_in_d(10) => d_out_d_10_port, 
                           d_in_d(9) => d_out_d_9_port, d_in_d(8) => 
                           d_out_d_8_port, d_in_d(7) => d_out_d_7_port, 
                           d_in_d(6) => d_out_d_6_port, d_in_d(5) => 
                           d_out_d_5_port, d_in_d(4) => d_out_d_4_port, 
                           d_in_d(3) => d_out_d_3_port, d_in_d(2) => 
                           d_out_d_2_port, d_in_d(1) => d_out_d_1_port, 
                           d_in_d(0) => d_out_d_0_port, d_out(11) => ALU_IN(11)
                           , d_out(10) => ALU_IN(10), d_out(9) => ALU_IN(9), 
                           d_out(8) => ALU_IN(8), d_out(7) => ALU_IN(7), 
                           d_out(6) => ALU_IN(6), d_out(5) => ALU_IN(5), 
                           d_out(4) => ALU_IN(4), d_out(3) => ALU_IN(3), 
                           d_out(2) => ALU_IN(2), d_out(1) => ALU_IN(1), 
                           d_out(0) => ALU_IN(0));
   mux_D_OUT_1 : muxN_4x1_N12_2 port map( select_input(1) => SEL_out_B(1), 
                           select_input(0) => SEL_out_B(0), d_in_a(11) => 
                           d_out_a_11_port, d_in_a(10) => d_out_a_10_port, 
                           d_in_a(9) => d_out_a_9_port, d_in_a(8) => 
                           d_out_a_8_port, d_in_a(7) => d_out_a_7_port, 
                           d_in_a(6) => d_out_a_6_port, d_in_a(5) => 
                           d_out_a_5_port, d_in_a(4) => d_out_a_4_port, 
                           d_in_a(3) => d_out_a_3_port, d_in_a(2) => 
                           d_out_a_2_port, d_in_a(1) => d_out_a_1_port, 
                           d_in_a(0) => d_out_a_0_port, d_in_b(11) => 
                           d_out_b_11_port, d_in_b(10) => d_out_b_10_port, 
                           d_in_b(9) => d_out_b_9_port, d_in_b(8) => 
                           d_out_b_8_port, d_in_b(7) => d_out_b_7_port, 
                           d_in_b(6) => d_out_b_6_port, d_in_b(5) => 
                           d_out_b_5_port, d_in_b(4) => d_out_b_4_port, 
                           d_in_b(3) => d_out_b_3_port, d_in_b(2) => 
                           d_out_b_2_port, d_in_b(1) => d_out_b_1_port, 
                           d_in_b(0) => d_out_b_0_port, d_in_c(11) => 
                           d_out_c_11_port, d_in_c(10) => d_out_c_10_port, 
                           d_in_c(9) => d_out_c_9_port, d_in_c(8) => 
                           d_out_c_8_port, d_in_c(7) => d_out_c_7_port, 
                           d_in_c(6) => d_out_c_6_port, d_in_c(5) => 
                           d_out_c_5_port, d_in_c(4) => d_out_c_4_port, 
                           d_in_c(3) => d_out_c_3_port, d_in_c(2) => 
                           d_out_c_2_port, d_in_c(1) => d_out_c_1_port, 
                           d_in_c(0) => d_out_c_0_port, d_in_d(11) => 
                           d_out_d_11_port, d_in_d(10) => d_out_d_10_port, 
                           d_in_d(9) => d_out_d_9_port, d_in_d(8) => 
                           d_out_d_8_port, d_in_d(7) => d_out_d_7_port, 
                           d_in_d(6) => d_out_d_6_port, d_in_d(5) => 
                           d_out_d_5_port, d_in_d(4) => d_out_d_4_port, 
                           d_in_d(3) => d_out_d_3_port, d_in_d(2) => 
                           d_out_d_2_port, d_in_d(1) => d_out_d_1_port, 
                           d_in_d(0) => d_out_d_0_port, d_out(11) => 
                           D_OUT_1(11), d_out(10) => D_OUT_1(10), d_out(9) => 
                           D_OUT_1(9), d_out(8) => D_OUT_1(8), d_out(7) => 
                           D_OUT_1(7), d_out(6) => D_OUT_1(6), d_out(5) => 
                           D_OUT_1(5), d_out(4) => D_OUT_1(4), d_out(3) => 
                           D_OUT_1(3), d_out(2) => D_OUT_1(2), d_out(1) => 
                           D_OUT_1(1), d_out(0) => D_OUT_1(0));
   mux_D_OUT_2 : muxN_4x1_N12_1 port map( select_input(1) => SEL_out_C(1), 
                           select_input(0) => SEL_out_C(0), d_in_a(11) => 
                           d_out_a_11_port, d_in_a(10) => d_out_a_10_port, 
                           d_in_a(9) => d_out_a_9_port, d_in_a(8) => 
                           d_out_a_8_port, d_in_a(7) => d_out_a_7_port, 
                           d_in_a(6) => d_out_a_6_port, d_in_a(5) => 
                           d_out_a_5_port, d_in_a(4) => d_out_a_4_port, 
                           d_in_a(3) => d_out_a_3_port, d_in_a(2) => 
                           d_out_a_2_port, d_in_a(1) => d_out_a_1_port, 
                           d_in_a(0) => d_out_a_0_port, d_in_b(11) => 
                           d_out_b_11_port, d_in_b(10) => d_out_b_10_port, 
                           d_in_b(9) => d_out_b_9_port, d_in_b(8) => 
                           d_out_b_8_port, d_in_b(7) => d_out_b_7_port, 
                           d_in_b(6) => d_out_b_6_port, d_in_b(5) => 
                           d_out_b_5_port, d_in_b(4) => d_out_b_4_port, 
                           d_in_b(3) => d_out_b_3_port, d_in_b(2) => 
                           d_out_b_2_port, d_in_b(1) => d_out_b_1_port, 
                           d_in_b(0) => d_out_b_0_port, d_in_c(11) => 
                           d_out_c_11_port, d_in_c(10) => d_out_c_10_port, 
                           d_in_c(9) => d_out_c_9_port, d_in_c(8) => 
                           d_out_c_8_port, d_in_c(7) => d_out_c_7_port, 
                           d_in_c(6) => d_out_c_6_port, d_in_c(5) => 
                           d_out_c_5_port, d_in_c(4) => d_out_c_4_port, 
                           d_in_c(3) => d_out_c_3_port, d_in_c(2) => 
                           d_out_c_2_port, d_in_c(1) => d_out_c_1_port, 
                           d_in_c(0) => d_out_c_0_port, d_in_d(11) => 
                           d_out_d_11_port, d_in_d(10) => d_out_d_10_port, 
                           d_in_d(9) => d_out_d_9_port, d_in_d(8) => 
                           d_out_d_8_port, d_in_d(7) => d_out_d_7_port, 
                           d_in_d(6) => d_out_d_6_port, d_in_d(5) => 
                           d_out_d_5_port, d_in_d(4) => d_out_d_4_port, 
                           d_in_d(3) => d_out_d_3_port, d_in_d(2) => 
                           d_out_d_2_port, d_in_d(1) => d_out_d_1_port, 
                           d_in_d(0) => d_out_d_0_port, d_out(11) => 
                           D_OUT_2(11), d_out(10) => D_OUT_2(10), d_out(9) => 
                           D_OUT_2(9), d_out(8) => D_OUT_2(8), d_out(7) => 
                           D_OUT_2(7), d_out(6) => D_OUT_2(6), d_out(5) => 
                           D_OUT_2(5), d_out(4) => D_OUT_2(4), d_out(3) => 
                           D_OUT_2(3), d_out(2) => D_OUT_2(2), d_out(1) => 
                           D_OUT_2(1), d_out(0) => D_OUT_2(0));
   reg1 : reg_N12_4 port map( D_IN(11) => RF_IN(11), D_IN(10) => RF_IN(10), 
                           D_IN(9) => RF_IN(9), D_IN(8) => RF_IN(8), D_IN(7) =>
                           RF_IN(7), D_IN(6) => RF_IN(6), D_IN(5) => RF_IN(5), 
                           D_IN(4) => RF_IN(4), D_IN(3) => RF_IN(3), D_IN(2) =>
                           RF_IN(2), D_IN(1) => RF_IN(1), D_IN(0) => RF_IN(0), 
                           RST => rst, ENABLE => en_a, CLK => clk, Q_OUT(11) =>
                           d_out_a_11_port, Q_OUT(10) => d_out_a_10_port, 
                           Q_OUT(9) => d_out_a_9_port, Q_OUT(8) => 
                           d_out_a_8_port, Q_OUT(7) => d_out_a_7_port, Q_OUT(6)
                           => d_out_a_6_port, Q_OUT(5) => d_out_a_5_port, 
                           Q_OUT(4) => d_out_a_4_port, Q_OUT(3) => 
                           d_out_a_3_port, Q_OUT(2) => d_out_a_2_port, Q_OUT(1)
                           => d_out_a_1_port, Q_OUT(0) => d_out_a_0_port);
   reg2 : reg_N12_3 port map( D_IN(11) => RF_IN(11), D_IN(10) => RF_IN(10), 
                           D_IN(9) => RF_IN(9), D_IN(8) => RF_IN(8), D_IN(7) =>
                           RF_IN(7), D_IN(6) => RF_IN(6), D_IN(5) => RF_IN(5), 
                           D_IN(4) => RF_IN(4), D_IN(3) => RF_IN(3), D_IN(2) =>
                           RF_IN(2), D_IN(1) => RF_IN(1), D_IN(0) => RF_IN(0), 
                           RST => rst, ENABLE => en_b, CLK => clk, Q_OUT(11) =>
                           d_out_b_11_port, Q_OUT(10) => d_out_b_10_port, 
                           Q_OUT(9) => d_out_b_9_port, Q_OUT(8) => 
                           d_out_b_8_port, Q_OUT(7) => d_out_b_7_port, Q_OUT(6)
                           => d_out_b_6_port, Q_OUT(5) => d_out_b_5_port, 
                           Q_OUT(4) => d_out_b_4_port, Q_OUT(3) => 
                           d_out_b_3_port, Q_OUT(2) => d_out_b_2_port, Q_OUT(1)
                           => d_out_b_1_port, Q_OUT(0) => d_out_b_0_port);
   reg3 : reg_N12_2 port map( D_IN(11) => RF_IN(11), D_IN(10) => RF_IN(10), 
                           D_IN(9) => RF_IN(9), D_IN(8) => RF_IN(8), D_IN(7) =>
                           RF_IN(7), D_IN(6) => RF_IN(6), D_IN(5) => RF_IN(5), 
                           D_IN(4) => RF_IN(4), D_IN(3) => RF_IN(3), D_IN(2) =>
                           RF_IN(2), D_IN(1) => RF_IN(1), D_IN(0) => RF_IN(0), 
                           RST => rst, ENABLE => en_c, CLK => clk, Q_OUT(11) =>
                           d_out_c_11_port, Q_OUT(10) => d_out_c_10_port, 
                           Q_OUT(9) => d_out_c_9_port, Q_OUT(8) => 
                           d_out_c_8_port, Q_OUT(7) => d_out_c_7_port, Q_OUT(6)
                           => d_out_c_6_port, Q_OUT(5) => d_out_c_5_port, 
                           Q_OUT(4) => d_out_c_4_port, Q_OUT(3) => 
                           d_out_c_3_port, Q_OUT(2) => d_out_c_2_port, Q_OUT(1)
                           => d_out_c_1_port, Q_OUT(0) => d_out_c_0_port);
   reg4 : reg_N12_1 port map( D_IN(11) => RF_IN(11), D_IN(10) => RF_IN(10), 
                           D_IN(9) => RF_IN(9), D_IN(8) => RF_IN(8), D_IN(7) =>
                           RF_IN(7), D_IN(6) => RF_IN(6), D_IN(5) => RF_IN(5), 
                           D_IN(4) => RF_IN(4), D_IN(3) => RF_IN(3), D_IN(2) =>
                           RF_IN(2), D_IN(1) => RF_IN(1), D_IN(0) => RF_IN(0), 
                           RST => rst, ENABLE => en_d, CLK => clk, Q_OUT(11) =>
                           d_out_d_11_port, Q_OUT(10) => d_out_d_10_port, 
                           Q_OUT(9) => d_out_d_9_port, Q_OUT(8) => 
                           d_out_d_8_port, Q_OUT(7) => d_out_d_7_port, Q_OUT(6)
                           => d_out_d_6_port, Q_OUT(5) => d_out_d_5_port, 
                           Q_OUT(4) => d_out_d_4_port, Q_OUT(3) => 
                           d_out_d_3_port, Q_OUT(2) => d_out_d_2_port, Q_OUT(1)
                           => d_out_d_1_port, Q_OUT(0) => d_out_d_0_port);
   demux_enab : demux1_1x4 port map( select_input(1) => SEL_in(1), 
                           select_input(0) => SEL_in(0), d_in => enab, d_out_a 
                           => en_a, d_out_b => en_b, d_out_c => en_c, d_out_d 
                           => en_d);

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity ALU is

   port( O1, O2 : in std_logic_vector (11 downto 0);  Flags_in : in 
         std_logic_vector (3 downto 0);  Operation : in std_logic_vector (5 
         downto 0);  Result : out std_logic_vector (11 downto 0);  Flags_out : 
         out std_logic_vector (3 downto 0));

end ALU;

architecture SYN_RTL of ALU is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component OA21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component AOI21X1
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component OR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component mux4_4x1
      port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
            d_in_c, d_in_d : in std_logic_vector (3 downto 0);  d_out : out 
            std_logic_vector (3 downto 0));
   end component;
   
   component mux12_4x1_1
      port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
            d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
            std_logic_vector (11 downto 0));
   end component;
   
   component adder
      port( opcode : in std_logic_vector (5 downto 0);  flags_in : in 
            std_logic_vector (3 downto 0);  op1, op2 : in std_logic_vector (11 
            downto 0);  flags_out : out std_logic_vector (3 downto 0);  re : 
            out std_logic_vector (11 downto 0));
   end component;
   
   component shifter
      port( OPCode : in std_logic_vector (5 downto 0);  Flagsin : in 
            std_logic_vector (3 downto 0);  Flagsout : out std_logic_vector (3 
            downto 0);  OP1, OP2 : in std_logic_vector (11 downto 0);  result :
            out std_logic_vector (11 downto 0));
   end component;
   
   component LogicUnit
      port( O1, O2 : in std_logic_vector (11 downto 0);  Operation : in 
            std_logic_vector (5 downto 0);  Result : out std_logic_vector (11 
            downto 0);  FlagsOut : out std_logic_vector (3 downto 0));
   end component;
   
   signal X_Logic0_port, LU_Res_out_11_port, LU_Res_out_10_port, 
      LU_Res_out_9_port, LU_Res_out_8_port, LU_Res_out_7_port, 
      LU_Res_out_6_port, LU_Res_out_5_port, LU_Res_out_4_port, 
      LU_Res_out_3_port, LU_Res_out_2_port, LU_Res_out_1_port, 
      LU_Res_out_0_port, LU_Flags_out_3_port, LU_Flags_out_2_port, 
      LU_Flags_out_1_port, LU_Flags_out_0_port, SH_Flags_out_3_port, 
      SH_Flags_out_2_port, SH_Flags_out_1_port, SH_Flags_out_0_port, 
      SH_Res_out_11_port, SH_Res_out_10_port, SH_Res_out_9_port, 
      SH_Res_out_8_port, SH_Res_out_7_port, SH_Res_out_6_port, 
      SH_Res_out_5_port, SH_Res_out_4_port, SH_Res_out_3_port, 
      SH_Res_out_2_port, SH_Res_out_1_port, SH_Res_out_0_port, 
      AD_Flags_out_3_port, AD_Flags_out_2_port, AD_Flags_out_1_port, 
      AD_Flags_out_0_port, AD_Res_out_11_port, AD_Res_out_10_port, 
      AD_Res_out_9_port, AD_Res_out_8_port, AD_Res_out_7_port, 
      AD_Res_out_6_port, AD_Res_out_5_port, AD_Res_out_4_port, 
      AD_Res_out_3_port, AD_Res_out_2_port, AD_Res_out_1_port, 
      AD_Res_out_0_port, select_it_1_port, select_it_0_port, n1, n2, n3, n4, n5
      , n6, n7, n8, n9, n10, n11 : std_logic;

begin
   
   LU : LogicUnit port map( O1(11) => O1(11), O1(10) => O1(10), O1(9) => O1(9),
                           O1(8) => O1(8), O1(7) => O1(7), O1(6) => O1(6), 
                           O1(5) => O1(5), O1(4) => O1(4), O1(3) => O1(3), 
                           O1(2) => O1(2), O1(1) => O1(1), O1(0) => O1(0), 
                           O2(11) => O2(11), O2(10) => O2(10), O2(9) => O2(9), 
                           O2(8) => O2(8), O2(7) => O2(7), O2(6) => O2(6), 
                           O2(5) => O2(5), O2(4) => O2(4), O2(3) => O2(3), 
                           O2(2) => O2(2), O2(1) => O2(1), O2(0) => O2(0), 
                           Operation(5) => Operation(5), Operation(4) => 
                           Operation(4), Operation(3) => Operation(3), 
                           Operation(2) => Operation(2), Operation(1) => 
                           Operation(1), Operation(0) => Operation(0), 
                           Result(11) => LU_Res_out_11_port, Result(10) => 
                           LU_Res_out_10_port, Result(9) => LU_Res_out_9_port, 
                           Result(8) => LU_Res_out_8_port, Result(7) => 
                           LU_Res_out_7_port, Result(6) => LU_Res_out_6_port, 
                           Result(5) => LU_Res_out_5_port, Result(4) => 
                           LU_Res_out_4_port, Result(3) => LU_Res_out_3_port, 
                           Result(2) => LU_Res_out_2_port, Result(1) => 
                           LU_Res_out_1_port, Result(0) => LU_Res_out_0_port, 
                           FlagsOut(3) => LU_Flags_out_3_port, FlagsOut(2) => 
                           LU_Flags_out_2_port, FlagsOut(1) => 
                           LU_Flags_out_1_port, FlagsOut(0) => 
                           LU_Flags_out_0_port);
   SH : shifter port map( OPCode(5) => Operation(5), OPCode(4) => Operation(4),
                           OPCode(3) => Operation(3), OPCode(2) => Operation(2)
                           , OPCode(1) => Operation(1), OPCode(0) => 
                           Operation(0), Flagsin(3) => Flags_in(3), Flagsin(2) 
                           => Flags_in(2), Flagsin(1) => Flags_in(1), 
                           Flagsin(0) => Flags_in(0), Flagsout(3) => 
                           SH_Flags_out_3_port, Flagsout(2) => 
                           SH_Flags_out_2_port, Flagsout(1) => 
                           SH_Flags_out_1_port, Flagsout(0) => 
                           SH_Flags_out_0_port, OP1(11) => O1(11), OP1(10) => 
                           O1(10), OP1(9) => O1(9), OP1(8) => O1(8), OP1(7) => 
                           O1(7), OP1(6) => O1(6), OP1(5) => O1(5), OP1(4) => 
                           O1(4), OP1(3) => O1(3), OP1(2) => O1(2), OP1(1) => 
                           O1(1), OP1(0) => O1(0), OP2(11) => O2(11), OP2(10) 
                           => O2(10), OP2(9) => O2(9), OP2(8) => O2(8), OP2(7) 
                           => O2(7), OP2(6) => O2(6), OP2(5) => O2(5), OP2(4) 
                           => O2(4), OP2(3) => O2(3), OP2(2) => O2(2), OP2(1) 
                           => O2(1), OP2(0) => O2(0), result(11) => 
                           SH_Res_out_11_port, result(10) => SH_Res_out_10_port
                           , result(9) => SH_Res_out_9_port, result(8) => 
                           SH_Res_out_8_port, result(7) => SH_Res_out_7_port, 
                           result(6) => SH_Res_out_6_port, result(5) => 
                           SH_Res_out_5_port, result(4) => SH_Res_out_4_port, 
                           result(3) => SH_Res_out_3_port, result(2) => 
                           SH_Res_out_2_port, result(1) => SH_Res_out_1_port, 
                           result(0) => SH_Res_out_0_port);
   AD : adder port map( opcode(5) => Operation(5), opcode(4) => Operation(4), 
                           opcode(3) => Operation(3), opcode(2) => Operation(2)
                           , opcode(1) => Operation(1), opcode(0) => 
                           Operation(0), flags_in(3) => Flags_in(3), 
                           flags_in(2) => Flags_in(2), flags_in(1) => 
                           Flags_in(1), flags_in(0) => Flags_in(0), op1(11) => 
                           O1(11), op1(10) => O1(10), op1(9) => O1(9), op1(8) 
                           => O1(8), op1(7) => O1(7), op1(6) => O1(6), op1(5) 
                           => O1(5), op1(4) => O1(4), op1(3) => O1(3), op1(2) 
                           => O1(2), op1(1) => O1(1), op1(0) => O1(0), op2(11) 
                           => O2(11), op2(10) => O2(10), op2(9) => O2(9), 
                           op2(8) => O2(8), op2(7) => O2(7), op2(6) => O2(6), 
                           op2(5) => O2(5), op2(4) => O2(4), op2(3) => O2(3), 
                           op2(2) => O2(2), op2(1) => O2(1), op2(0) => O2(0), 
                           flags_out(3) => AD_Flags_out_3_port, flags_out(2) =>
                           AD_Flags_out_2_port, flags_out(1) => 
                           AD_Flags_out_1_port, flags_out(0) => 
                           AD_Flags_out_0_port, re(11) => AD_Res_out_11_port, 
                           re(10) => AD_Res_out_10_port, re(9) => 
                           AD_Res_out_9_port, re(8) => AD_Res_out_8_port, re(7)
                           => AD_Res_out_7_port, re(6) => AD_Res_out_6_port, 
                           re(5) => AD_Res_out_5_port, re(4) => 
                           AD_Res_out_4_port, re(3) => AD_Res_out_3_port, re(2)
                           => AD_Res_out_2_port, re(1) => AD_Res_out_1_port, 
                           re(0) => AD_Res_out_0_port);
   mux1 : mux12_4x1_1 port map( select_input(1) => select_it_1_port, 
                           select_input(0) => select_it_0_port, d_in_a(11) => 
                           X_Logic0_port, d_in_a(10) => X_Logic0_port, 
                           d_in_a(9) => X_Logic0_port, d_in_a(8) => 
                           X_Logic0_port, d_in_a(7) => X_Logic0_port, d_in_a(6)
                           => X_Logic0_port, d_in_a(5) => X_Logic0_port, 
                           d_in_a(4) => X_Logic0_port, d_in_a(3) => 
                           X_Logic0_port, d_in_a(2) => X_Logic0_port, d_in_a(1)
                           => X_Logic0_port, d_in_a(0) => X_Logic0_port, 
                           d_in_b(11) => AD_Res_out_11_port, d_in_b(10) => 
                           AD_Res_out_10_port, d_in_b(9) => AD_Res_out_9_port, 
                           d_in_b(8) => AD_Res_out_8_port, d_in_b(7) => 
                           AD_Res_out_7_port, d_in_b(6) => AD_Res_out_6_port, 
                           d_in_b(5) => AD_Res_out_5_port, d_in_b(4) => 
                           AD_Res_out_4_port, d_in_b(3) => AD_Res_out_3_port, 
                           d_in_b(2) => AD_Res_out_2_port, d_in_b(1) => 
                           AD_Res_out_1_port, d_in_b(0) => AD_Res_out_0_port, 
                           d_in_c(11) => LU_Res_out_11_port, d_in_c(10) => 
                           LU_Res_out_10_port, d_in_c(9) => LU_Res_out_9_port, 
                           d_in_c(8) => LU_Res_out_8_port, d_in_c(7) => 
                           LU_Res_out_7_port, d_in_c(6) => LU_Res_out_6_port, 
                           d_in_c(5) => LU_Res_out_5_port, d_in_c(4) => 
                           LU_Res_out_4_port, d_in_c(3) => LU_Res_out_3_port, 
                           d_in_c(2) => LU_Res_out_2_port, d_in_c(1) => 
                           LU_Res_out_1_port, d_in_c(0) => LU_Res_out_0_port, 
                           d_in_d(11) => SH_Res_out_11_port, d_in_d(10) => 
                           SH_Res_out_10_port, d_in_d(9) => SH_Res_out_9_port, 
                           d_in_d(8) => SH_Res_out_8_port, d_in_d(7) => 
                           SH_Res_out_7_port, d_in_d(6) => SH_Res_out_6_port, 
                           d_in_d(5) => SH_Res_out_5_port, d_in_d(4) => 
                           SH_Res_out_4_port, d_in_d(3) => SH_Res_out_3_port, 
                           d_in_d(2) => SH_Res_out_2_port, d_in_d(1) => 
                           SH_Res_out_1_port, d_in_d(0) => SH_Res_out_0_port, 
                           d_out(11) => Result(11), d_out(10) => Result(10), 
                           d_out(9) => Result(9), d_out(8) => Result(8), 
                           d_out(7) => Result(7), d_out(6) => Result(6), 
                           d_out(5) => Result(5), d_out(4) => Result(4), 
                           d_out(3) => Result(3), d_out(2) => Result(2), 
                           d_out(1) => Result(1), d_out(0) => Result(0));
   mux2 : mux4_4x1 port map( select_input(1) => select_it_1_port, 
                           select_input(0) => select_it_0_port, d_in_a(3) => 
                           X_Logic0_port, d_in_a(2) => X_Logic0_port, d_in_a(1)
                           => X_Logic0_port, d_in_a(0) => X_Logic0_port, 
                           d_in_b(3) => AD_Flags_out_3_port, d_in_b(2) => 
                           AD_Flags_out_2_port, d_in_b(1) => 
                           AD_Flags_out_1_port, d_in_b(0) => 
                           AD_Flags_out_0_port, d_in_c(3) => n1, d_in_c(2) => 
                           n1, d_in_c(1) => n1, d_in_c(0) => n1, d_in_d(3) => 
                           SH_Flags_out_3_port, d_in_d(2) => 
                           SH_Flags_out_2_port, d_in_d(1) => 
                           SH_Flags_out_1_port, d_in_d(0) => 
                           SH_Flags_out_0_port, d_out(3) => Flags_out(3), 
                           d_out(2) => Flags_out(2), d_out(1) => Flags_out(1), 
                           d_out(0) => Flags_out(0));
   X_Logic0_port <= '0';
   n1 <= '0';
   U3 : NOR2X0 port map( IN1 => Operation(5), IN2 => n2, QN => select_it_1_port
                           );
   U4 : MUX21X1 port map( IN1 => n3, IN2 => n4, S => Operation(4), Q => n2);
   U5 : OR2X1 port map( IN1 => Operation(2), IN2 => Operation(3), Q => n4);
   U6 : AOI21X1 port map( IN1 => Operation(1), IN2 => Operation(2), IN3 => 
                           Operation(3), QN => n3);
   U7 : NOR2X0 port map( IN1 => n5, IN2 => Operation(5), QN => select_it_0_port
                           );
   U8 : INVX0 port map( INP => n6, ZN => n5);
   U9 : MUX21X1 port map( IN1 => n7, IN2 => n8, S => Operation(2), Q => n6);
   U10 : NOR2X0 port map( IN1 => Operation(4), IN2 => n9, QN => n8);
   U11 : MUX21X1 port map( IN1 => n10, IN2 => n11, S => Operation(1), Q => n9);
   U12 : NOR2X0 port map( IN1 => Operation(0), IN2 => n11, QN => n10);
   U13 : OA21X1 port map( IN1 => Operation(1), IN2 => Operation(4), IN3 => n11,
                           Q => n7);
   U14 : INVX0 port map( INP => Operation(3), ZN => n11);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity flags is

   port( clk, rst, enab : in std_logic;  Flags_in : in std_logic_vector (3 
         downto 0);  Flags_out : out std_logic_vector (3 downto 0));

end flags;

architecture SYN_behav of flags is

   component reg_N4
      port( D_IN : in std_logic_vector (3 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (3 downto 0));
   end component;

begin
   
   flags : reg_N4 port map( D_IN(3) => Flags_in(3), D_IN(2) => Flags_in(2), 
                           D_IN(1) => Flags_in(1), D_IN(0) => Flags_in(0), RST 
                           => rst, ENABLE => enab, CLK => clk, Q_OUT(3) => 
                           Flags_out(3), Q_OUT(2) => Flags_out(2), Q_OUT(1) => 
                           Flags_out(1), Q_OUT(0) => Flags_out(0));

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity flag_check is

   port( fc_sel : in std_logic;  flag_in : in std_logic_vector (3 downto 0);  
         alu_res, d_in : in std_logic_vector (11 downto 0);  flag_out : out 
         std_logic_vector (3 downto 0);  RF_IN : out std_logic_vector (11 
         downto 0));

end flag_check;

architecture SYN_behav of flag_check is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component OR3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component OR4X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   signal flag_out_3_port, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10 : std_logic;

begin
   flag_out <= ( flag_out_3_port, flag_in(2), flag_in(1), flag_in(0) );
   
   U1 : MUX21X1 port map( IN1 => n1, IN2 => n2, S => fc_sel, Q => 
                           flag_out_3_port);
   U2 : NOR2X0 port map( IN1 => n3, IN2 => n4, QN => n2);
   U3 : OR4X1 port map( IN1 => d_in(10), IN2 => d_in(11), IN3 => d_in(0), IN4 
                           => n5, Q => n4);
   U4 : OR3X1 port map( IN1 => d_in(1), IN2 => d_in(3), IN3 => d_in(2), Q => n5
                           );
   U5 : OR4X1 port map( IN1 => d_in(5), IN2 => d_in(6), IN3 => d_in(4), IN4 => 
                           n6, Q => n3);
   U6 : OR3X1 port map( IN1 => d_in(7), IN2 => d_in(9), IN3 => d_in(8), Q => n6
                           );
   U7 : NOR2X0 port map( IN1 => n7, IN2 => n8, QN => n1);
   U8 : OR4X1 port map( IN1 => alu_res(10), IN2 => alu_res(11), IN3 => 
                           alu_res(0), IN4 => n9, Q => n8);
   U9 : OR3X1 port map( IN1 => alu_res(1), IN2 => alu_res(3), IN3 => alu_res(2)
                           , Q => n9);
   U10 : OR4X1 port map( IN1 => alu_res(5), IN2 => alu_res(6), IN3 => 
                           alu_res(4), IN4 => n10, Q => n7);
   U11 : OR3X1 port map( IN1 => alu_res(7), IN2 => alu_res(9), IN3 => 
                           alu_res(8), Q => n10);
   U12 : MUX21X1 port map( IN1 => alu_res(9), IN2 => d_in(9), S => fc_sel, Q =>
                           RF_IN(9));
   U13 : MUX21X1 port map( IN1 => alu_res(8), IN2 => d_in(8), S => fc_sel, Q =>
                           RF_IN(8));
   U14 : MUX21X1 port map( IN1 => alu_res(7), IN2 => d_in(7), S => fc_sel, Q =>
                           RF_IN(7));
   U15 : MUX21X1 port map( IN1 => alu_res(6), IN2 => d_in(6), S => fc_sel, Q =>
                           RF_IN(6));
   U16 : MUX21X1 port map( IN1 => alu_res(5), IN2 => d_in(5), S => fc_sel, Q =>
                           RF_IN(5));
   U17 : MUX21X1 port map( IN1 => alu_res(4), IN2 => d_in(4), S => fc_sel, Q =>
                           RF_IN(4));
   U18 : MUX21X1 port map( IN1 => alu_res(3), IN2 => d_in(3), S => fc_sel, Q =>
                           RF_IN(3));
   U19 : MUX21X1 port map( IN1 => alu_res(2), IN2 => d_in(2), S => fc_sel, Q =>
                           RF_IN(2));
   U20 : MUX21X1 port map( IN1 => alu_res(1), IN2 => d_in(1), S => fc_sel, Q =>
                           RF_IN(1));
   U21 : MUX21X1 port map( IN1 => alu_res(11), IN2 => d_in(11), S => fc_sel, Q 
                           => RF_IN(11));
   U22 : MUX21X1 port map( IN1 => alu_res(10), IN2 => d_in(10), S => fc_sel, Q 
                           => RF_IN(10));
   U23 : MUX21X1 port map( IN1 => alu_res(0), IN2 => d_in(0), S => fc_sel, Q =>
                           RF_IN(0));

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity reg_N12_0 is

   port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
         std_logic;  Q_OUT : out std_logic_vector (11 downto 0));

end reg_N12_0;

architecture SYN_RTL of reg_N12_0 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port, n2, n3, n4, n5, n6, n7, n8, n9,
      n10, n11, n12, n13, n_1104, n_1105, n_1106, n_1107, n_1108, n_1109, 
      n_1110, n_1111, n_1112, n_1113, n_1114, n_1115 : std_logic;

begin
   Q_OUT <= ( Q_OUT_11_port, Q_OUT_10_port, Q_OUT_9_port, Q_OUT_8_port, 
      Q_OUT_7_port, Q_OUT_6_port, Q_OUT_5_port, Q_OUT_4_port, Q_OUT_3_port, 
      Q_OUT_2_port, Q_OUT_1_port, Q_OUT_0_port );
   
   Q_OUT_reg_11_inst : DFFARX1 port map( D => n13, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_11_port, QN => n_1104);
   Q_OUT_reg_10_inst : DFFARX1 port map( D => n12, CLK => CLK, RSTB => RST, Q 
                           => Q_OUT_10_port, QN => n_1105);
   Q_OUT_reg_9_inst : DFFARX1 port map( D => n11, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_9_port, QN => n_1106);
   Q_OUT_reg_8_inst : DFFARX1 port map( D => n10, CLK => CLK, RSTB => RST, Q =>
                           Q_OUT_8_port, QN => n_1107);
   Q_OUT_reg_7_inst : DFFARX1 port map( D => n9, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_7_port, QN => n_1108);
   Q_OUT_reg_6_inst : DFFARX1 port map( D => n8, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_6_port, QN => n_1109);
   Q_OUT_reg_5_inst : DFFARX1 port map( D => n7, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_5_port, QN => n_1110);
   Q_OUT_reg_4_inst : DFFARX1 port map( D => n6, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_4_port, QN => n_1111);
   Q_OUT_reg_3_inst : DFFARX1 port map( D => n5, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_3_port, QN => n_1112);
   Q_OUT_reg_2_inst : DFFARX1 port map( D => n4, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_2_port, QN => n_1113);
   Q_OUT_reg_1_inst : DFFARX1 port map( D => n3, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_1_port, QN => n_1114);
   Q_OUT_reg_0_inst : DFFARX1 port map( D => n2, CLK => CLK, RSTB => RST, Q => 
                           Q_OUT_0_port, QN => n_1115);
   U2 : MUX21X1 port map( IN1 => Q_OUT_7_port, IN2 => D_IN(7), S => ENABLE, Q 
                           => n9);
   U3 : MUX21X1 port map( IN1 => Q_OUT_6_port, IN2 => D_IN(6), S => ENABLE, Q 
                           => n8);
   U4 : MUX21X1 port map( IN1 => Q_OUT_5_port, IN2 => D_IN(5), S => ENABLE, Q 
                           => n7);
   U5 : MUX21X1 port map( IN1 => Q_OUT_4_port, IN2 => D_IN(4), S => ENABLE, Q 
                           => n6);
   U6 : MUX21X1 port map( IN1 => Q_OUT_3_port, IN2 => D_IN(3), S => ENABLE, Q 
                           => n5);
   U7 : MUX21X1 port map( IN1 => Q_OUT_2_port, IN2 => D_IN(2), S => ENABLE, Q 
                           => n4);
   U8 : MUX21X1 port map( IN1 => Q_OUT_1_port, IN2 => D_IN(1), S => ENABLE, Q 
                           => n3);
   U9 : MUX21X1 port map( IN1 => Q_OUT_0_port, IN2 => D_IN(0), S => ENABLE, Q 
                           => n2);
   U10 : MUX21X1 port map( IN1 => Q_OUT_11_port, IN2 => D_IN(11), S => ENABLE, 
                           Q => n13);
   U11 : MUX21X1 port map( IN1 => Q_OUT_10_port, IN2 => D_IN(10), S => ENABLE, 
                           Q => n12);
   U12 : MUX21X1 port map( IN1 => Q_OUT_9_port, IN2 => D_IN(9), S => ENABLE, Q 
                           => n11);
   U13 : MUX21X1 port map( IN1 => Q_OUT_8_port, IN2 => D_IN(8), S => ENABLE, Q 
                           => n10);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity datapath is

   port( CLK, RST : in std_logic;  D_OUT_1, D_OUT_2 : out std_logic_vector (11 
         downto 0);  FLAGS_port : out std_logic_vector (3 downto 0);  D_IN : in
         std_logic_vector (11 downto 0);  FC_SEL, REG_EN : in std_logic;  OP : 
         in std_logic_vector (5 downto 0);  SEL_IN, SEL_OUT_A, SEL_OUT_B, 
         SEL_OUT_C : in std_logic_vector (1 downto 0));

end datapath;

architecture SYN_RTL of datapath is

   component reg_file
      port( clk, rst, enab : in std_logic;  SEL_in, SEL_out_A, SEL_out_B, 
            SEL_out_C : in std_logic_vector (1 downto 0);  RF_IN : in 
            std_logic_vector (11 downto 0);  ALU_IN, D_OUT_1, D_OUT_2 : out 
            std_logic_vector (11 downto 0));
   end component;
   
   component ALU
      port( O1, O2 : in std_logic_vector (11 downto 0);  Flags_in : in 
            std_logic_vector (3 downto 0);  Operation : in std_logic_vector (5 
            downto 0);  Result : out std_logic_vector (11 downto 0);  Flags_out
            : out std_logic_vector (3 downto 0));
   end component;
   
   component flags
      port( clk, rst, enab : in std_logic;  Flags_in : in std_logic_vector (3 
            downto 0);  Flags_out : out std_logic_vector (3 downto 0));
   end component;
   
   component flag_check
      port( fc_sel : in std_logic;  flag_in : in std_logic_vector (3 downto 0);
            alu_res, d_in : in std_logic_vector (11 downto 0);  flag_out : out 
            std_logic_vector (3 downto 0);  RF_IN : out std_logic_vector (11 
            downto 0));
   end component;
   
   signal D_OUT_2_11_port, D_OUT_2_10_port, D_OUT_2_9_port, D_OUT_2_8_port, 
      D_OUT_2_7_port, D_OUT_2_6_port, D_OUT_2_5_port, D_OUT_2_4_port, 
      D_OUT_2_3_port, D_OUT_2_2_port, D_OUT_2_1_port, D_OUT_2_0_port, 
      FLAGS_3_port, FLAGS_2_port, FLAGS_1_port, FLAGS_0_port, 
      flags_AL_FC_3_port, flags_AL_FC_2_port, flags_AL_FC_1_port, 
      flags_AL_FC_0_port, result_AL_FC_11_port, result_AL_FC_10_port, 
      result_AL_FC_9_port, result_AL_FC_8_port, result_AL_FC_7_port, 
      result_AL_FC_6_port, result_AL_FC_5_port, result_AL_FC_4_port, 
      result_AL_FC_3_port, result_AL_FC_2_port, result_AL_FC_1_port, 
      result_AL_FC_0_port, flags_FC_FL_3_port, flags_FC_FL_2_port, 
      flags_FC_FL_1_port, flags_FC_FL_0_port, result_FC_RF_11_port, 
      result_FC_RF_10_port, result_FC_RF_9_port, result_FC_RF_8_port, 
      result_FC_RF_7_port, result_FC_RF_6_port, result_FC_RF_5_port, 
      result_FC_RF_4_port, result_FC_RF_3_port, result_FC_RF_2_port, 
      result_FC_RF_1_port, result_FC_RF_0_port, O1_RF_AL_11_port, 
      O1_RF_AL_10_port, O1_RF_AL_9_port, O1_RF_AL_8_port, O1_RF_AL_7_port, 
      O1_RF_AL_6_port, O1_RF_AL_5_port, O1_RF_AL_4_port, O1_RF_AL_3_port, 
      O1_RF_AL_2_port, O1_RF_AL_1_port, O1_RF_AL_0_port : std_logic;

begin
   D_OUT_2 <= ( D_OUT_2_11_port, D_OUT_2_10_port, D_OUT_2_9_port, 
      D_OUT_2_8_port, D_OUT_2_7_port, D_OUT_2_6_port, D_OUT_2_5_port, 
      D_OUT_2_4_port, D_OUT_2_3_port, D_OUT_2_2_port, D_OUT_2_1_port, 
      D_OUT_2_0_port );
   FLAGS_port <= ( FLAGS_3_port, FLAGS_2_port, FLAGS_1_port, FLAGS_0_port );
   
   FC : flag_check port map( fc_sel => FC_SEL, flag_in(3) => flags_AL_FC_3_port
                           , flag_in(2) => flags_AL_FC_2_port, flag_in(1) => 
                           flags_AL_FC_1_port, flag_in(0) => flags_AL_FC_0_port
                           , alu_res(11) => result_AL_FC_11_port, alu_res(10) 
                           => result_AL_FC_10_port, alu_res(9) => 
                           result_AL_FC_9_port, alu_res(8) => 
                           result_AL_FC_8_port, alu_res(7) => 
                           result_AL_FC_7_port, alu_res(6) => 
                           result_AL_FC_6_port, alu_res(5) => 
                           result_AL_FC_5_port, alu_res(4) => 
                           result_AL_FC_4_port, alu_res(3) => 
                           result_AL_FC_3_port, alu_res(2) => 
                           result_AL_FC_2_port, alu_res(1) => 
                           result_AL_FC_1_port, alu_res(0) => 
                           result_AL_FC_0_port, d_in(11) => D_IN(11), d_in(10) 
                           => D_IN(10), d_in(9) => D_IN(9), d_in(8) => D_IN(8),
                           d_in(7) => D_IN(7), d_in(6) => D_IN(6), d_in(5) => 
                           D_IN(5), d_in(4) => D_IN(4), d_in(3) => D_IN(3), 
                           d_in(2) => D_IN(2), d_in(1) => D_IN(1), d_in(0) => 
                           D_IN(0), flag_out(3) => flags_FC_FL_3_port, 
                           flag_out(2) => flags_FC_FL_2_port, flag_out(1) => 
                           flags_FC_FL_1_port, flag_out(0) => 
                           flags_FC_FL_0_port, RF_IN(11) => 
                           result_FC_RF_11_port, RF_IN(10) => 
                           result_FC_RF_10_port, RF_IN(9) => 
                           result_FC_RF_9_port, RF_IN(8) => result_FC_RF_8_port
                           , RF_IN(7) => result_FC_RF_7_port, RF_IN(6) => 
                           result_FC_RF_6_port, RF_IN(5) => result_FC_RF_5_port
                           , RF_IN(4) => result_FC_RF_4_port, RF_IN(3) => 
                           result_FC_RF_3_port, RF_IN(2) => result_FC_RF_2_port
                           , RF_IN(1) => result_FC_RF_1_port, RF_IN(0) => 
                           result_FC_RF_0_port);
   FL : flags port map( clk => CLK, rst => RST, enab => REG_EN, Flags_in(3) => 
                           flags_FC_FL_3_port, Flags_in(2) => 
                           flags_FC_FL_2_port, Flags_in(1) => 
                           flags_FC_FL_1_port, Flags_in(0) => 
                           flags_FC_FL_0_port, Flags_out(3) => FLAGS_3_port, 
                           Flags_out(2) => FLAGS_2_port, Flags_out(1) => 
                           FLAGS_1_port, Flags_out(0) => FLAGS_0_port);
   AL : ALU port map( O1(11) => O1_RF_AL_11_port, O1(10) => O1_RF_AL_10_port, 
                           O1(9) => O1_RF_AL_9_port, O1(8) => O1_RF_AL_8_port, 
                           O1(7) => O1_RF_AL_7_port, O1(6) => O1_RF_AL_6_port, 
                           O1(5) => O1_RF_AL_5_port, O1(4) => O1_RF_AL_4_port, 
                           O1(3) => O1_RF_AL_3_port, O1(2) => O1_RF_AL_2_port, 
                           O1(1) => O1_RF_AL_1_port, O1(0) => O1_RF_AL_0_port, 
                           O2(11) => D_OUT_2_11_port, O2(10) => D_OUT_2_10_port
                           , O2(9) => D_OUT_2_9_port, O2(8) => D_OUT_2_8_port, 
                           O2(7) => D_OUT_2_7_port, O2(6) => D_OUT_2_6_port, 
                           O2(5) => D_OUT_2_5_port, O2(4) => D_OUT_2_4_port, 
                           O2(3) => D_OUT_2_3_port, O2(2) => D_OUT_2_2_port, 
                           O2(1) => D_OUT_2_1_port, O2(0) => D_OUT_2_0_port, 
                           Flags_in(3) => FLAGS_3_port, Flags_in(2) => 
                           FLAGS_2_port, Flags_in(1) => FLAGS_1_port, 
                           Flags_in(0) => FLAGS_0_port, Operation(5) => OP(5), 
                           Operation(4) => OP(4), Operation(3) => OP(3), 
                           Operation(2) => OP(2), Operation(1) => OP(1), 
                           Operation(0) => OP(0), Result(11) => 
                           result_AL_FC_11_port, Result(10) => 
                           result_AL_FC_10_port, Result(9) => 
                           result_AL_FC_9_port, Result(8) => 
                           result_AL_FC_8_port, Result(7) => 
                           result_AL_FC_7_port, Result(6) => 
                           result_AL_FC_6_port, Result(5) => 
                           result_AL_FC_5_port, Result(4) => 
                           result_AL_FC_4_port, Result(3) => 
                           result_AL_FC_3_port, Result(2) => 
                           result_AL_FC_2_port, Result(1) => 
                           result_AL_FC_1_port, Result(0) => 
                           result_AL_FC_0_port, Flags_out(3) => 
                           flags_AL_FC_3_port, Flags_out(2) => 
                           flags_AL_FC_2_port, Flags_out(1) => 
                           flags_AL_FC_1_port, Flags_out(0) => 
                           flags_AL_FC_0_port);
   RF : reg_file port map( clk => CLK, rst => RST, enab => REG_EN, SEL_in(1) =>
                           SEL_IN(1), SEL_in(0) => SEL_IN(0), SEL_out_A(1) => 
                           SEL_OUT_A(1), SEL_out_A(0) => SEL_OUT_A(0), 
                           SEL_out_B(1) => SEL_OUT_B(1), SEL_out_B(0) => 
                           SEL_OUT_B(0), SEL_out_C(1) => SEL_OUT_C(1), 
                           SEL_out_C(0) => SEL_OUT_C(0), RF_IN(11) => 
                           result_FC_RF_11_port, RF_IN(10) => 
                           result_FC_RF_10_port, RF_IN(9) => 
                           result_FC_RF_9_port, RF_IN(8) => result_FC_RF_8_port
                           , RF_IN(7) => result_FC_RF_7_port, RF_IN(6) => 
                           result_FC_RF_6_port, RF_IN(5) => result_FC_RF_5_port
                           , RF_IN(4) => result_FC_RF_4_port, RF_IN(3) => 
                           result_FC_RF_3_port, RF_IN(2) => result_FC_RF_2_port
                           , RF_IN(1) => result_FC_RF_1_port, RF_IN(0) => 
                           result_FC_RF_0_port, ALU_IN(11) => O1_RF_AL_11_port,
                           ALU_IN(10) => O1_RF_AL_10_port, ALU_IN(9) => 
                           O1_RF_AL_9_port, ALU_IN(8) => O1_RF_AL_8_port, 
                           ALU_IN(7) => O1_RF_AL_7_port, ALU_IN(6) => 
                           O1_RF_AL_6_port, ALU_IN(5) => O1_RF_AL_5_port, 
                           ALU_IN(4) => O1_RF_AL_4_port, ALU_IN(3) => 
                           O1_RF_AL_3_port, ALU_IN(2) => O1_RF_AL_2_port, 
                           ALU_IN(1) => O1_RF_AL_1_port, ALU_IN(0) => 
                           O1_RF_AL_0_port, D_OUT_1(11) => D_OUT_1(11), 
                           D_OUT_1(10) => D_OUT_1(10), D_OUT_1(9) => D_OUT_1(9)
                           , D_OUT_1(8) => D_OUT_1(8), D_OUT_1(7) => D_OUT_1(7)
                           , D_OUT_1(6) => D_OUT_1(6), D_OUT_1(5) => D_OUT_1(5)
                           , D_OUT_1(4) => D_OUT_1(4), D_OUT_1(3) => D_OUT_1(3)
                           , D_OUT_1(2) => D_OUT_1(2), D_OUT_1(1) => D_OUT_1(1)
                           , D_OUT_1(0) => D_OUT_1(0), D_OUT_2(11) => 
                           D_OUT_2_11_port, D_OUT_2(10) => D_OUT_2_10_port, 
                           D_OUT_2(9) => D_OUT_2_9_port, D_OUT_2(8) => 
                           D_OUT_2_8_port, D_OUT_2(7) => D_OUT_2_7_port, 
                           D_OUT_2(6) => D_OUT_2_6_port, D_OUT_2(5) => 
                           D_OUT_2_5_port, D_OUT_2(4) => D_OUT_2_4_port, 
                           D_OUT_2(3) => D_OUT_2_3_port, D_OUT_2(2) => 
                           D_OUT_2_2_port, D_OUT_2(1) => D_OUT_2_1_port, 
                           D_OUT_2(0) => D_OUT_2_0_port);

end SYN_RTL;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity mux12_4x1_0 is

   port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
         d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
         std_logic_vector (11 downto 0));

end mux12_4x1_0;

architecture SYN_RTL_clk of mux12_4x1_0 is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO221X1
      port( IN1, IN2, IN3, IN4, IN5 : in std_logic;  Q : out std_logic);
   end component;
   
   signal n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16
      , n17, n18 : std_logic;

begin
   
   U1 : AO221X1 port map( IN1 => d_in_a(9), IN2 => n1, IN3 => d_in_c(9), IN4 =>
                           n2, IN5 => n3, Q => d_out(9));
   U2 : AO22X1 port map( IN1 => d_in_b(9), IN2 => n4, IN3 => d_in_d(9), IN4 => 
                           n5, Q => n3);
   U3 : AO221X1 port map( IN1 => d_in_a(8), IN2 => n1, IN3 => d_in_c(8), IN4 =>
                           n2, IN5 => n6, Q => d_out(8));
   U4 : AO22X1 port map( IN1 => d_in_b(8), IN2 => n4, IN3 => d_in_d(8), IN4 => 
                           n5, Q => n6);
   U5 : AO221X1 port map( IN1 => d_in_a(7), IN2 => n1, IN3 => d_in_c(7), IN4 =>
                           n2, IN5 => n7, Q => d_out(7));
   U6 : AO22X1 port map( IN1 => d_in_b(7), IN2 => n4, IN3 => d_in_d(7), IN4 => 
                           n5, Q => n7);
   U7 : AO221X1 port map( IN1 => d_in_a(6), IN2 => n1, IN3 => d_in_c(6), IN4 =>
                           n2, IN5 => n8, Q => d_out(6));
   U8 : AO22X1 port map( IN1 => d_in_b(6), IN2 => n4, IN3 => d_in_d(6), IN4 => 
                           n5, Q => n8);
   U9 : AO221X1 port map( IN1 => d_in_a(5), IN2 => n1, IN3 => d_in_c(5), IN4 =>
                           n2, IN5 => n9, Q => d_out(5));
   U10 : AO22X1 port map( IN1 => d_in_b(5), IN2 => n4, IN3 => d_in_d(5), IN4 =>
                           n5, Q => n9);
   U11 : AO221X1 port map( IN1 => d_in_a(4), IN2 => n1, IN3 => d_in_c(4), IN4 
                           => n2, IN5 => n10, Q => d_out(4));
   U12 : AO22X1 port map( IN1 => d_in_b(4), IN2 => n4, IN3 => d_in_d(4), IN4 =>
                           n5, Q => n10);
   U13 : AO221X1 port map( IN1 => d_in_a(3), IN2 => n1, IN3 => d_in_c(3), IN4 
                           => n2, IN5 => n11, Q => d_out(3));
   U14 : AO22X1 port map( IN1 => d_in_b(3), IN2 => n4, IN3 => d_in_d(3), IN4 =>
                           n5, Q => n11);
   U15 : AO221X1 port map( IN1 => d_in_a(2), IN2 => n1, IN3 => d_in_c(2), IN4 
                           => n2, IN5 => n12, Q => d_out(2));
   U16 : AO22X1 port map( IN1 => d_in_b(2), IN2 => n4, IN3 => d_in_d(2), IN4 =>
                           n5, Q => n12);
   U17 : AO221X1 port map( IN1 => d_in_a(1), IN2 => n1, IN3 => d_in_c(1), IN4 
                           => n2, IN5 => n13, Q => d_out(1));
   U18 : AO22X1 port map( IN1 => d_in_b(1), IN2 => n4, IN3 => d_in_d(1), IN4 =>
                           n5, Q => n13);
   U19 : AO221X1 port map( IN1 => d_in_a(11), IN2 => n1, IN3 => d_in_c(11), IN4
                           => n2, IN5 => n14, Q => d_out(11));
   U20 : AO22X1 port map( IN1 => d_in_b(11), IN2 => n4, IN3 => d_in_d(11), IN4 
                           => n5, Q => n14);
   U21 : AO221X1 port map( IN1 => d_in_a(10), IN2 => n1, IN3 => d_in_c(10), IN4
                           => n2, IN5 => n15, Q => d_out(10));
   U22 : AO22X1 port map( IN1 => d_in_b(10), IN2 => n4, IN3 => d_in_d(10), IN4 
                           => n5, Q => n15);
   U23 : AO221X1 port map( IN1 => d_in_a(0), IN2 => n1, IN3 => d_in_c(0), IN4 
                           => n2, IN5 => n16, Q => d_out(0));
   U24 : AO22X1 port map( IN1 => d_in_b(0), IN2 => n4, IN3 => d_in_d(0), IN4 =>
                           n5, Q => n16);
   U25 : NOR3X0 port map( IN1 => n5, IN2 => n4, IN3 => n2, QN => n1);
   U26 : NOR2X0 port map( IN1 => n17, IN2 => select_input(0), QN => n2);
   U27 : NOR2X0 port map( IN1 => n18, IN2 => select_input(1), QN => n4);
   U28 : NOR2X0 port map( IN1 => n17, IN2 => n18, QN => n5);
   U29 : INVX0 port map( INP => select_input(0), ZN => n18);
   U30 : INVX0 port map( INP => select_input(1), ZN => n17);

end SYN_RTL_clk;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity mux12_2x1_0 is

   port( select_input : in std_logic;  d_in_a, d_in_b : in std_logic_vector (11
         downto 0);  d_out : out std_logic_vector (11 downto 0));

end mux12_2x1_0;

architecture SYN_RTL_1 of mux12_2x1_0 is

   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;

begin
   
   U1 : MUX21X1 port map( IN1 => d_in_b(6), IN2 => d_in_a(6), S => select_input
                           , Q => d_out(6));
   U2 : MUX21X1 port map( IN1 => d_in_b(5), IN2 => d_in_a(5), S => select_input
                           , Q => d_out(5));
   U3 : MUX21X1 port map( IN1 => d_in_b(4), IN2 => d_in_a(4), S => select_input
                           , Q => d_out(4));
   U4 : MUX21X1 port map( IN1 => d_in_b(3), IN2 => d_in_a(3), S => select_input
                           , Q => d_out(3));
   U5 : MUX21X1 port map( IN1 => d_in_b(2), IN2 => d_in_a(2), S => select_input
                           , Q => d_out(2));
   U6 : MUX21X1 port map( IN1 => d_in_b(1), IN2 => d_in_a(1), S => select_input
                           , Q => d_out(1));
   U7 : MUX21X1 port map( IN1 => d_in_b(0), IN2 => d_in_a(0), S => select_input
                           , Q => d_out(0));
   U8 : MUX21X1 port map( IN1 => d_in_b(11), IN2 => d_in_a(11), S => 
                           select_input, Q => d_out(11));
   U9 : MUX21X1 port map( IN1 => d_in_b(10), IN2 => d_in_a(10), S => 
                           select_input, Q => d_out(10));
   U10 : MUX21X1 port map( IN1 => d_in_b(9), IN2 => d_in_a(9), S => 
                           select_input, Q => d_out(9));
   U11 : MUX21X1 port map( IN1 => d_in_b(8), IN2 => d_in_a(8), S => 
                           select_input, Q => d_out(8));
   U12 : MUX21X1 port map( IN1 => d_in_b(7), IN2 => d_in_a(7), S => 
                           select_input, Q => d_out(7));

end SYN_RTL_1;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity INC is

   port( inc_in : in std_logic_vector (11 downto 0);  inc_out : out 
         std_logic_vector (11 downto 0));

end INC;

architecture SYN_behav of INC is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component XNOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component XOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   signal inc_out_11_port, inc_out_10_port, inc_out_9_port, inc_out_8_port, 
      inc_out_7_port, inc_out_6_port, inc_out_5_port, inc_out_4_port, 
      inc_out_3_port, inc_out_2_port, inc_out_1_port, inc_out_0_port, n1, n2, 
      n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15 : std_logic;

begin
   inc_out <= ( inc_out_11_port, inc_out_10_port, inc_out_9_port, 
      inc_out_8_port, inc_out_7_port, inc_out_6_port, inc_out_5_port, 
      inc_out_4_port, inc_out_3_port, inc_out_2_port, inc_out_1_port, 
      inc_out_0_port );
   
   U1 : XOR2X1 port map( IN1 => inc_in(9), IN2 => n1, Q => inc_out_9_port);
   U2 : XOR2X1 port map( IN1 => inc_in(8), IN2 => n2, Q => inc_out_8_port);
   U3 : NOR2X0 port map( IN1 => n3, IN2 => n4, QN => n2);
   U4 : XNOR2X1 port map( IN1 => inc_in(7), IN2 => n3, Q => inc_out_7_port);
   U5 : XOR2X1 port map( IN1 => inc_in(6), IN2 => n5, Q => inc_out_6_port);
   U6 : XNOR2X1 port map( IN1 => inc_in(5), IN2 => n6, Q => inc_out_5_port);
   U7 : XNOR2X1 port map( IN1 => inc_in(4), IN2 => n7, Q => inc_out_4_port);
   U8 : NAND2X0 port map( IN1 => inc_in(3), IN2 => n8, QN => n7);
   U9 : XOR2X1 port map( IN1 => inc_in(3), IN2 => n8, Q => inc_out_3_port);
   U10 : XNOR2X1 port map( IN1 => inc_in(2), IN2 => n9, Q => inc_out_2_port);
   U11 : XNOR2X1 port map( IN1 => inc_in(1), IN2 => inc_out_0_port, Q => 
                           inc_out_1_port);
   U12 : XOR2X1 port map( IN1 => inc_in(11), IN2 => n10, Q => inc_out_11_port);
   U13 : NOR2X0 port map( IN1 => n11, IN2 => n12, QN => n10);
   U14 : INVX0 port map( INP => inc_in(10), ZN => n12);
   U15 : XNOR2X1 port map( IN1 => inc_in(10), IN2 => n11, Q => inc_out_10_port)
                           ;
   U16 : NAND2X0 port map( IN1 => n1, IN2 => inc_in(9), QN => n11);
   U17 : NOR3X0 port map( IN1 => n4, IN2 => n3, IN3 => n13, QN => n1);
   U18 : INVX0 port map( INP => inc_in(8), ZN => n13);
   U19 : NAND2X0 port map( IN1 => inc_in(6), IN2 => n5, QN => n3);
   U20 : NOR2X0 port map( IN1 => n14, IN2 => n6, QN => n5);
   U21 : NAND3X0 port map( IN1 => inc_in(3), IN2 => n8, IN3 => inc_in(4), QN =>
                           n6);
   U22 : NOR2X0 port map( IN1 => n15, IN2 => n9, QN => n8);
   U23 : NAND2X0 port map( IN1 => inc_in(1), IN2 => inc_in(0), QN => n9);
   U24 : INVX0 port map( INP => inc_in(2), ZN => n15);
   U25 : INVX0 port map( INP => inc_in(5), ZN => n14);
   U26 : INVX0 port map( INP => inc_in(7), ZN => n4);
   U27 : INVX0 port map( INP => inc_in(0), ZN => inc_out_0_port);

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity PC is

   port( clk, rst, enab : in std_logic;  PC_IN : in std_logic_vector (11 downto
         0);  PC : out std_logic_vector (11 downto 0));

end PC;

architecture SYN_behav of PC is

   component reg_N12_5
      port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (11 downto 0));
   end component;

begin
   
   PCr : reg_N12_5 port map( D_IN(11) => PC_IN(11), D_IN(10) => PC_IN(10), 
                           D_IN(9) => PC_IN(9), D_IN(8) => PC_IN(8), D_IN(7) =>
                           PC_IN(7), D_IN(6) => PC_IN(6), D_IN(5) => PC_IN(5), 
                           D_IN(4) => PC_IN(4), D_IN(3) => PC_IN(3), D_IN(2) =>
                           PC_IN(2), D_IN(1) => PC_IN(1), D_IN(0) => PC_IN(0), 
                           RST => rst, ENABLE => enab, CLK => clk, Q_OUT(11) =>
                           PC(11), Q_OUT(10) => PC(10), Q_OUT(9) => PC(9), 
                           Q_OUT(8) => PC(8), Q_OUT(7) => PC(7), Q_OUT(6) => 
                           PC(6), Q_OUT(5) => PC(5), Q_OUT(4) => PC(4), 
                           Q_OUT(3) => PC(3), Q_OUT(2) => PC(2), Q_OUT(1) => 
                           PC(1), Q_OUT(0) => PC(0));

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity addr is

   port( clk, rst, enab : in std_logic;  addr_in : in std_logic_vector (11 
         downto 0);  addr_out : out std_logic_vector (11 downto 0));

end addr;

architecture SYN_behav of addr is

   component reg_N12_6
      port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (11 downto 0));
   end component;

begin
   
   addr : reg_N12_6 port map( D_IN(11) => addr_in(11), D_IN(10) => addr_in(10),
                           D_IN(9) => addr_in(9), D_IN(8) => addr_in(8), 
                           D_IN(7) => addr_in(7), D_IN(6) => addr_in(6), 
                           D_IN(5) => addr_in(5), D_IN(4) => addr_in(4), 
                           D_IN(3) => addr_in(3), D_IN(2) => addr_in(2), 
                           D_IN(1) => addr_in(1), D_IN(0) => addr_in(0), RST =>
                           rst, ENABLE => enab, CLK => clk, Q_OUT(11) => 
                           addr_out(11), Q_OUT(10) => addr_out(10), Q_OUT(9) =>
                           addr_out(9), Q_OUT(8) => addr_out(8), Q_OUT(7) => 
                           addr_out(7), Q_OUT(6) => addr_out(6), Q_OUT(5) => 
                           addr_out(5), Q_OUT(4) => addr_out(4), Q_OUT(3) => 
                           addr_out(3), Q_OUT(2) => addr_out(2), Q_OUT(1) => 
                           addr_out(1), Q_OUT(0) => addr_out(0));

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity instr is

   port( clk, rst, enab : in std_logic;  instr_in : in std_logic_vector (11 
         downto 0);  instr_out : out std_logic_vector (11 downto 0));

end instr;

architecture SYN_behav of instr is

   component reg_N12_0
      port( D_IN : in std_logic_vector (11 downto 0);  RST, ENABLE, CLK : in 
            std_logic;  Q_OUT : out std_logic_vector (11 downto 0));
   end component;

begin
   
   instr : reg_N12_0 port map( D_IN(11) => instr_in(11), D_IN(10) => 
                           instr_in(10), D_IN(9) => instr_in(9), D_IN(8) => 
                           instr_in(8), D_IN(7) => instr_in(7), D_IN(6) => 
                           instr_in(6), D_IN(5) => instr_in(5), D_IN(4) => 
                           instr_in(4), D_IN(3) => instr_in(3), D_IN(2) => 
                           instr_in(2), D_IN(1) => instr_in(1), D_IN(0) => 
                           instr_in(0), RST => rst, ENABLE => enab, CLK => clk,
                           Q_OUT(11) => instr_out(11), Q_OUT(10) => 
                           instr_out(10), Q_OUT(9) => instr_out(9), Q_OUT(8) =>
                           instr_out(8), Q_OUT(7) => instr_out(7), Q_OUT(6) => 
                           instr_out(6), Q_OUT(5) => instr_out(5), Q_OUT(4) => 
                           instr_out(4), Q_OUT(3) => instr_out(3), Q_OUT(2) => 
                           instr_out(2), Q_OUT(1) => instr_out(1), Q_OUT(0) => 
                           instr_out(0));

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity FSM is

   port( take_jmp, store, cmd_calc, cmd_const, cmd_dir, cmd_reg, cmd_io, cmd_pc
         , cmd_jmp, cmd_stop, dev_rdy, clk, rst : in std_logic;  instr_en, 
         addr_en, pc_en, pc_mux, reg_en, fc_sel, d_in_mux, d_out_mux, w_en, 
         io_type, io_en : out std_logic;  a_out_mux : out std_logic_vector (1 
         downto 0);  activ : out std_logic);

end FSM;

architecture SYN_behav of FSM is

   component NOR3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component AND3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component OR3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component AO21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component AND2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component OA21X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component NAND4X0
      port( IN1, IN2, IN3, IN4 : in std_logic;  QN : out std_logic);
   end component;
   
   component OR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFARX1
      port( D, CLK, RSTB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   component DFFASX1
      port( D, CLK, SETB : in std_logic;  Q, QN : out std_logic);
   end component;
   
   signal instr_en_port, addr_en_port, pc_mux_port, d_in_mux_port, w_en_port, 
      a_out_mux_1_port, a_out_mux_0_port, state_3, state_1_port, state_0_port, 
      N59, N60, N61, N62, N63, n4, activ_port, n1, n2, n3, n5, n6, n7, n8, n9, 
      n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24
      , n25, n26, n27, n_1116 : std_logic;

begin
   instr_en <= instr_en_port;
   addr_en <= addr_en_port;
   pc_mux <= pc_mux_port;
   d_in_mux <= d_in_mux_port;
   d_out_mux <= cmd_pc;
   w_en <= w_en_port;
   io_type <= w_en_port;
   a_out_mux <= ( a_out_mux_1_port, a_out_mux_0_port );
   activ <= activ_port;
   
   state_reg_0_inst : DFFARX1 port map( D => N59, CLK => clk, RSTB => rst, Q =>
                           state_0_port, QN => activ_port);
   state_reg_1_inst : DFFARX1 port map( D => N60, CLK => clk, RSTB => rst, Q =>
                           state_1_port, QN => n_1116);
   state_reg_4_inst : DFFASX1 port map( D => N63, CLK => clk, SETB => rst, Q =>
                           instr_en_port, QN => n27);
   state_reg_3_inst : DFFARX1 port map( D => N62, CLK => clk, RSTB => rst, Q =>
                           state_3, QN => n1);
   state_reg_2_inst : DFFARX1 port map( D => N61, CLK => clk, RSTB => rst, Q =>
                           d_in_mux_port, QN => n4);
   U3 : NOR2X0 port map( IN1 => n2, IN2 => n3, QN => w_en_port);
   U4 : AO22X1 port map( IN1 => n5, IN2 => n3, IN3 => state_3, IN4 => n6, Q => 
                           reg_en);
   U5 : OR2X1 port map( IN1 => cmd_const, IN2 => cmd_calc, Q => n6);
   U6 : INVX0 port map( INP => store, ZN => n3);
   U7 : NAND3X0 port map( IN1 => n7, IN2 => n8, IN3 => n2, QN => n5);
   U8 : NOR2X0 port map( IN1 => state_1_port, IN2 => a_out_mux_1_port, QN => n2
                           );
   U9 : NAND4X0 port map( IN1 => n27, IN2 => n9, IN3 => n10, IN4 => n11, QN => 
                           pc_en);
   U10 : INVX0 port map( INP => addr_en_port, ZN => n11);
   U11 : NAND2X0 port map( IN1 => pc_mux_port, IN2 => store, QN => n10);
   U12 : INVX0 port map( INP => n8, ZN => pc_mux_port);
   U13 : NAND2X0 port map( IN1 => cmd_pc, IN2 => state_3, QN => n8);
   U14 : NAND2X0 port map( IN1 => cmd_const, IN2 => state_3, QN => n9);
   U15 : INVX0 port map( INP => n7, ZN => io_en);
   U16 : NAND2X0 port map( IN1 => dev_rdy, IN2 => d_in_mux_port, QN => n7);
   U17 : INVX0 port map( INP => cmd_calc, ZN => fc_sel);
   U18 : OA21X1 port map( IN1 => cmd_dir, IN2 => cmd_jmp, IN3 => state_3, Q => 
                           addr_en_port);
   U19 : AND2X1 port map( IN1 => state_3, IN2 => cmd_reg, Q => a_out_mux_1_port
                           );
   U20 : AO21X1 port map( IN1 => take_jmp, IN2 => instr_en_port, IN3 => 
                           state_1_port, Q => a_out_mux_0_port);
   U21 : NAND2X0 port map( IN1 => n12, IN2 => n13, QN => N63);
   U22 : OR3X1 port map( IN1 => cmd_dir, IN2 => cmd_stop, IN3 => n14, Q => n13)
                           ;
   U23 : MUX21X1 port map( IN1 => n15, IN2 => n16, S => n17, Q => n12);
   U24 : NAND3X0 port map( IN1 => n18, IN2 => n19, IN3 => n20, QN => n15);
   U25 : INVX0 port map( INP => n19, ZN => N62);
   U26 : NAND3X0 port map( IN1 => n4, IN2 => instr_en_port, IN3 => n21, QN => 
                           n19);
   U27 : AO22X1 port map( IN1 => cmd_io, IN2 => n22, IN3 => n17, IN4 => n16, Q 
                           => N61);
   U28 : INVX0 port map( INP => dev_rdy, ZN => n16);
   U29 : AND3X1 port map( IN1 => n27, IN2 => d_in_mux_port, IN3 => n21, Q => 
                           n17);
   U30 : NOR3X0 port map( IN1 => state_1_port, IN2 => state_3, IN3 => 
                           state_0_port, QN => n21);
   U31 : INVX0 port map( INP => n20, ZN => n22);
   U32 : NOR2X0 port map( IN1 => n14, IN2 => n23, QN => N60);
   U33 : INVX0 port map( INP => n24, ZN => n14);
   U34 : NAND2X0 port map( IN1 => n18, IN2 => n25, QN => N59);
   U35 : NAND3X0 port map( IN1 => n24, IN2 => n23, IN3 => cmd_stop, QN => n25);
   U36 : INVX0 port map( INP => cmd_dir, ZN => n23);
   U37 : NOR2X0 port map( IN1 => n20, IN2 => cmd_io, QN => n24);
   U38 : NAND3X0 port map( IN1 => state_3, IN2 => activ_port, IN3 => n26, QN =>
                           n20);
   U39 : NAND3X0 port map( IN1 => n26, IN2 => n1, IN3 => state_0_port, QN => 
                           n18);
   U40 : NOR3X0 port map( IN1 => instr_en_port, IN2 => state_1_port, IN3 => 
                           d_in_mux_port, QN => n26);

end SYN_behav;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity ID is

   port( INSTR : in std_logic_vector (11 downto 0);  FLAGS : in 
         std_logic_vector (3 downto 0);  OP : out std_logic_vector (5 downto 0)
         ;  SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C : out std_logic_vector (1 
         downto 0);  TAKE_JMP, STORE, CMD_CALC, CMD_CONST, CMD_DIR, CMD_REG, 
         CMD_IO, CMD_PC, CMD_JMP, CMD_STOP : out std_logic);

end ID;

architecture SYN_case_driven_with_default_assignment of ID is

   component INVX0
      port( INP : in std_logic;  ZN : out std_logic);
   end component;
   
   component NAND3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component NOR3X0
      port( IN1, IN2, IN3 : in std_logic;  QN : out std_logic);
   end component;
   
   component XOR2X1
      port( IN1, IN2 : in std_logic;  Q : out std_logic);
   end component;
   
   component AND3X1
      port( IN1, IN2, IN3 : in std_logic;  Q : out std_logic);
   end component;
   
   component NOR4X0
      port( IN1, IN2, IN3, IN4 : in std_logic;  QN : out std_logic);
   end component;
   
   component NAND2X0
      port( IN1, IN2 : in std_logic;  QN : out std_logic);
   end component;
   
   component MUX21X1
      port( IN1, IN2, S : in std_logic;  Q : out std_logic);
   end component;
   
   component AO22X1
      port( IN1, IN2, IN3, IN4 : in std_logic;  Q : out std_logic);
   end component;
   
   signal TAKE_JMP_port, CMD_DIR_port, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
      n11, n12, n13, n14, n15, n16 : std_logic;

begin
   OP <= ( INSTR(11), INSTR(10), INSTR(9), INSTR(8), INSTR(7), INSTR(6) );
   SEL_IN <= ( INSTR(5), INSTR(4) );
   SEL_OUT_A <= ( INSTR(1), INSTR(0) );
   SEL_OUT_B <= ( INSTR(3), INSTR(2) );
   SEL_OUT_C <= ( INSTR(5), INSTR(4) );
   TAKE_JMP <= TAKE_JMP_port;
   CMD_DIR <= CMD_DIR_port;
   CMD_JMP <= TAKE_JMP_port;
   
   CMD_PC <= '0';
   U2 : AND3X1 port map( IN1 => INSTR(11), IN2 => n1, IN3 => INSTR(10), Q => 
                           TAKE_JMP_port);
   U3 : NAND2X0 port map( IN1 => n2, IN2 => INSTR(9), QN => n1);
   U4 : AO22X1 port map( IN1 => INSTR(7), IN2 => CMD_DIR_port, IN3 => n3, IN4 
                           => INSTR(8), Q => STORE);
   U5 : NOR2X0 port map( IN1 => INSTR(6), IN2 => n4, QN => n3);
   U6 : NOR2X0 port map( IN1 => INSTR(11), IN2 => n5, QN => CMD_CALC);
   U7 : MUX21X1 port map( IN1 => n6, IN2 => n7, S => INSTR(10), Q => n5);
   U8 : NAND2X0 port map( IN1 => n8, IN2 => n9, QN => n7);
   U9 : INVX0 port map( INP => n10, ZN => n6);
   U10 : NOR4X0 port map( IN1 => INSTR(11), IN2 => INSTR(10), IN3 => n11, IN4 
                           => n10, QN => CMD_STOP);
   U11 : NAND3X0 port map( IN1 => n8, IN2 => n9, IN3 => n12, QN => n10);
   U12 : AND3X1 port map( IN1 => n13, IN2 => n11, IN3 => n14, Q => CMD_REG);
   U13 : XOR2X1 port map( IN1 => INSTR(8), IN2 => INSTR(7), Q => n13);
   U14 : AND3X1 port map( IN1 => n14, IN2 => n15, IN3 => INSTR(8), Q => CMD_IO)
                           ;
   U15 : XOR2X1 port map( IN1 => INSTR(7), IN2 => INSTR(6), Q => n15);
   U16 : INVX0 port map( INP => n4, ZN => n14);
   U17 : NOR3X0 port map( IN1 => n4, IN2 => INSTR(8), IN3 => n11, QN => 
                           CMD_DIR_port);
   U18 : NOR2X0 port map( IN1 => n4, IN2 => n2, QN => CMD_CONST);
   U19 : NAND3X0 port map( IN1 => n12, IN2 => n8, IN3 => n11, QN => n2);
   U20 : INVX0 port map( INP => INSTR(6), ZN => n11);
   U21 : INVX0 port map( INP => INSTR(8), ZN => n8);
   U22 : INVX0 port map( INP => INSTR(7), ZN => n12);
   U23 : NAND3X0 port map( IN1 => n9, IN2 => n16, IN3 => INSTR(11), QN => n4);
   U24 : INVX0 port map( INP => INSTR(10), ZN => n16);
   U25 : INVX0 port map( INP => INSTR(9), ZN => n9);

end SYN_case_driven_with_default_assignment;

library saed90nm_typ,IEEE;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_CPU.all;

entity CPU is

   port( CLK, RST : in BIT;  D_IN : in data_type;  A_IN_2 : out data_type;  
         DEV_RDY : in BIT;  A_OUT : out addr_type;  W_EN, D_IN_MUX, IO_TYPE, 
         IO_EN, ACTVE : out BIT);

end CPU;

architecture SYN_RTL of CPU is

   component datapath
      port( CLK, RST : in std_logic;  D_OUT_1, D_OUT_2 : out std_logic_vector 
            (11 downto 0);  FLAGS_port : out std_logic_vector (3 downto 0);  
            D_IN : in std_logic_vector (11 downto 0);  FC_SEL, REG_EN : in 
            std_logic;  OP : in std_logic_vector (5 downto 0);  SEL_IN, 
            SEL_OUT_A, SEL_OUT_B, SEL_OUT_C : in std_logic_vector (1 downto 0)
            );
   end component;
   
   component mux12_4x1_0
      port( select_input : in std_logic_vector (1 downto 0);  d_in_a, d_in_b, 
            d_in_c, d_in_d : in std_logic_vector (11 downto 0);  d_out : out 
            std_logic_vector (11 downto 0));
   end component;
   
   component mux12_2x1_1
      port( select_input : in std_logic;  d_in_a, d_in_b : in std_logic_vector 
            (11 downto 0);  d_out : out std_logic_vector (11 downto 0));
   end component;
   
   component mux12_2x1_0
      port( select_input : in std_logic;  d_in_a, d_in_b : in std_logic_vector 
            (11 downto 0);  d_out : out std_logic_vector (11 downto 0));
   end component;
   
   component INC
      port( inc_in : in std_logic_vector (11 downto 0);  inc_out : out 
            std_logic_vector (11 downto 0));
   end component;
   
   component PC
      port( clk, rst, enab : in std_logic;  PC_IN : in std_logic_vector (11 
            downto 0);  PC : out std_logic_vector (11 downto 0));
   end component;
   
   component addr
      port( clk, rst, enab : in std_logic;  addr_in : in std_logic_vector (11 
            downto 0);  addr_out : out std_logic_vector (11 downto 0));
   end component;
   
   component instr
      port( clk, rst, enab : in std_logic;  instr_in : in std_logic_vector (11 
            downto 0);  instr_out : out std_logic_vector (11 downto 0));
   end component;
   
   component FSM
      port( take_jmp, store, cmd_calc, cmd_const, cmd_dir, cmd_reg, cmd_io, 
            cmd_pc, cmd_jmp, cmd_stop, dev_rdy, clk, rst : in std_logic;  
            instr_en, addr_en, pc_en, pc_mux, reg_en, fc_sel, d_in_mux, 
            d_out_mux, w_en, io_type, io_en : out std_logic;  a_out_mux : out 
            std_logic_vector (1 downto 0);  activ : out std_logic);
   end component;
   
   component ID
      port( INSTR : in std_logic_vector (11 downto 0);  FLAGS : in 
            std_logic_vector (3 downto 0);  OP : out std_logic_vector (5 downto
            0);  SEL_IN, SEL_OUT_A, SEL_OUT_B, SEL_OUT_C : out std_logic_vector
            (1 downto 0);  TAKE_JMP, STORE, CMD_CALC, CMD_CONST, CMD_DIR, 
            CMD_REG, CMD_IO, CMD_PC, CMD_JMP, CMD_STOP : out std_logic);
   end component;
   
   signal X_Logic0_port, CLK_port, RST_port, D_IN_11_port, D_IN_10_port, 
      D_IN_9_port, D_IN_8_port, D_IN_7_port, D_IN_6_port, D_IN_5_port, 
      D_IN_4_port, D_IN_3_port, D_IN_2_port, D_IN_1_port, D_IN_0_port, 
      A_IN_2_11_port, A_IN_2_10_port, A_IN_2_9_port, A_IN_2_8_port, 
      A_IN_2_7_port, A_IN_2_6_port, A_IN_2_5_port, A_IN_2_4_port, A_IN_2_3_port
      , A_IN_2_2_port, A_IN_2_1_port, A_IN_2_0_port, DEV_RDY_port, 
      A_OUT_11_port, A_OUT_10_port, A_OUT_9_port, A_OUT_8_port, A_OUT_7_port, 
      A_OUT_6_port, A_OUT_5_port, A_OUT_4_port, A_OUT_3_port, A_OUT_2_port, 
      A_OUT_1_port, A_OUT_0_port, W_EN_port, D_IN_MUX_port, IO_TYPE_port, 
      IO_EN_port, ACTVE_port, INSTR_11_port, INSTR_10_port, INSTR_9_port, 
      INSTR_8_port, INSTR_7_port, INSTR_6_port, INSTR_5_port, INSTR_4_port, 
      INSTR_3_port, INSTR_2_port, INSTR_1_port, INSTR_0_port, FLAGS_3_port, 
      FLAGS_2_port, FLAGS_1_port, FLAGS_0_port, OP_5_port, OP_4_port, OP_3_port
      , OP_2_port, OP_1_port, OP_0_port, SEL_IN_1_port, SEL_IN_0_port, 
      SEL_OUT_A_1_port, SEL_OUT_A_0_port, SEL_OUT_B_1_port, SEL_OUT_B_0_port, 
      SEL_OUT_C_1_port, SEL_OUT_C_0_port, CTRL_9_port, CTRL_8_port, CTRL_7_port
      , CTRL_6_port, CTRL_5_port, CTRL_4_port, CTRL_3_port, CTRL_2_port, 
      CTRL_1_port, CTRL_0_port, INSTR_EN, ADDR_EN, PC_EN, PC_MUX, REG_EN, 
      FC_SEL, D_OUT_MUX, A_OUT_MUX_1_port, A_OUT_MUX_0_port, ADDR_11_port, 
      ADDR_10_port, ADDR_9_port, ADDR_8_port, ADDR_7_port, ADDR_6_port, 
      ADDR_5_port, ADDR_4_port, ADDR_3_port, ADDR_2_port, ADDR_1_port, 
      ADDR_0_port, PC_IN_11_port, PC_IN_10_port, PC_IN_9_port, PC_IN_8_port, 
      PC_IN_7_port, PC_IN_6_port, PC_IN_5_port, PC_IN_4_port, PC_IN_3_port, 
      PC_IN_2_port, PC_IN_1_port, PC_IN_0_port, PC_11_port, PC_10_port, 
      PC_9_port, PC_8_port, PC_7_port, PC_6_port, PC_5_port, PC_4_port, 
      PC_3_port, PC_2_port, PC_1_port, PC_0_port, INC_OUT_11_port, 
      INC_OUT_10_port, INC_OUT_9_port, INC_OUT_8_port, INC_OUT_7_port, 
      INC_OUT_6_port, INC_OUT_5_port, INC_OUT_4_port, INC_OUT_3_port, 
      INC_OUT_2_port, INC_OUT_1_port, INC_OUT_0_port, D_OUT_11_port, 
      D_OUT_10_port, D_OUT_9_port, D_OUT_8_port, D_OUT_7_port, D_OUT_6_port, 
      D_OUT_5_port, D_OUT_4_port, D_OUT_3_port, D_OUT_2_port, D_OUT_1_port, 
      D_OUT_0_port, A_IN_1_11_port, A_IN_1_10_port, A_IN_1_9_port, 
      A_IN_1_8_port, A_IN_1_7_port, A_IN_1_6_port, A_IN_1_5_port, A_IN_1_4_port
      , A_IN_1_3_port, A_IN_1_2_port, A_IN_1_1_port, A_IN_1_0_port, n1, 
      TAKE_JMP_pin, CMD_DIR_pin, CMD_JMP_pin, instr_en_pin, addr_en_pin, 
      pc_mux_pin, d_in_mux_pin, d_out_mux_pin, w_en_pin, io_type_pin, activ_pin
      : std_logic;
   
   signal OP_pin : std_logic_vector (5 downto 0);
   
   signal SEL_IN_pin, SEL_OUT_A_pin, SEL_OUT_B_pin, SEL_OUT_C_pin, 
      a_out_mux_pin : std_logic_vector (1 downto 0);
   
   signal inc_out_pin, D_OUT_2_pin : std_logic_vector (11 downto 0);
   
   signal FLAGS_pin_port : std_logic_vector (3 downto 0);

begin
   CLK_port <= BIT_to_std_logic(CLK);
   RST_port <= BIT_to_std_logic(RST);
   D_IN_11_port <= BIT_to_std_logic(D_IN(11));
   D_IN_10_port <= BIT_to_std_logic(D_IN(10));
   D_IN_9_port <= BIT_to_std_logic(D_IN(9));
   D_IN_8_port <= BIT_to_std_logic(D_IN(8));
   D_IN_7_port <= BIT_to_std_logic(D_IN(7));
   D_IN_6_port <= BIT_to_std_logic(D_IN(6));
   D_IN_5_port <= BIT_to_std_logic(D_IN(5));
   D_IN_4_port <= BIT_to_std_logic(D_IN(4));
   D_IN_3_port <= BIT_to_std_logic(D_IN(3));
   D_IN_2_port <= BIT_to_std_logic(D_IN(2));
   D_IN_1_port <= BIT_to_std_logic(D_IN(1));
   D_IN_0_port <= BIT_to_std_logic(D_IN(0));
   A_IN_2(11) <= std_logic_to_BIT(A_IN_2_11_port);
   A_IN_2(10) <= std_logic_to_BIT(A_IN_2_10_port);
   A_IN_2(9) <= std_logic_to_BIT(A_IN_2_9_port);
   A_IN_2(8) <= std_logic_to_BIT(A_IN_2_8_port);
   A_IN_2(7) <= std_logic_to_BIT(A_IN_2_7_port);
   A_IN_2(6) <= std_logic_to_BIT(A_IN_2_6_port);
   A_IN_2(5) <= std_logic_to_BIT(A_IN_2_5_port);
   A_IN_2(4) <= std_logic_to_BIT(A_IN_2_4_port);
   A_IN_2(3) <= std_logic_to_BIT(A_IN_2_3_port);
   A_IN_2(2) <= std_logic_to_BIT(A_IN_2_2_port);
   A_IN_2(1) <= std_logic_to_BIT(A_IN_2_1_port);
   A_IN_2(0) <= std_logic_to_BIT(A_IN_2_0_port);
   DEV_RDY_port <= BIT_to_std_logic(DEV_RDY);
   A_OUT(11) <= std_logic_to_BIT(A_OUT_11_port);
   A_OUT(10) <= std_logic_to_BIT(A_OUT_10_port);
   A_OUT(9) <= std_logic_to_BIT(A_OUT_9_port);
   A_OUT(8) <= std_logic_to_BIT(A_OUT_8_port);
   A_OUT(7) <= std_logic_to_BIT(A_OUT_7_port);
   A_OUT(6) <= std_logic_to_BIT(A_OUT_6_port);
   A_OUT(5) <= std_logic_to_BIT(A_OUT_5_port);
   A_OUT(4) <= std_logic_to_BIT(A_OUT_4_port);
   A_OUT(3) <= std_logic_to_BIT(A_OUT_3_port);
   A_OUT(2) <= std_logic_to_BIT(A_OUT_2_port);
   A_OUT(1) <= std_logic_to_BIT(A_OUT_1_port);
   A_OUT(0) <= std_logic_to_BIT(A_OUT_0_port);
   W_EN <= std_logic_to_BIT(W_EN_port);
   D_IN_MUX <= std_logic_to_BIT(D_IN_MUX_port);
   IO_TYPE <= std_logic_to_BIT(IO_TYPE_port);
   IO_EN <= std_logic_to_BIT(IO_EN_port);
   ACTVE <= std_logic_to_BIT(ACTVE_port);
   
   ( OP_5_port, OP_4_port, OP_3_port, OP_2_port, OP_1_port, OP_0_port ) <= 
      OP_pin;
   ( SEL_IN_1_port, SEL_IN_0_port ) <= SEL_IN_pin;
   ( SEL_OUT_A_1_port, SEL_OUT_A_0_port ) <= SEL_OUT_A_pin;
   ( SEL_OUT_B_1_port, SEL_OUT_B_0_port ) <= SEL_OUT_B_pin;
   ( SEL_OUT_C_1_port, SEL_OUT_C_0_port ) <= SEL_OUT_C_pin;
   CTRL_0_port <= TAKE_JMP_pin;
   CTRL_4_port <= CMD_DIR_pin;
   CTRL_8_port <= CMD_JMP_pin;
   ID_inst : ID port map( INSTR(11) => INSTR_11_port, INSTR(10) => 
      INSTR_10_port, INSTR(9) => INSTR_9_port, INSTR(8) => INSTR_8_port, 
      INSTR(7) => INSTR_7_port, INSTR(6) => INSTR_6_port, INSTR(5) => 
      INSTR_5_port, INSTR(4) => INSTR_4_port, INSTR(3) => INSTR_3_port, 
      INSTR(2) => INSTR_2_port, INSTR(1) => INSTR_1_port, INSTR(0) => 
      INSTR_0_port, FLAGS(3) => FLAGS_3_port, FLAGS(2) => FLAGS_2_port, 
      FLAGS(1) => FLAGS_1_port, FLAGS(0) => FLAGS_0_port, OP => OP_pin, SEL_IN 
      => SEL_IN_pin, SEL_OUT_A => SEL_OUT_A_pin, SEL_OUT_B => SEL_OUT_B_pin, 
      SEL_OUT_C => SEL_OUT_C_pin, TAKE_JMP => TAKE_JMP_pin, STORE => 
      CTRL_1_port, CMD_CALC => CTRL_2_port, CMD_CONST => CTRL_3_port, CMD_DIR 
      => CMD_DIR_pin, CMD_REG => CTRL_5_port, CMD_IO => CTRL_6_port, CMD_PC => 
      CTRL_7_port, CMD_JMP => CMD_JMP_pin, CMD_STOP => CTRL_9_port);
   INSTR_EN <= instr_en_pin;
   ADDR_EN <= addr_en_pin;
   PC_MUX <= pc_mux_pin;
   D_IN_MUX_port <= d_in_mux_pin;
   D_OUT_MUX <= d_out_mux_pin;
   W_EN_port <= w_en_pin;
   IO_TYPE_port <= io_type_pin;
   ( A_OUT_MUX_1_port, A_OUT_MUX_0_port ) <= a_out_mux_pin;
   ACTVE_port <= activ_pin;
   FS : FSM port map( take_jmp => CTRL_0_port, store => CTRL_1_port, cmd_calc 
      => CTRL_2_port, cmd_const => CTRL_3_port, cmd_dir => CTRL_4_port, cmd_reg
      => CTRL_5_port, cmd_io => CTRL_6_port, cmd_pc => n1, cmd_jmp => 
      CTRL_8_port, cmd_stop => CTRL_9_port, dev_rdy => DEV_RDY_port, clk => 
      CLK_port, rst => RST_port, instr_en => instr_en_pin, addr_en => 
      addr_en_pin, pc_en => PC_EN, pc_mux => pc_mux_pin, reg_en => REG_EN, 
      fc_sel => FC_SEL, d_in_mux => d_in_mux_pin, d_out_mux => d_out_mux_pin, 
      w_en => w_en_pin, io_type => io_type_pin, io_en => IO_EN_port, a_out_mux 
      => a_out_mux_pin, activ => activ_pin);
   INS : instr port map( clk => CLK_port, rst => RST_port, enab => INSTR_EN, 
                           instr_in(11) => D_IN_11_port, instr_in(10) => 
                           D_IN_10_port, instr_in(9) => D_IN_9_port, 
                           instr_in(8) => D_IN_8_port, instr_in(7) => 
                           D_IN_7_port, instr_in(6) => D_IN_6_port, instr_in(5)
                           => D_IN_5_port, instr_in(4) => D_IN_4_port, 
                           instr_in(3) => D_IN_3_port, instr_in(2) => 
                           D_IN_2_port, instr_in(1) => D_IN_1_port, instr_in(0)
                           => D_IN_0_port, instr_out(11) => INSTR_11_port, 
                           instr_out(10) => INSTR_10_port, instr_out(9) => 
                           INSTR_9_port, instr_out(8) => INSTR_8_port, 
                           instr_out(7) => INSTR_7_port, instr_out(6) => 
                           INSTR_6_port, instr_out(5) => INSTR_5_port, 
                           instr_out(4) => INSTR_4_port, instr_out(3) => 
                           INSTR_3_port, instr_out(2) => INSTR_2_port, 
                           instr_out(1) => INSTR_1_port, instr_out(0) => 
                           INSTR_0_port);
   AD : addr port map( clk => CLK_port, rst => RST_port, enab => ADDR_EN, 
                           addr_in(11) => D_IN_11_port, addr_in(10) => 
                           D_IN_10_port, addr_in(9) => D_IN_9_port, addr_in(8) 
                           => D_IN_8_port, addr_in(7) => D_IN_7_port, 
                           addr_in(6) => D_IN_6_port, addr_in(5) => D_IN_5_port
                           , addr_in(4) => D_IN_4_port, addr_in(3) => 
                           D_IN_3_port, addr_in(2) => D_IN_2_port, addr_in(1) 
                           => D_IN_1_port, addr_in(0) => D_IN_0_port, 
                           addr_out(11) => ADDR_11_port, addr_out(10) => 
                           ADDR_10_port, addr_out(9) => ADDR_9_port, 
                           addr_out(8) => ADDR_8_port, addr_out(7) => 
                           ADDR_7_port, addr_out(6) => ADDR_6_port, addr_out(5)
                           => ADDR_5_port, addr_out(4) => ADDR_4_port, 
                           addr_out(3) => ADDR_3_port, addr_out(2) => 
                           ADDR_2_port, addr_out(1) => ADDR_1_port, addr_out(0)
                           => ADDR_0_port);
   PCO : PC port map( clk => CLK_port, rst => RST_port, enab => PC_EN, 
                           PC_IN(11) => PC_IN_11_port, PC_IN(10) => 
                           PC_IN_10_port, PC_IN(9) => PC_IN_9_port, PC_IN(8) =>
                           PC_IN_8_port, PC_IN(7) => PC_IN_7_port, PC_IN(6) => 
                           PC_IN_6_port, PC_IN(5) => PC_IN_5_port, PC_IN(4) => 
                           PC_IN_4_port, PC_IN(3) => PC_IN_3_port, PC_IN(2) => 
                           PC_IN_2_port, PC_IN(1) => PC_IN_1_port, PC_IN(0) => 
                           PC_IN_0_port, PC(11) => PC_11_port, PC(10) => 
                           PC_10_port, PC(9) => PC_9_port, PC(8) => PC_8_port, 
                           PC(7) => PC_7_port, PC(6) => PC_6_port, PC(5) => 
                           PC_5_port, PC(4) => PC_4_port, PC(3) => PC_3_port, 
                           PC(2) => PC_2_port, PC(1) => PC_1_port, PC(0) => 
                           PC_0_port);
   ( INC_OUT_11_port, INC_OUT_10_port, INC_OUT_9_port, INC_OUT_8_port, 
      INC_OUT_7_port, INC_OUT_6_port, INC_OUT_5_port, INC_OUT_4_port, 
      INC_OUT_3_port, INC_OUT_2_port, INC_OUT_1_port, INC_OUT_0_port ) <= 
      inc_out_pin;
   INC_inst : INC port map( inc_in(11) => A_OUT_11_port, inc_in(10) => 
      A_OUT_10_port, inc_in(9) => A_OUT_9_port, inc_in(8) => A_OUT_8_port, 
      inc_in(7) => A_OUT_7_port, inc_in(6) => A_OUT_6_port, inc_in(5) => 
      A_OUT_5_port, inc_in(4) => A_OUT_4_port, inc_in(3) => A_OUT_3_port, 
      inc_in(2) => A_OUT_2_port, inc_in(1) => A_OUT_1_port, inc_in(0) => 
      A_OUT_0_port, inc_out => inc_out_pin);
   M1 : mux12_2x1_0 port map( select_input => D_OUT_MUX, d_in_a(11) => 
                           PC_11_port, d_in_a(10) => PC_10_port, d_in_a(9) => 
                           PC_9_port, d_in_a(8) => PC_8_port, d_in_a(7) => 
                           PC_7_port, d_in_a(6) => PC_6_port, d_in_a(5) => 
                           PC_5_port, d_in_a(4) => PC_4_port, d_in_a(3) => 
                           PC_3_port, d_in_a(2) => PC_2_port, d_in_a(1) => 
                           PC_1_port, d_in_a(0) => PC_0_port, d_in_b(11) => 
                           D_IN_11_port, d_in_b(10) => D_IN_10_port, d_in_b(9) 
                           => D_IN_9_port, d_in_b(8) => D_IN_8_port, d_in_b(7) 
                           => D_IN_7_port, d_in_b(6) => D_IN_6_port, d_in_b(5) 
                           => D_IN_5_port, d_in_b(4) => D_IN_4_port, d_in_b(3) 
                           => D_IN_3_port, d_in_b(2) => D_IN_2_port, d_in_b(1) 
                           => D_IN_1_port, d_in_b(0) => D_IN_0_port, d_out(11) 
                           => D_OUT_11_port, d_out(10) => D_OUT_10_port, 
                           d_out(9) => D_OUT_9_port, d_out(8) => D_OUT_8_port, 
                           d_out(7) => D_OUT_7_port, d_out(6) => D_OUT_6_port, 
                           d_out(5) => D_OUT_5_port, d_out(4) => D_OUT_4_port, 
                           d_out(3) => D_OUT_3_port, d_out(2) => D_OUT_2_port, 
                           d_out(1) => D_OUT_1_port, d_out(0) => D_OUT_0_port);
   M2 : mux12_2x1_1 port map( select_input => PC_MUX, d_in_a(11) => 
                           A_IN_2_11_port, d_in_a(10) => A_IN_2_10_port, 
                           d_in_a(9) => A_IN_2_9_port, d_in_a(8) => 
                           A_IN_2_8_port, d_in_a(7) => A_IN_2_7_port, d_in_a(6)
                           => A_IN_2_6_port, d_in_a(5) => A_IN_2_5_port, 
                           d_in_a(4) => A_IN_2_4_port, d_in_a(3) => 
                           A_IN_2_3_port, d_in_a(2) => A_IN_2_2_port, d_in_a(1)
                           => A_IN_2_1_port, d_in_a(0) => A_IN_2_0_port, 
                           d_in_b(11) => INC_OUT_11_port, d_in_b(10) => 
                           INC_OUT_10_port, d_in_b(9) => INC_OUT_9_port, 
                           d_in_b(8) => INC_OUT_8_port, d_in_b(7) => 
                           INC_OUT_7_port, d_in_b(6) => INC_OUT_6_port, 
                           d_in_b(5) => INC_OUT_5_port, d_in_b(4) => 
                           INC_OUT_4_port, d_in_b(3) => INC_OUT_3_port, 
                           d_in_b(2) => INC_OUT_2_port, d_in_b(1) => 
                           INC_OUT_1_port, d_in_b(0) => INC_OUT_0_port, 
                           d_out(11) => PC_IN_11_port, d_out(10) => 
                           PC_IN_10_port, d_out(9) => PC_IN_9_port, d_out(8) =>
                           PC_IN_8_port, d_out(7) => PC_IN_7_port, d_out(6) => 
                           PC_IN_6_port, d_out(5) => PC_IN_5_port, d_out(4) => 
                           PC_IN_4_port, d_out(3) => PC_IN_3_port, d_out(2) => 
                           PC_IN_2_port, d_out(1) => PC_IN_1_port, d_out(0) => 
                           PC_IN_0_port);
   M3 : mux12_4x1_0 port map( select_input(1) => A_OUT_MUX_1_port, 
                           select_input(0) => A_OUT_MUX_0_port, d_in_a(11) => 
                           A_IN_1_11_port, d_in_a(10) => A_IN_1_10_port, 
                           d_in_a(9) => A_IN_1_9_port, d_in_a(8) => 
                           A_IN_1_8_port, d_in_a(7) => A_IN_1_7_port, d_in_a(6)
                           => A_IN_1_6_port, d_in_a(5) => A_IN_1_5_port, 
                           d_in_a(4) => A_IN_1_4_port, d_in_a(3) => 
                           A_IN_1_3_port, d_in_a(2) => A_IN_1_2_port, d_in_a(1)
                           => A_IN_1_1_port, d_in_a(0) => A_IN_1_0_port, 
                           d_in_b(11) => ADDR_11_port, d_in_b(10) => 
                           ADDR_10_port, d_in_b(9) => ADDR_9_port, d_in_b(8) =>
                           ADDR_8_port, d_in_b(7) => ADDR_7_port, d_in_b(6) => 
                           ADDR_6_port, d_in_b(5) => ADDR_5_port, d_in_b(4) => 
                           ADDR_4_port, d_in_b(3) => ADDR_3_port, d_in_b(2) => 
                           ADDR_2_port, d_in_b(1) => ADDR_1_port, d_in_b(0) => 
                           ADDR_0_port, d_in_c(11) => PC_11_port, d_in_c(10) =>
                           PC_10_port, d_in_c(9) => PC_9_port, d_in_c(8) => 
                           PC_8_port, d_in_c(7) => PC_7_port, d_in_c(6) => 
                           PC_6_port, d_in_c(5) => PC_5_port, d_in_c(4) => 
                           PC_4_port, d_in_c(3) => PC_3_port, d_in_c(2) => 
                           PC_2_port, d_in_c(1) => PC_1_port, d_in_c(0) => 
                           PC_0_port, d_in_d(11) => X_Logic0_port, d_in_d(10) 
                           => X_Logic0_port, d_in_d(9) => X_Logic0_port, 
                           d_in_d(8) => X_Logic0_port, d_in_d(7) => 
                           X_Logic0_port, d_in_d(6) => X_Logic0_port, d_in_d(5)
                           => X_Logic0_port, d_in_d(4) => X_Logic0_port, 
                           d_in_d(3) => X_Logic0_port, d_in_d(2) => 
                           X_Logic0_port, d_in_d(1) => X_Logic0_port, d_in_d(0)
                           => X_Logic0_port, d_out(11) => A_OUT_11_port, 
                           d_out(10) => A_OUT_10_port, d_out(9) => A_OUT_9_port
                           , d_out(8) => A_OUT_8_port, d_out(7) => A_OUT_7_port
                           , d_out(6) => A_OUT_6_port, d_out(5) => A_OUT_5_port
                           , d_out(4) => A_OUT_4_port, d_out(3) => A_OUT_3_port
                           , d_out(2) => A_OUT_2_port, d_out(1) => A_OUT_1_port
                           , d_out(0) => A_OUT_0_port);
   ( A_IN_1_11_port, A_IN_1_10_port, A_IN_1_9_port, A_IN_1_8_port, 
      A_IN_1_7_port, A_IN_1_6_port, A_IN_1_5_port, A_IN_1_4_port, A_IN_1_3_port
      , A_IN_1_2_port, A_IN_1_1_port, A_IN_1_0_port ) <= D_OUT_2_pin;
   ( FLAGS_3_port, FLAGS_2_port, FLAGS_1_port, FLAGS_0_port ) <= FLAGS_pin_port
      ;
   DP : datapath port map( CLK => CLK_port, RST => RST_port, D_OUT_1(11) => 
      A_IN_2_11_port, D_OUT_1(10) => A_IN_2_10_port, D_OUT_1(9) => 
      A_IN_2_9_port, D_OUT_1(8) => A_IN_2_8_port, D_OUT_1(7) => A_IN_2_7_port, 
      D_OUT_1(6) => A_IN_2_6_port, D_OUT_1(5) => A_IN_2_5_port, D_OUT_1(4) => 
      A_IN_2_4_port, D_OUT_1(3) => A_IN_2_3_port, D_OUT_1(2) => A_IN_2_2_port, 
      D_OUT_1(1) => A_IN_2_1_port, D_OUT_1(0) => A_IN_2_0_port, D_OUT_2 => 
      D_OUT_2_pin, FLAGS => FLAGS_pin_port, D_IN(11) => D_OUT_11_port, D_IN(10)
      => D_OUT_10_port, D_IN(9) => D_OUT_9_port, D_IN(8) => D_OUT_8_port, 
      D_IN(7) => D_OUT_7_port, D_IN(6) => D_OUT_6_port, D_IN(5) => D_OUT_5_port
      , D_IN(4) => D_OUT_4_port, D_IN(3) => D_OUT_3_port, D_IN(2) => 
      D_OUT_2_port, D_IN(1) => D_OUT_1_port, D_IN(0) => D_OUT_0_port, FC_SEL =>
      FC_SEL, REG_EN => REG_EN, OP(5) => OP_5_port, OP(4) => OP_4_port, OP(3) 
      => OP_3_port, OP(2) => OP_2_port, OP(1) => OP_1_port, OP(0) => OP_0_port,
      SEL_IN(1) => SEL_IN_1_port, SEL_IN(0) => SEL_IN_0_port, SEL_OUT_A(1) => 
      SEL_OUT_A_1_port, SEL_OUT_A(0) => SEL_OUT_A_0_port, SEL_OUT_B(1) => 
      SEL_OUT_B_1_port, SEL_OUT_B(0) => SEL_OUT_B_0_port, SEL_OUT_C(1) => 
      SEL_OUT_C_1_port, SEL_OUT_C(0) => SEL_OUT_C_0_port);
   X_Logic0_port <= '0';
   n1 <= '0';

end SYN_RTL;
