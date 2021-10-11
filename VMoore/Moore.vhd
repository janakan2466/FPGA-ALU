--Janakan Sivaloganathan
--500960836
--COE 328 DIGITAL SYSTEMS

library ieee;
use ieee.std_logic_1164.all;
entity Moore is
	port
	(
		clk   :in  std_logic;
		data_in :in std_logic;
		reset :in std_logic;
		student_id :out std_logic_vector(3 downto 0);
		current_state :out std_logic_vector(3 downto 0));
end entity;
architecture fsm of Moore is 
	type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
	signal yfsm : state_type;
begin	
-- the clock is the only synchronous impact for the next states, if it is clocked and the data is eithe 0 or 1 it changes state
-- reset is the asynchronous switch to reset the state back to its original
	process (clk, reset)
	begin 
	
		if reset = '1' then
			yfsm <= s0;
		elsif (clk 'EVENT AND clk = '1') then	
		case yfsm is 
			when s0=> 
				IF data_in = '1' THEN
				yfsm <= s4; --state 0 goes to state 4 if clocked with an input of '1'
				ELSE 
				yfsm <= s0; --else stay the same
				END IF;
				
			when s1=> 
				IF data_in = '1' THEN
				yfsm <= s8; --state 1 goes to state 8 if clocked with an input of '1'
				ELSE
				yfsm <= s1; --else stay the same
				END IF;
				
			when s2=> 
				IF data_in = '1' THEN
				yfsm <= s1; --state 2 goes to state 1 if clocked with an input of '1'
				ELSE
				yfsm <= s2; --else stay the same
				END IF;
				
			when s3=> 
				IF data_in = '1' THEN
				yfsm <= s2; --state 3 goes to state 2 if clocked with an input of '1'
				ELSE
				yfsm <= s3; --else stay the same
				END IF;
				
			when s4=> 
				IF data_in = '1' THEN
				yfsm <= s3; --state 4 goes to state 3 if clocked with an input of '1'
				ELSE
				yfsm <= s4; --else stay the same
				END IF;
				
			when s5=> 
				IF data_in = '1' THEN
				yfsm <= s0; --state 5 goes to state 0 if clocked with an input of '1'
				ELSE
				yfsm <= s5; --else stay the same
				END IF;
				
			when s6=> 
				IF data_in = '1' THEN
				yfsm <= s5; --state 6 goes to state 5 if clocked with an input of '1'
				ELSE
				yfsm <= s6; --else stay the same
				END IF;
				
			when s7=> 
				IF data_in = '1' THEN
				yfsm <= s6; --state 7 goes to state 6 if clocked with an input of '1'
				ELSE
				yfsm <= s7; --else stay the same
				END IF;
				
			when s8=> 
				IF data_in = '1' THEN
				yfsm <= s7; --state 8 goes to state 7 if clocked with an input of '1'
				ELSE
				yfsm <= s8; --else stay the same
				END IF;
				
		end case;
	end if;
end process;

--Since this is a Moore Machine, the output are dependant on the present state. (Whatever number is present)
--in the state is outputted.
--The process statement showcases that for the Moore state machine the process only depends on the present state yfsm
--data_input is removed as the process is no longer dependant
--the next state of the machine is not dependant of any other variable aside from input 
--and this is recongnizable for both Mealy and Moore
process (yfsm)
begin 
	case yfsm is
		when s0=> 
		current_state<= "0000"; --0
		student_id <= "0101"; --5
			
		when s1=>
		current_state<= "0001"; --1
		student_id <= "0110"; --6
			
		when s2=>
		current_state<= "0010"; --2
		student_id <= "1001"; --9
			
		when s3=>
		current_state<= "0011"; --3
		student_id <= "0000"; --0
			
		when s4=>
		current_state<= "0100"; --4
		student_id <= "0000"; --0
			
		when s5=>
		current_state<= "0101"; --5
		student_id <= "0110"; --6
			
		when s6=>
		current_state<= "0110"; --6
		student_id <= "0011"; --3
			
		when s7=>
		current_state<= "0111"; --7
		student_id <= "1000"; --8
			
		when s8=>
		current_state<= "1000"; --8
		student_id <= "0000"; --0
		
		when OTHERS =>
		current_state<= "1110"; --represents the binary number 14 which is displayed as "E" in hexidecimal, this is to minimize								--error
			student_id<= "1110"; --error
			
	end case;
end process;
end architecture;