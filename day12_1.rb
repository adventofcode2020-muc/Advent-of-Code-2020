print "Advent of Code 2020 Day 12 Part 1\n"

instructions = File.read("day12_input.txt").split("\n").map{|x| [x[0], x[1..9].to_i]}

position = [0, 0]
direction = 90

instructions.each{|i|
	case i[0]
		when "N"
			position[1] += i[1]
		when "S"
			position[1] -= i[1]
		when "E"
			position[0] += i[1]
		when "W"
			position[0] -= i[1]
		when "L"
			direction -= i[1]
		when "R"
			direction += i[1]
		when "F"
			case direction #duplication of code above
				when 0
					position[1] += i[1]
				when 90
					position[0] += i[1]
				when 180
					position[1] -= i[1]
				when 270
					position[0] -= i[1]
			end
	end
	direction = (direction + 360) % 360
}

puts "Navigation leads to E#{position[0]} and N#{position[1]} which is Manhattan distance #{position[0].abs + position[1].abs}"