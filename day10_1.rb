print "Advent of Code 2020 Day 10 Part 1\n"

adapters = File.read("day10_input.txt").split("\n").map{|x| x.to_i}

current_jolt = 0
differences = [0, 0, 0, 0, 0]

adapters.sort.each{|x|
	differences[x - current_jolt] += 1
	current_jolt = x
}

differences[3] += 1 # device input

puts "We have these differences: #{differences}\n"
puts "Answer: #{differences[1]} * #{differences[3]} = #{differences[1] * differences[3]}\n"
