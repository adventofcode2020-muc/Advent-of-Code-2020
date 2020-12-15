print "Advent of Code 2020 Day 14 Part 1\n"

program = File.read("day14_input.txt").split("\n")
memory = []
mask_and = 1
mask_or = 0

program.each{|p|
	case p[0..3]
		when "mask"
			#puts "mask:   #{p[7..-1]}"
			mask_and = p[7..-1].gsub("X", "1").to_i(2)
			mask_or  = p[7..-1].gsub("X", "0").to_i(2)
		when "mem["
			address = p.match(/\[(\d+)\]/)[1].to_i
			value = p.match(/(\d+)$/)[1].to_i
			#puts "value:  #{value.to_s(2)} (decimal #{value.to_s})"
			value = value & mask_and
			value = value | mask_or
			memory[address] = value
			#puts "result: #{value.to_s(2)} (decimal #{value.to_s})"
	end
}

sum = 0
memory.each{|m| sum += m unless m.nil?}

puts "sum of all values: #{sum}"