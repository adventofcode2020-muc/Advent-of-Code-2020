print "Advent of Code 2020 Day 13 Part 2\n"

file = File.read("day13_input.txt").split("\n")
timestamp = 100000000000000
busses = file[1].split(",")
found = false

def does_bus_depart_at?(bus, timestamp)
	#puts "does #{bus} depart at #{timestamp}: #{timestamp % bus == 0 ? "true" : "false"}"
	return true if timestamp % bus == 0
	return false
end

# set first timestamp to a fitting multiple of largest bus id schedule
# this is not enough to find solution in a timely manner - a better algorithm is needed
largest_bus = 0
largest_bus_index = 0
busses.each_with_index{|b, i|
	next if b == "x"
	if b.to_i > largest_bus
		largest_bus = b.to_i
		largest_bus_index = i
	end
}

timestamp = timestamp - (timestamp % largest_bus) - largest_bus_index

while true do
	timestamp += largest_bus
	puts "Testing timestamp #{timestamp.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse}" if timestamp % 1000000 == 0

	busses.each_with_index{|b, i|
		next if b == "x"
		break unless does_bus_depart_at?(b.to_i, timestamp + i)
		found = true if i == busses.size - 1
	}
	break if found
end

puts "Timestamp is #{timestamp}"