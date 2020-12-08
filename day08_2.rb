print "Advent of Code 2020 Day 8 Part 2\n"

solution_found = false
solution_counter = -1

while solution_found == false
	solution_counter += 1
	program = File.read("day08_input.txt").split("\n").map{|x| x.split(" ") << false}

	if solution_counter == program.size
		puts "Can't find solution, tried all possibilities\n"
		break
	end

	puts "Trying to change operation #{solution_counter}\n"
	case program[solution_counter][0]
		when "nop"
			program[solution_counter][0] = "jmp"
		when "jmp"
			program[solution_counter][0] = "nop"
		else
			next
	end

	accumulator = 0
	instruction_counter = 0
	step_counter = 0

	#puts "Program is parsed as: #{program}"

	while true
		if instruction_counter == program.size
			puts "Program terminated after #{step_counter} steps."
			solution_found = true
			break
		end
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
end