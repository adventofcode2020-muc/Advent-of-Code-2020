print "Advent of Code 2020 Day 7 Part 1\n"

rules = File.read("day07_input.txt").split("\n")
rules_parsed = []

rules.each{|r|
	match = r.match(/(\w+\s\w+) bags contain (?:(\d) (\w+\s\w+) bag(?:s)?(?:, (\d) (\w+\s\w+) bag(?:s)?)?(?:, (\d) (\w+\s\w+) bag(?:s)?)?(?:, (\d) (\w+\s\w+) bag(?:s)?)?|(no other bags)).$/)
	outer_bag = ""
	bag_count = nil
	this_rules = []
	(1..(match.size)).each{|i|
		case i
			when 1
				outer_bag = match[1]
			when 2, 4, 6, 8
				bag_count = match[i].to_i
			when 3, 5, 7, 9
				this_rules << [bag_count, match[i]] unless bag_count == 0
			when 10
				rules_parsed << [outer_bag, this_rules]
		end
	}
}

# puts "Parsed rules:\n"
# rules_parsed.each{|r|
#	puts "#{r[0]}\n"
#	r[1].each{|c|
#		puts "  contains #{c[0]} #{c[1]}"
#	}
#}

can_contain_bag = []
can_contain_size = 0

# fetch bags that can contain my shiny gold bag
rules_parsed.each{|r|
	r[1].each{|c|
		if(c[1] == "shiny gold")
			puts "#{r[0]} can contain #{c[0]} #{c[1]} bags\n"
			can_contain_bag << r[0]
		end
	}
}

# fetch other bags that can contain these bags until we don't find any more
loop do
	can_contain_size = can_contain_bag.size

	puts "-> trying to find bags that can contain already found #{can_contain_bag.size} bags\n"
	rules_parsed.each{|r|
		r[1].each{|c|
			if(can_contain_bag.include?(c[1]))
				puts "  #{r[0]} can contain #{c[0]} #{c[1]} bags\n"
				can_contain_bag << r[0]
			end
		}
	}
	can_contain_bag.uniq!
break if can_contain_size == can_contain_bag.size
end

print "In the end #{can_contain_bag.size} bags can contain a shiny gold bag\n"