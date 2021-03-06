print "Advent of Code 2020 Day 3 Part 1\n"

forest = File.read("day03_input.txt").split("\n")

slopes = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]
answer = 1

slopes.each {|slope|

	trees = 0
	steps = 0
	position = [0, 0]
	run = true

	while run
		position[0] = (position[0] + slope[0]) % forest[0].size
		position[1] = (position[1] + slope[1])

		break if position[1] < 0 || position[1] >= forest.size

		steps += 1
		trees += 1 if forest[position[1]][position[0]] == '#'
	end

	print "Doing #{steps} steps we found #{trees} trees\n"

	answer *= trees
}

print "puzzle answer is #{answer}\n"
