print "Advent of Code 2020 Day 8 Part 1\n"

program = File.read("day08_input.txt").split("\n").map{|x| x.split(" ") << false}


accumulator = 0
instruction_counter = 0
step_counter = 0

#puts "Program is parsed as: #{program}"

while true
	unless (0...program.size).include?(instruction_counter)
		puts "Instruction counter of #{instruction_counter} is out of range, exiting."
		break
	end
	if program[instruction_counter][2] == true
		puts "Endless loop detected, revisiting instruction #{instruction_counter} after #{step_counter} steps, exiting."
		break
	end

	instruction = program[instruction_counter]
	program[instruction_counter][2] = true
	case instruction[0]
		when "nop"
			instruction_counter += 1
		when "acc"
			accumulator += instruction[1].to_i
			instruction_counter += 1
		when "jmp"
			instruction_counter += instruction[1].to_i
	end
	step_counter += 1
end

puts "Accumulator value: #{accumulator}"