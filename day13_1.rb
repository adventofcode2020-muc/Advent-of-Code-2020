print "Advent of Code 2020 Day 13 Part 1\n"

file = File.read("day13_input.txt").split("\n")
timestamp = file[0].to_i
busses = file[1].split(",")
next_bus = 0
wait_time = 999

busses.each{|b|
	next if b == "x"
	b = b.to_i
	residuum = timestamp % b
	next_depart = timestamp - residuum + b
	this_wait_time = next_depart - timestamp
	puts "Would have to wait #{this_wait_time} minutes for bus ID #{b}"
	if this_wait_time < wait_time #there's exactly one
		next_bus = b
		wait_time = this_wait_time
	end
}

puts "Next bus ID #{next_bus} departs in #{wait_time} minutes; answer: #{next_bus * wait_time}"