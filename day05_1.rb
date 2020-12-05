print "Advent of Code 2020 Day 4 Part 1\n"

passes = File.read("day05_input.txt").split("\n")

highest_id = 0

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
	#print "boarding pass #{p} in row #{row} column #{col} has seat ID #{seat_id}\n"

	highest_id = seat_id if highest_id < seat_id
}

print "Highest seat ID: #{highest_id}\n"