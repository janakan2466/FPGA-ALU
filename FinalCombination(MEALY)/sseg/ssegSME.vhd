--Janakan Sivaloganathan
--500960836
--COE 328 DIGITAL SYSTEMS

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY ssegSME IS
	PORT (bcd    :IN   STD_LOGIC_VECTOR(3 DOWNTO 0);
			neg    :IN   STD_LOGIC;
			leds   :OUT STD_LOGIC_VECTOR(0 TO 6);
			ledss  :OUT STD_LOGIC_VECTOR(0 TO 6) );
END ssegSME;

ARCHITECTURE Behaviour OF ssegSME IS 
BEGIN 

	PROCESS (neg, bcd)
	BEGIN 
		
		CASE neg IS
			WHEN '1'     =>ledss<= "0000001";
			WHEN OTHERS  =>ledss<= "0000000";

		END CASE;

		CASE bcd IS					--	abcdefg
			WHEN "0000"   =>leds<= "1111110"; --0
			WHEN "0011"   =>leds<= "1111001"; --3
			WHEN "0101"   =>leds<= "1011011"; --5
			WHEN "0110"   =>leds<= "1011111"; --6
			WHEN "1000"   =>leds<= "1111111"; --8
			WHEN "1001"   =>leds<= "1111011"; --9
			WHEN OTHERS   =>leds<= "1001111"; --(other values are represented as E)
		END CASE;
	END PROCESS;
END Behaviour;

