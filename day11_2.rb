print "Advent of Code 2020 Day 11 Part 2\n"

seats = File.read("day11_input.txt").split("\n").map{|x| x.split ''}


def output_seats(seats)
	seats.each{|r|
		puts "#{r.join}\n"
	}
end

def apply_seat_rules(seats)
	new = seats.clone.map(&:clone)
	seats.each_with_index{|row, r|
		row.each_with_index{|s, c|
			case s
				when "L"
					new[r][c] = "#" if occupied_seats(seats, r, c) == 0
				when "#"
					new[r][c] = "L" if occupied_seats(seats, r, c) >= 5
				when "."
					# nobody sits on the floor
			end
		}
	}
	return new
end

def occupied_seats(seats, row, col)
	occupied = 0

	# down
	((row + 1)...seats.size).each{|r|
		case seats[r][col]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}
	# up
	(0..(row - 1)).reverse_each{|r|
		case seats[r][col]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}
	# right
	((col + 1)...seats[0].size).each{|c|
		case seats[row][c]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}
	# left
	(0..(col - 1)).reverse_each{|c|
		case seats[row][c]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}
	# down-right
	(1...seats.size).each{|i|
		break unless row + i < seats.size and col + i < seats[0].size
		case seats[row + i][col + i]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}
	# down-left
	(1...seats.size).each{|i|
		break unless row + i < seats.size and col - i >= 0
		case seats[row + i][col - i]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}
	# top-left
	(1...seats.size).each{|i|
		break unless row - i >= 0 and col - i >= 0
		case seats[row - i][col - i]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}
	# top-right
	(1...seats.size).each{|i|
		break unless row - i >= 0 and col + i < seats[0].size
		case seats[row - i][col + i]
			when "L"
				break
			when "#"
				occupied += 1
				break
			when "."
		end
	}

	return occupied
end

def occupied_seats_total(seats)
	occupied = 0
	(0...seats.size).each{|r|
		(0...seats[r].size).each{|c|
			occupied += 1 if seats[r][c] == "#"
		}
	}
	return occupied
end

while true do
	new_seats = apply_seat_rules(seats)
	break if new_seats == seats

	#output_seats(new_seats)
	puts("occupied seats: #{occupied_seats_total(new_seats)}\n")

	seats = new_seats
end
