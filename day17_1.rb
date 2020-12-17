print "Advent of Code 2020 Day 17 Part 1\n"

puzzle = [File.read("day17_input.txt").split("\n").map{|x| x.split('')}]

def state(puzzle, x, y, z)
	return "." if x < 0 or y < 0 or z < 0
	return "." if z >= puzzle.size or y >= puzzle[0].size or x >= puzzle[0][0].size
	return puzzle[z][y][x]
end

def active_neighbors(puzzle, x, y, z)
	active = 0
	(-1..1).each{|dx|
		(-1..1).each{|dy|
			(-1..1).each{|dz|
				next if dx == 0 and dy == 0 and dz == 0 # don't test myself
				dz = 1 if dz == -1 and z == 0 # we don't simulate negative z coordinates
				next if x + dx < 0 or y + dy < 0 or z + dz < 0 # don't test negatives
				next if puzzle[z + dz].nil? or puzzle[z + dz][y + dy].nil?
				active += 1 if puzzle[z + dz][y + dy][x + dx] == "#"
			}
		}
	}

	return active
end

def count_active(puzzle)
	active = 0
	(0...puzzle.size).each{|z|
		(0...puzzle[0].size).each{|y|
			(0...puzzle[0][0].size).each{|x|
				if z > 0
					# we don't simulate negative z coordinates as it's the same for positives
					# so simply add it twice while counting
					active += 2 if puzzle[z][y][x] == "#"
				else
					active += 1 if puzzle[z][y][x] == "#"
				end
			}
		}
	}

	return active
end

puts "total active: #{count_active(puzzle)}"


def print(puzzle)
	(0...puzzle.size).each{|z|
		puts "z = #{z}"
		(0...puzzle[0].size).each{|y|
			puts puzzle[z][y].join ''
		}
	}
end

next_puzzle = []
(0...6).each{|c|
	puts ""
	puts "cycle #{c + 1}:"
	(0..puzzle.size).each{|z|
	next_puzzle[z] = []
		(-1..puzzle[0].size).each{|y|
		next_puzzle[z][y + 1] = []
			(-1..puzzle[0][0].size).each{|x|
				case state(puzzle, x, y, z)
					when "."
						case active_neighbors(puzzle, x, y, z)
							when 3
								next_puzzle[z][y + 1][x + 1] = "#"
							else
								next_puzzle[z][y + 1][x + 1] = "."
						end
					when "#"
						case active_neighbors(puzzle, x, y, z)
							when 2..3
								next_puzzle[z][y + 1][x + 1] = "#"
							else
								next_puzzle[z][y + 1][x + 1] = "."
						end
				end
			}
		}
	}
	#print(next_puzzle)
	puzzle = next_puzzle.clone.map(&:clone)
	puts "total active: #{count_active(puzzle)}"

}