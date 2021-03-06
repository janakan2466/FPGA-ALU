--Janakan Sivaloganathan
--500960836
--COE 328 DIGITAL SYSTEMS

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ssegME IS
	PORT (bcd    :IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
			neg    :IN   STD_LOGIC;
			leds   :OUT STD_LOGIC_VECTOR(0 TO 6);
			ledss  :OUT STD_LOGIC_VECTOR(0 TO 6) );
END ssegME;

ARCHITECTURE Behaviour OF ssegME IS 
BEGIN 

	PROCESS (neg, bcd)
	BEGIN 
		
		CASE neg IS
			WHEN '1'     =>ledss<= "0000001";
			WHEN OTHERS  =>ledss<= "0000000";

		END CASE;

		CASE bcd IS					--	abcdefg
			WHEN "0000"   =>leds<= "1111110"; --0
			WHEN "0001"   =>leds<= "0110000"; --1
			WHEN "0010"   =>leds<= "1101101"; --2
			WHEN "0011"   =>leds<= "1111001"; --3
			WHEN "0100"   =>leds<= "0110011"; --4
			WHEN "0101"   =>leds<= "1011011"; --5
			WHEN "0110"   =>leds<= "1011111"; --6
			WHEN "0111"   =>leds<= "1110000"; --7
			WHEN "1000"   =>leds<= "1111111"; --8
			WHEN OTHERS   =>leds<= "1001111"; --(null) prints E if the states go over 8 (max is 8)
		END CASE;
	END PROCESS;
END Behaviour;

