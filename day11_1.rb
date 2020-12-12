print "Advent of Code 2020 Day 11 Part 1\n"

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
					new[r][c] = "L" if occupied_seats(seats, r, c) >= 4
				when "."
					# nobody sits on the floor
			end
		}
	}
	return new
end

def occupied_seats(seats, row, col)
	occupied = 0
	((row - 1)..(row + 1)).each{|r|
		((col - 1)..(col + 1)).each{|c|
			next if r < 0 or  c < 0
			next unless r < seats.size && c < seats[0].size
			next if r == row and c == col

			case seats[r][c]
				when "L"
				when "#"
					occupied += 1
				when "."
			end
		}
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
