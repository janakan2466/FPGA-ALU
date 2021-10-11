--Janakan Sivaloganathan
--500960836
--COE 328 DIGITAL SYSTEMS

library ieee;
use ieee.std_logic_1164.all;
entity lab5 is
	port
	(
		clk   :in  std_logic;
		data_in :in std_logic;
		reset :in std_logic;
		student_id :out std_logic_vector(3 downto 0);
		current_state :out std_logic_vector(3 downto 0));
end entity;
architecture fsm of lab5 is 
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

--Since this is a Mealy Machine, the output depends on the primary input (w) or (data_in) to present a specific output
--The process statement determines which variables what the outputs will be sensistive to, in this case the state and primary input
--the state of the machine is not dependant of any other variable (current state) so the outputs are only represented by
--the current state and the input data (1 if statement to represent its change in transition line and next state)
--the mealy machine outputs the nextstate and nextstate output immediately as it outputs on its transition line
process (yfsm, data_in)
begin 
	case yfsm is
		when s0=> 
			IF data_in = '1' THEN
			student_id <= "0000"; -- Output when w= 1
			current_state<= "0100"; -- Next state w=1
			ELSE 
			student_id <= "0101"; -- Output when w=0
			current_state<= "0000"; --Next state w=0
			END IF;
			
		when s1=>
			IF data_in = '1' THEN 
			student_id <= "0000"; -- Output when w= 1
			current_state<= "1000"; -- Next state w=1
			ELSE 
			student_id <= "0110"; -- Output when w=0
			current_state<= "0001"; --Next state w=0
			END IF;
			
		when s2=>
			IF data_in = '1' THEN
			student_id <= "0110"; -- Output when w= 1
			current_state<= "0001"; -- Next state w=1
			ELSE 
			student_id <= "1001"; -- Output when w=0
			current_state<= "0010"; --Next state w=0
			END IF;
			
		when s3=>
			IF data_in = '1' THEN
			student_id <= "1001"; -- Output when w= 1
			current_state<= "0010"; -- Next state w=1
			ELSE 
			student_id <= "0000"; -- Output when w=0
			current_state<= "0011"; --Next state w=0
			END IF;
			
		when s4=>
			IF data_in = '1' THEN
			student_id <= "0000"; -- Output when w= 1
			current_state<= "0011"; -- Next state w=1
			ELSE 
			student_id <= "0000"; -- Output when w=0
			current_state<= "0100"; --Next state w=0
			END IF;
			
		when s5=>
			IF data_in = '1' THEN
			student_id <= "0101"; -- Output when w= 1
			current_state<= "0000"; -- Next state w=1
			ELSE 
			student_id <= "0110"; -- Output when w=0
			current_state<= "0101"; --Next state w=0
			END IF;
			
		when s6=>
			IF data_in = '1' THEN
			student_id <= "0110"; -- Output when w= 1
			current_state<= "0101"; -- Next state w=1
			ELSE  
			student_id <= "0011"; -- Output when w=0
			current_state<= "0110"; --Next state w=0
			END IF;
			
		when s7=>
			IF data_in = '1' THEN
			student_id <= "0011"; -- Output when w= 1
			current_state<= "0110"; -- Next state w=1
			ELSE 
			student_id <= "1000"; -- Output when w=0
			current_state<= "0111"; --Next state w=0
			END IF;
			
		when s8=>
			IF data_in = '1' THEN
			student_id <= "1000"; -- Output when w= 1
			current_state<= "0111"; -- Next state w=1
			ELSE 
			student_id <= "0000"; -- Output when w=0
			current_state<= "1000"; --Next state w=0
			END IF;
		
		when OTHERS =>
		current_state<= "1110"; --represents the binary number 14 which is displayed as "E" in hexidecimal, this is to minimize								--error
			student_id<= "1110"; --error
			
	end case;
end process;
end architecture;