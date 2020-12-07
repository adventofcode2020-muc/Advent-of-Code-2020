print "Advent of Code 2020 Day 7 Part 2\n"

rules = File.read("day07_input.txt").split("\n")
$rules_parsed = []

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
				$rules_parsed << [outer_bag, this_rules]
		end
	}
}

# recursive count bags included (including the "calling" bag)
def contains_bags(bag_name)
	ret = 0
	$rules_parsed.each{|r|
		if(r[0] == bag_name)
			puts "#{r[0]} contains #{r[1]}\n" if r[1].size > 0
			ret += 1
			r[1].each{|b|
				ret += b[0] * contains_bags(b[1])
			}
			return ret
		end
	}
	return ret # not needed with current rules design, just for clarity
end

puts "We have to carry #{contains_bags("shiny gold") - 1} bags inside our shiny gold bag\n"
