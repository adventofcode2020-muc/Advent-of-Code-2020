print "Advent of Code 2020 Day 9 Part 1\n"

xmas_data = File.read("day09_input.txt").split("\n").map{|x| x.to_i}

preamble = 25

xmas_data.each_with_index{|x, i|
	next if i < preamble

	valid = false
	((i - preamble)...i).each{|a|
		((i - preamble)...i).each{|b|
			next if a == b
			valid = true if xmas_data[a] + xmas_data[b] == x
			break if valid
		}
		break if valid
	}

	unless valid
		puts "Value #{x} at index #{i} isn't valid anymore\n"
		break
	end
}