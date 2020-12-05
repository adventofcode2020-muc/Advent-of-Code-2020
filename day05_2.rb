print "Advent of Code 2020 Day 4 Part 2\n"

passes = File.read("day05_input.txt").split("\n")

highest_id = 0
seats = []

passes.each{|p|
	row = [0, 127]
	col = [0, 7]

	p.split('').each{|c|
		row[1] = (row[0] + row[1] - 1) / 2 if c == "F"
		row[0] = (row[0] + row[1] + 1) / 2 if c == "B"
		col[1] = (col[0] + col[1] - 1) / 2 if c == "L"
		col[0] = (col[0] + col[1] + 1) / 2 if c == "R"
	}
	col = col[0]
	row = row[0]

	seat_id = row * 8 + col
	seats << seat_id

	highest_id = seat_id if highest_id < seat_id
}

seats.sort!

previous_seat = seats[0] - 1

seats.each{|s|
	previous_seat += 1

	while(previous_seat < s) do
		print "seat #{previous_seat} is missing in the list\n"
		previous_seat += 1
	end
}
