print "Advent of Code 2020 Day 9 Part 2\n"

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

		found = false
		(0...xmas_data.size).each{|a|
			((a+1)...xmas_data.size).each{|b|
				sum = 0
				smallest = x
				largest = 0
				(a..b).each{|c|
					sum += xmas_data[c]
					smallest = xmas_data[c] if xmas_data[c] < smallest
					largest = xmas_data[c] if xmas_data[c] > largest
				}
				break if sum > x # because numbers only will get larger

				if sum == x
					found = true
					puts "Numbers from index #{a} to #{b} sum up to #{x}. #{smallest} + #{largest} = #{smallest + largest}\n"
				end

				break if found
			}
			break if found
		}

		break
	end
}