print "Advent of Code 2020 Day 12 Part 2\n"

instructions = File.read("day12_input.txt").split("\n").map{|x| [x[0], x[1..9].to_i]}

position = [0, 0]
waypoint = [10, 1]

instructions.each{|i|
	case i[0]
		when "N"
			waypoint[1] += i[1]
		when "S"
			waypoint[1] -= i[1]
		when "E"
			waypoint[0] += i[1]
		when "W"
			waypoint[0] -= i[1]
		when "L", "R"
			temp_waypoint = waypoint.clone
			i[1] = 360 - i[1] if i[0] == "L"
			case i[1]
				when 90
					waypoint[0] = temp_waypoint[1]
					waypoint[1] = - temp_waypoint[0]
				when 180
					waypoint[0] = - temp_waypoint[0]
					waypoint[1] = - temp_waypoint[1]
				when 270
					waypoint[0] = - temp_waypoint[1]
					waypoint[1] = temp_waypoint[0]
			end
		when "F"
			i[1].times{
				position[0] += waypoint[0]
				position[1] += waypoint[1]
			}
	end
	#puts "Navigation leads to E#{position[0]} and N#{position[1]}, waypoint E#{waypoint[0]}, N#{waypoint[1]}"
}

puts "Navigation leads to E#{position[0]} and N#{position[1]} which is Manhattan distance #{position[0].abs + position[1].abs}"
