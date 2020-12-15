print "Advent of Code 2020 Day 14 Part 2\n"

program = File.read("day14_input.txt").split("\n")
memory = {}
mask = ""
floating = []

program.each{|p|
	case p[0..3]
		when "mask"
			mask = p[7..-1]
			floating.clear
			mask.split('').each_with_index{|c, i|
				floating << i if c == "X"
			}
			floating.reverse!
		when "mem["
			address = p.match(/\[(\d+)\]/)[1].to_i
			value = p.match(/(\d+)$/)[1].to_i

			mask_and = mask.gsub("0", "1").gsub("X", "0").to_i(2)
			mask_or  = mask.gsub("X", "0").to_i(2)

			# apply mask with all X places set to zero
			address = address & mask_and
			address = address | mask_or

			# apply all combinations for X in mask
			(0...(2 ** floating.size)).each{|i|
				floating_inserts = i.to_s(2).reverse
				c = 0
				floating_mask = mask.gsub("1", "0")
				floating.each{|f|
					if c < floating_inserts.size
						floating_mask[f] = floating_inserts[c]
					else
						floating_mask[f] = "0"
					end
					c += 1
				}

				# apply floating mask to address
				newaddress = address | floating_mask.to_i(2)

				memory[newaddress.to_s.to_sym] = value
			}
	end
}

sum = 0
memory.each{|k, v| sum += v}

puts "sum of all values: #{sum}"