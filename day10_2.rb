print "Advent of Code 2020 Day 10 Part 2\n"
# Works with examples but runs looooong (infinite?) for puzzle input

$adapters = File.read("day10_input.txt").split("\n").map{|x| x.to_i}
$adapters << 0 #socket
$adapters.sort!

puts "Adapters: #{$adapters}\n"

current_jolt = 0
differences = [0, 0, 0, 0, 0]

possibilities = 0

def find_next_adapters(i)
	ret = 0
	(1..5).each{|x|
		break unless i + x < $adapters.size

		case $adapters[i + x] - $adapters[i]
			when 1..3
				ret += find_next_adapters(i + x)
			else
				break
		end
	}
	if i == $adapters.size - 1
		ret = 1
	end
	return ret
end

puts "Answer: #{find_next_adapters(0)} possibilities\n"
